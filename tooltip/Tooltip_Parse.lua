--[[--------------------------------------------------------------------------------
  ItemSync Tooltip Parsing Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]


function ItemSync:Parse(coreid, link)

	if (not self.db.account[self.realm]["items"][coreid]) then return nil; end
	if (not GetItemInfo(link)) then return nil; end --only parse valid items
	
		--check stored name and update if needed
		if (self.db.account[self.realm]["names"][coreid] ~= GetItemInfo(link)) then
			self.db.account[self.realm]["names"][coreid] = GetItemInfo(link)
		end
		

	--////////////////////////
	ISyncTooltip:ClearLines();
	ISyncTooltip:SetOwner(UIParent, "ANCHOR_BOTTOMRIGHT");
	ISyncTooltip:SetHyperlink(link);
	--////////////////////////
	
	local sTipLeft;
	local sTipRight;
	local sParseLink;

	sTipLeft = "ISyncTooltipTextLeft";
	sTipRight = "ISyncTooltipTextRight";
	
	--make sure we have tooltip info to work with
	if(not sTipLeft or not sTipRight) then return; end

	local r = {self:_split(self.db.account[self.realm]["items"][coreid], "°")}
	if (not r) then return nil; end
	
	--------------------------------------------------------	
	--------------------------------------------------------
	for index = 1, ISyncTooltip:NumLines(), 1 do
	--------------------------------------------------------	
	--------------------------------------------------------
		
		--get the tooltip left information
		field = getglobal(sTipLeft..index);
		if( field and field:IsVisible() ) then
			left = field:GetText();
		else
			left = nil;
		end
			
		--get the tooltip right information
		field = getglobal(sTipRight..index);
		if( field and field:IsVisible() ) then
			right = field:GetText();
		else
			right = nil;
		end
		
		--------------------------------------------------------	
		--------------------------------------------------------
		--quality,price,wl,wt,ts,at,st,level,vendor,vendorqty,idchk,resistances,subitem
		--------------------------------------------------------	
		--------------------------------------------------------
	
		--do item locations / weapon locations
		if(left and ISA["WL"][left]) then
			
			--when the weapon occasionally shows on the right
			--we need to compensate for this
			if(left == ISL["Crossbow"]) then
			
				if (tonumber(r[4]) == 0 or tonumber(r[4]) ~= ISA["WL"][left]) then
					r[4] = ISA["WL"][left];
				end
				
			elseif(left == ISL["Gun"]) then
			
				if (tonumber(r[4]) == 0 or tonumber(r[4]) ~= ISA["WL"][left]) then
					r[4] = ISA["WL"][left];
				end

			elseif(left == ISL["Thrown"]) then
			
				if (tonumber(r[4]) == 0 or tonumber(r[4]) ~= ISA["WL"][left]) then
					r[4] = ISA["WL"][left];
				end
				
			elseif(left == ISL["Wand"]) then
			
				if (tonumber(r[4]) == 0 or tonumber(r[4]) ~= ISA["WL"][left]) then
					r[4] = ISA["WL"][left];
				end
				
			else --it's not a special case it's a weapon location not type
					
				if (tonumber(r[3]) == 0 or tonumber(r[3]) ~= ISA["WL"][left]) then
					r[3] = ISA["WL"][left];
				end

			end
	
		end
	
		--do weapon types
		if(right and ISA["WT"][right]) then
			
			if (tonumber(r[4]) == 0 or tonumber(r[4]) ~= ISA["WT"][right]) then
				r[4] = ISA["WT"][right];
			end
			
		end
		
		
		--grab the level requirement for items or tradeskills
		if(left) then
			_, _, sVariable1 = string.find(left, ISL["ReqSearch1"]);

			if( sVariable1 and link) then

				local _, _, _, _, minLevel_X = GetItemInfo(link);

				_, _, sLVLVariable1 = string.find(sVariable1, ISL["ReqSearch2"]); --check for level requirement
				
				if ( minLevel_X and minLevel_X ~= 0) then --we don't want zero cause it's default
					
					if (tonumber(r[8]) == tonumber(minLevel_X)) then
						--do nothing (to prevent loop)
					elseif (tonumber(r[8]) == 0 or tonumber(r[8]) ~= tonumber(minLevel_X)) then
						r[8] = minLevel_X;
					end
					
				elseif (sLVLVariable1 and tonumber(sLVLVariable1)) then

					if (tonumber(r[8]) == tonumber(sLVLVariable1)) then
						--do nothing (to prevent loop)
					elseif (tonumber(r[8]) == 0 or tonumber(r[8]) ~= tonumber(sLVLVariable1)) then
						r[8] = sLVLVariable1;
					end

				else
					--this is for tradeskill and number required
					_, _, sVariable2, sVariable3 = string.find(sVariable1, ISL["ReqSearch3"]);

					if( sVariable2 and sVariable3 and ISA["TS"][sVariable2]) then

						if (tonumber(r[5]) == 0 or tonumber(r[5]) ~= ISA["TS"][sVariable2]) then
							r[5] = ISA["TS"][sVariable2];
						end
						
					end

				end--end check for level requirement

			end--end variable 1 check
					
		end			
			

		
		--do armor types
		if(right and ISA["AT"][right]) then
		
			if (tonumber(r[6]) == 0 or tonumber(r[6]) ~= ISA["AT"][right]) then
				r[6] = ISA["AT"][right];
			end
			
		end
		
		
		--do shield types
		if(right and ISA["ST"][right]) then
		
			if (tonumber(r[7]) == 0 or tonumber(r[7]) ~= ISA["ST"][right]) then
				r[7] = ISA["ST"][right];
			end
			
		end

		--do resistances
		if(left) then
		
			local sARVal = 0;
		
			for key, val in pairs(ISA["AR"]) do
			
				if ( string.find(left, key) ) then
					sARVal = val;
					break;
				end
			
			end
			
			if (tonumber(r[12]) == 0 and sARVal ~= 0) then
				r[12] = sARVal;
				
			elseif ( sARVal ~= 0 ) then
			
				local q = {self:_split(r[12], "¢")}
				local rx = 0;
				
				if (q) then
				
					for kz, vz in pairs(q) do
						if (vz and tonumber(vz) == sARVal) then rx = 1; break; end
					end

					if (rx == 0 and sARVal ~= 0) then r[12] = r[12].."¢"..sARVal; end --add it if it doesn't exist

				end
				
				q = nil;
				
			end
			
		end
		
		
		
	--------------------------------------------------------	
	--------------------------------------------------------		
	end --end for
	--------------------------------------------------------	
	--------------------------------------------------------


	--------------------------------------------------------	
	--------------------------------------------------------
	--------------------------------------------------------	
	--------------------------------------------------------
	--now save everything
	local sVar = ""

	for k, v in pairs(r) do --rebuild the string and store it
		sVar = sVar..v.."°"
	end
	
	sVar = string.sub(sVar, 1, string.len(sVar) - 1) --strip off the extra ° at the end
	self.db.account[self.realm]["items"][coreid] = sVar --store it into database
	--------------------------------------------------------	
	--------------------------------------------------------
	--------------------------------------------------------	
	--------------------------------------------------------

	r = nil;

	--////////////////////////
	ISyncTooltip:Hide();
	--////////////////////////
	
end