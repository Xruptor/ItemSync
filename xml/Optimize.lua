--[[--------------------------------------------------------------------------------
  ItemSync Optimize Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

function ItemSync:Optimize_Start()

	--check for previously running checks
	if (self.gnome:Status("ItemSyncOptimize")) then
		self:Print(self.crayon:Colorize("FC5252", ISL["Optimize_No"]));
		return nil;
	end
	if (self.gnome:Status("ItemSyncOptimize_Invalid")) then
		self:Print(self.crayon:Colorize("FC5252", ISL["Optimize_No"]));
		return nil;
	end
	
	self:Optimize_LoadData();
end

function ItemSync:Optimize_LoadData()
	
	local isCount = 0;
	
	ISync_Optimize_Bar._listCount = 0;
	ISync_Optimize_Bar._CurrCount = 1;
	ISync_Optimize_Bar._listdata = nil;
	ISync_Optimize_Bar._listdata = { };
	
	for k, v in pairs(self.db.account[self.realm]["items"]) do
	
		table.insert(ISync_Optimize_Bar._listdata, k);
		isCount = isCount + 1;
	
	end
	
	if (isCount == 0) then return nil; end

	--set the status bar
	ISync_Optimize_Bar:SetAlpha(1);
	ISync_Optimize_BarFrameStatusBar:SetStatusBarColor(1, 1, 0);
	ISync_Optimize_BarFrameStatusBar:SetMinMaxValues(0, isCount);
	ISync_Optimize_BarFrameStatusBar:SetValue(0);
	ISync_Optimize_BarText2:SetText(ISL["Optimize_Running"]);
	ISync_Optimize_BarText:SetText( "0/"..isCount );
	ISync_Optimize_Bar:Show();
			
	ISync_Optimize_Bar._listCount = isCount;
	self:Optimize_Process();
end

function ItemSync:Optimize_Process()

	if (not self.gnome:Status("ItemSyncOptimize")) then
	
		local OptimizeChkDone = function()
			
			local iCount = 0;
			
			if (not ISync_Optimize_Bar._CurrCount) then ISync_Optimize_Bar._CurrCount = 1; end
			
			if (ISync_Optimize_Bar._CurrCount >= ISync_Optimize_Bar._listCount) then
				self.gnome:Unregister("ItemSyncOptimize");
				self:Print(self.crayon:Colorize("A2D96F", ISL["Optimize_Complete"]));
				ISync_Optimize_Bar._listdata = nil;
				ISync_Optimize_Bar._listCount = 0;
				ISync_Optimize_Bar._CurrCount = 1;
				ISync_Optimize_Bar:Hide();
				return nil;
			end
			
			for iCount=ISync_Optimize_Bar._CurrCount , (ISync_Optimize_Bar._CurrCount + 300) , 1 do
			
				if (ISync_Optimize_Bar._listdata[iCount]) then
					
					if (self.db.account[self.realm]["items"][ISync_Optimize_Bar._listdata[iCount]]) then

						local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo("item:"..ISync_Optimize_Bar._listdata[iCount]..":0:0:0:0:0:0:0")
						
						if (name_X and link_X) then
							self:Parse(ISync_Optimize_Bar._listdata[iCount], "item:"..ISync_Optimize_Bar._listdata[iCount]..":0:0:0:0:0:0:0"); --parse the tooltip
						end
					end
				end
								
			end
			
			ISync_Optimize_Bar._CurrCount = (ISync_Optimize_Bar._CurrCount + 300); --up the count
			
			if(ISync_Optimize_Bar._CurrCount >= ISync_Optimize_Bar._listCount) then 
				ISync_Optimize_BarText:SetText( ISync_Optimize_Bar._listCount.."/"..ISync_Optimize_Bar._listCount );
			else
				ISync_Optimize_BarText:SetText( ISync_Optimize_Bar._CurrCount.."/"..ISync_Optimize_Bar._listCount );
			end
			
			--do the value
			ISync_Optimize_BarFrameStatusBar:SetValue(ISync_Optimize_Bar._CurrCount);
				
		end
	
		self.gnome:Register("ItemSyncOptimize", OptimizeChkDone , 7)
		self:Optimize_Process();
	else
		local avail, rate, running = self.gnome:Status("ItemSyncOptimize")

		if (not running ) then
			self.gnome:Start("ItemSyncOptimize")
		end
	end
end

-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

function ItemSync:Optimize_Invalid_Start()

	--check for previously running checks
	if (self.gnome:Status("ItemSyncOptimize_Invalid")) then
		self:Print(self.crayon:Colorize("FC5252", ISL["Optimize_No"]));
		return nil;
	end
	if (self.gnome:Status("ItemSyncOptimize")) then
		self:Print(self.crayon:Colorize("FC5252", ISL["Optimize_No"]));
		return nil;
	end
	
	self:Optimize_Invalid_LoadData();
end

function ItemSync:Optimize_Invalid_LoadData()
	
	local isCount = 0;
	
	ISync_Optimize_Bar._listCount = 0;
	ISync_Optimize_Bar._CurrCount = 1;
	ISync_Optimize_Bar._listdata = nil;
	ISync_Optimize_Bar._listdata = { };
	
	local r,q;
	
	for k, v in pairs(self.db.account[self.realm]["items"]) do
		
		r = {self:_split(v, "°")}
		
		if(r[13] and tonumber(r[13]) and tonumber(r[13]) == 0) then --does not have subitems

			local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo("item:"..k..":0:0:0:0:0:0:0")
			
			if (not name_X) then
				table.insert(ISync_Optimize_Bar._listdata, "item:"..k..":0:0:0:0:0:0:0");
				isCount = isCount + 1;
			end
		
		elseif(r[13]) then
		
			q = {self:_split(r[13], "º")}

			for kx, vx in pairs(q) do
			
				local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo("item:"..k..":0:0:0:0:0:"..vx..":0")

				if (not name_X) then
					table.insert(ISync_Optimize_Bar._listdata, "item:"..k..":0:0:0:0:0:"..vx..":0");
					isCount = isCount + 1;
				end
			end
			
		else
			return nil;
		end
	end
	
	r = nil;
	q = nil;
	
	--check
	if (isCount == 0) then return nil; end
	if(getn(ISync_Optimize_Bar._listdata) <= 0) then return nil; end
	
	local iChk = 1;
	local sTempDB = { };
	local sNumRand = 0;
	
	--loop
	while iChk > 0 do
		
		if(not ISync_Optimize_Bar._listdata or getn(ISync_Optimize_Bar._listdata) <= 0) then iChk = 0; end --reset
		
		--check
		if(iChk == 1) then
		
			sNumRand = math.random(1, getn(ISync_Optimize_Bar._listdata));

			--add it to the temp list
			table.insert(sTempDB, ISync_Optimize_Bar._listdata[sNumRand]);

			--remove it from old list
			table.remove(ISync_Optimize_Bar._listdata,sNumRand);
		end
	end

	--now replace the old with new
	ISync_Optimize_Bar._listdata = nil;
	ISync_Optimize_Bar._listdata = sTempDB;
	sTempDB = nil;
	
	--set the status bar
	ISync_Optimize_Bar:SetAlpha(1);
	ISync_Optimize_BarFrameStatusBar:SetStatusBarColor(1, 0, 0);
	ISync_Optimize_BarFrameStatusBar:SetMinMaxValues(0, isCount);
	ISync_Optimize_BarFrameStatusBar:SetValue(0);
	ISync_Optimize_BarText2:SetText(ISL["Optimize_InvalidRunning"]);
	ISync_Optimize_BarText:SetText( "0/"..isCount );
	ISync_Optimize_Bar:Show();
			
	ISync_Optimize_Bar._listCount = isCount;
	self:Optimize_Invalid_Process();
end

function ItemSync:Optimize_Invalid_Process()

	if (not self.gnome:Status("ItemSyncOptimize_Invalid")) then
	
		local Optimize_InvalidChkDone = function()
			
			local iCount = 0;
			
			if (not ISync_Optimize_Bar._CurrCount) then ISync_Optimize_Bar._CurrCount = 1; end
			
			if (ISync_Optimize_Bar._CurrCount >= ISync_Optimize_Bar._listCount) then
				self.gnome:Unregister("ItemSyncOptimize_Invalid");
				self:Print(self.crayon:Colorize("A2D96F", ISL["Optimize_InvalidComplete"]));
				ISync_Optimize_Bar._listdata = nil;
				ISync_Optimize_Bar._listCount = 0;
				ISync_Optimize_Bar._CurrCount = 1;
				ISync_Optimize_Bar:Hide();
				return nil;
			end
			
			for iCount=ISync_Optimize_Bar._CurrCount , (ISync_Optimize_Bar._CurrCount + 50) , 1 do
			
				if (ISync_Optimize_Bar._listdata[iCount]) then
					ISync_MainFrame.TooltipButton = UIParent:GetID();
					GameTooltip:SetOwner(UIParent, "ANCHOR_RIGHT");
					GameTooltip:SetHyperlink(ISync_Optimize_Bar._listdata[iCount]);
					GameTooltip:Show();
					GameTooltip:Hide();
				end			
			end
			
			ISync_Optimize_Bar._CurrCount = (ISync_Optimize_Bar._CurrCount + 50); --up the count
			
			if(ISync_Optimize_Bar._CurrCount >= ISync_Optimize_Bar._listCount) then 
				ISync_Optimize_BarText:SetText( ISync_Optimize_Bar._listCount.."/"..ISync_Optimize_Bar._listCount );
			else
				ISync_Optimize_BarText:SetText( ISync_Optimize_Bar._CurrCount.."/"..ISync_Optimize_Bar._listCount );
			end
			
			--do the value
			ISync_Optimize_BarFrameStatusBar:SetValue(ISync_Optimize_Bar._CurrCount);
				
		end
	
		self.gnome:Register("ItemSyncOptimize_Invalid", Optimize_InvalidChkDone , 13) --13 seconds
		self:Optimize_Invalid_Process();
	else
		local avail, rate, running = self.gnome:Status("ItemSyncOptimize_Invalid")

		if (not running ) then
			self.gnome:Start("ItemSyncOptimize_Invalid")
		end
	end
end
