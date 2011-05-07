
--[[--------------------------------------------------------------------------------
  ItemSync MainFrame Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

function ItemSync:On_DD_MainEnable()
	
	--ISync_MainFrame_DropDown
	--/////////////////////////////////////
	if (ISync_MainFrame_DropDown ) then
		ISync_MainFrame_DropDown:SetBackdropColor(0,0,0,1);

		self.dewdrop:Register(ISync_MainFrame_DropDown,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				for k, v in pairs(ISA["SORTING"]) do

					self.dewdrop:AddLine(
						'text', k,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function(this, button) 
							
							--[r10001] store last dropdown selection
							if (not self.db.account[self.realm]["options"]["dropdown"]) then ItemSync:Validate_Opt(); end
							self.db.account[self.realm]["options"]["dropdown"][1] = v;


							ISync_MainFrame_DropDownSelection:SetText(k);
							--ISync_MainFrame_DropDownSelection:SetText(self.text:GetText());
							PlaySound("igMainMenuOptionCheckBoxOn");

							FauxScrollFrame_SetOffset(ISync_MainFrame_ListScrollFrame, 0);
							getglobal("ISync_MainFrame_ListScrollFrameScrollBar"):SetValue(0);
							ItemSync:BuildIndex();
							ItemSync:UpdateScrollFrame();
		
						end
					)
					
				end
			
		    	end
		)

		ISync_MainFrame_DropDown.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_MainFrame_DropDown.OnEnter = function()

		end
		ISync_MainFrame_DropDown.OnLeave = function()

		end
		ISync_MainFrame_DropDown.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_MainFrame_DropDown)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_MainFrame_DropDown);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	
	--now set primary if missing
	if (not ISync_MainFrame_DropDownSelection:GetText() or ISync_MainFrame_DropDownSelection:GetText() == "") then
	
		for k, v in pairs(ISA["SORTING"]) do
			if (v == 1) then
				ISync_MainFrame_DropDownSelection:SetText(k);
				break;
			end
		end
	end
	
	
	--/////////////////////////////////////
	

end

function ItemSync:Main_Refresh(s)
	
	--[r10001] set dropdown if stored, and doesn't match
	if (not self.db.account[self.realm]["options"]["dropdown"]) then ItemSync:Validate_Opt(); end

		for k, v in pairs(ISA["SORTING"]) do
			
			if (not self.db.account[self.realm]["options"]["dropdown"][1] and v == 1) then --just in case
				ISync_MainFrame_DropDownSelection:SetText(k);
				break;
			elseif (v == self.db.account[self.realm]["options"]["dropdown"][1]) then
				ISync_MainFrame_DropDownSelection:SetText(k);
				break;
			end
		end
	-----------------------
	
	ISync_SearchFrameName_Search:ClearFocus(); --clear focus
	ISyncMainFrame_QuickSearch:ClearFocus(); --clear focus
	FauxScrollFrame_SetOffset(ISync_MainFrame_ListScrollFrame, 0);
	getglobal("ISync_MainFrame_ListScrollFrameScrollBar"):SetValue(0);
	
	if (s and s==1 and ItemSync:Get_Opt("external", 5, 1)) then
		if (not self._buildtable) then
			ISync_MainFrameInfo:SetText(self.crayon:Colorize("00FF00", ISL["TotalItems"]).."    "..self.crayon:Colorize("BDFCC9", 0).."\n"..self.crayon:Colorize("FFFF66", ISL["TotalShown"]).."   "..self.crayon:Colorize("BDFCC9", 0));
			return nil;
		end
	end
	
	ItemSync:BuildIndex();
	ItemSync:UpdateScrollFrame();
end

function ItemSync:BuildIndex()
		
		self._buildtable 	= { };
		iNew = 1;
		
		self._buildtable._invalidCount = 0; --[r10001]
		
		local r = { };
		local q = { };
		
		for k, v in pairs(self.db.account[self.realm]["items"]) do
			
			r = {ItemSync:_split(v, "°")}
			
			if (r) then
				
				if(r[13] and tonumber(r[13]) and tonumber(r[13]) == 0) then
					
					--update the name if incorrect [r10001]
					local sName = GetItemInfo("item:"..k..":0:0:0:0:0:0:0");
					
					if (not ItemSync:Check_Opt("showinvalid",1) and sName or ItemSync:Check_Opt("showinvalid",1)) then
					
						if (sName) then
							if (not self.db.account[self.realm]["names"][k]) then
								self.db.account[self.realm]["names"][k] = sName;
							elseif (self.db.account[self.realm]["names"][k] ~= sName) then
								self.db.account[self.realm]["names"][k] = sName;
							end
						else
							self._buildtable._invalidCount = self._buildtable._invalidCount + 1;
						end
						---------------------------------------


						if ( ItemSync:Parse_Search(k, r, self.db.account[self.realm]["names"][k] or ISL["Unknown"]) ) then --search

							self._buildtable[iNew] = { };
							self._buildtable[iNew].name = self.db.account[self.realm]["names"][k] or ISL["Unknown"];
							self._buildtable[iNew].quality = string.sub(v, 1, 1);
							self._buildtable[iNew].idcore = k;

							if (r[11] and tonumber(r[11]) ~= 0) then self._buildtable[iNew].idchk =1; end

							iNew = iNew + 1;

						end
					
					end--if (not self:Check_Opt("showinvalid",1) and sName or self:Check_Opt("showinvalid",1)) then
					
				else

					q = {ItemSync:_split(r[13], "º")}

					for kx, vx in pairs(q) do
-- kirson split subid "v" and sfactor "vsfactor" around ø
   		  				local vxsfactor = 0
   		  				local vxp = strfind(vx, "ø")
   		  				if (vxp) then
							vxsfactor = strsub(vx, vxp+1)
							vx = strsub(vx, 1, vxp-1)
							if (tonumber(vx) < 0 and tonumber(vxsfactor) == 0) then
								ItemSync:_purgeSubidMissingSfactor(k, r)
								vx = 0
							end
						end
						
						local subName = GetItemInfo("item:"..k..":0:0:0:0:0:"..vx..":0");
						
						if (not ItemSync:Check_Opt("showinvalid",1) and subName or ItemSync:Check_Opt("showinvalid",1)) then

							if ( subName ) then
								if (not self.db.account[self.realm]["names"][k]) then
									self.db.account[self.realm]["names"][k] = ItemSync:StripSubName(subName);
								elseif (self.db.account[self.realm]["names"][k] ~= ItemSync:StripSubName(subName)) then
									self.db.account[self.realm]["names"][k] = ItemSync:StripSubName(subName);
								end
							elseif (self.db.account[self.realm]["names"][k]) then
								subName = self.db.account[self.realm]["names"][k].." "..ISL["OfThe"];
								self._buildtable._invalidCount = self._buildtable._invalidCount + 1;
							else
								subName = ISL["Unknown"].." "..ISL["OfThe"];
								self._buildtable._invalidCount = self._buildtable._invalidCount + 1;
							end
							
							if ( ItemSync:Parse_Search(k, r, subName) and vx ~= 0) then --search

								self._buildtable[iNew] = { };
								self._buildtable[iNew].name = subName;
								self._buildtable[iNew].quality = string.sub(v, 1, 1);
								self._buildtable[iNew].idcore = k;
								self._buildtable[iNew].subid = vx;
-- kirson 	add sfactor to _buildtable[iNew]
								self._buildtable[iNew].sfactor = vxsfactor;

								if (r[11] and tonumber(r[11]) ~= 0) then self._buildtable[iNew].idchk =1; end

								iNew = iNew + 1;

							end
						
						end--if (not self:Check_Opt("showinvalid",1) and subName or self:Check_Opt("showinvalid",1)) then
					end

				end
				
			end
			
		end

	q = nil;
	r = nil;
	
	if ( self.db.account[self.realm]["options"]["ItemCount"] < (iNew-1)) then
		self.db.account[self.realm]["options"]["ItemCount"] = (iNew-1);
		ItemSync:UpdateItemCounter();
	
	end


	ItemSync:ListSort();
	self._buildtable.onePastEnd = iNew;

end

function ItemSync:ListSort()

	if (ISync_MainFrame_DropDownSelection:GetText() and ISync_MainFrame_DropDownSelection:GetText() ~= "") then
		
		if (ISA["SORTING"][ISync_MainFrame_DropDownSelection:GetText()]) then
		
			if (ISA["SORTING"][ISync_MainFrame_DropDownSelection:GetText()] == 1) then --NAME
				table.sort(self._buildtable, function(a,b) return a.name<b.name end);
				
			elseif (ISA["SORTING"][ISync_MainFrame_DropDownSelection:GetText()] == 2) then --RARITY
				table.sort(self._buildtable, self.SortColor);
			end
		
		end
	
	end
end

function ItemSync.SortColor(elem1, elem2)
	local color1, color2;

	--get the corresponding quality
	color1 = elem1.quality;
	color2 = elem2.quality;
	
	color1 = tonumber(color1);
	color2 = tonumber(color2);
	
	if(color1 and color2) then
	
		--this sorts the name if the colors match
		--that way the rarity are also alphabatized within the same rarity
		if( color1 == color2 ) then
			return elem1.name < elem2.name;
		end
	
		--return the color if it doesn't match
		return color2 < color1;
	
	else
		return nil;
	end
	
end

function ItemSync:UpdateItemCounter()

	if (self.db.account[self.realm]["options"]["ItemCount"]) then
		ItemSync_CountFrameText:SetText(self.db.account[self.realm]["options"]["ItemCount"]);
	end
	
	if (ItemSyncFu) then
		ItemSyncFu:UpdateDisplay();
	end
		
	if (not self._buildtable or not self._buildtable.onePastEnd) then return nil; end
	
	local frameText; --[r10001]
	frameText = self.crayon:Colorize("00FF00", ISL["TotalItems"]).."    "..self.crayon:Colorize("BDFCC9", self.db.account[self.realm]["options"]["ItemCount"]).."\n";
	frameText = frameText..self.crayon:Colorize("FFFF66", ISL["TotalShown"]).."   "..self.crayon:Colorize("BDFCC9", (self._buildtable.onePastEnd - 1)).."\n";
	frameText = frameText..self.crayon:Colorize("FC5252", ISL["TotalInvalid"]).."   "..self.crayon:Colorize("BDFCC9", self._buildtable._invalidCount);
	
	ISync_MainFrameInfo:SetText(frameText);
end

function ItemSync:UpdateScrollFrame()

local ISYNC_HEIGHT 		= 16;
local ISYNC_SHOWN 		= 23;
local LAST_SHOWN		= 1;
	
	if self == ISync_MainFrame_ListScrollFrame then self = ItemSync; --we get only the srollframe while scrolling
	elseif (not self) then self = ItemSync; --for some reason we lose this upon scroll 
	end 
	
	--Added [r10001] (don't scroll if we are validating an item)
	if (self._canScroll) then return nil; end
	
	if( not self._buildtable or not self._buildtable.onePastEnd) then
		 ItemSync:BuildIndex();
	end
			--double check
	if(not self._buildtable.onePastEnd) then return nil; end

	local frameText; --[r10001]
	frameText = self.crayon:Colorize("00FF00", ISL["TotalItems"]).."    "..self.crayon:Colorize("BDFCC9", self.db.account[self.realm]["options"]["ItemCount"]).."\n";
	frameText = frameText..self.crayon:Colorize("FFFF66", ISL["TotalShown"]).."   "..self.crayon:Colorize("BDFCC9", (self._buildtable.onePastEnd - 1)).."\n";
	frameText = frameText..self.crayon:Colorize("FC5252", ISL["TotalInvalid"]).."   "..self.crayon:Colorize("BDFCC9", self._buildtable._invalidCount);
	
	ISync_MainFrameInfo:SetText(frameText);
	
	--Since patch 1.4 the 5th arguement must be nill or an error will occur
	FauxScrollFrame_Update(ISync_MainFrame_ListScrollFrame, self._buildtable.onePastEnd - 1, ISYNC_SHOWN, ISYNC_HEIGHT, nil);
	
	--do loop until all slots are filled, or we are out of information
	for iItem = 1, ISYNC_SHOWN, 1 do


		local itemIndex = iItem + FauxScrollFrame_GetOffset(ISync_MainFrame_ListScrollFrame);
		local IMItemObj = getglobal("ISyncItem"..iItem);
		local IMItemObj_Text = getglobal("ISyncItem"..iItem.."Text");
		local IMItemObj_Indexed = getglobal("ISyncItem"..iItem.."SubItem");
		local IMItemObj_GB = getglobal("ISync_ItemIDGB_Button"..iItem);
		local IMItemObj_GB_Blip = getglobal("ISync_ItemIDGB_Button"..iItem.."_BlipTexture");

		if(IMItemObj) then

			if( itemIndex < self._buildtable.onePastEnd and self._buildtable[itemIndex]) then --are we within bounds?
				
				local lastName;
				if (self._buildtable[itemIndex-1]) then lastName = self._buildtable[itemIndex-1].name; end --get last name

					if (not self._buildtable[itemIndex].subid) then --it's not a subitem
					
						if (GetItemInfo("item:"..self._buildtable[itemIndex].idcore..":0:0:0:0:0:0:0")) then --check to see if it's valid
							
							if (lastName and lastName == self._buildtable[itemIndex].name) then
								IMItemObj_Text:SetPoint( "LEFT",  29, 1 );
								IMItemObj_Indexed:SetTexture("Interface\\MoneyFrame\\Arrow-Right-Down");
								IMItemObj_Indexed:Show();
							else
								IMItemObj_Text:SetPoint( "LEFT",  19, 1 );
								IMItemObj_Indexed:Hide();
							end
							
							--we have to force the color or else the color stays with the mouse if they use the mouse wheel
							IMItemObj:SetText(self.crayon:Colorize(ItemSync:ReturnHexColor(self._buildtable[itemIndex].quality), self._buildtable[itemIndex].name));
							

							local grabColor = ITEM_QUALITY_COLORS[tonumber(self._buildtable[itemIndex].quality)];
							if( grabColor) then
								IMItemObj:SetNormalFontObject("GameFontNormal"); -- Font prüfen
								local font = IMItemObj:GetNormalFontObject();
								font:SetTextColor(grabColor.r, grabColor.g, grabColor.b);
								IMItemObj:SetNormalFontObject(font);
								-- IMItemObj:SetTextColor(grabColor.r, grabColor.g, grabColor.b);
								IMItemObj.r = grabColor.r;
								IMItemObj.g = grabColor.g;
								IMItemObj.b = grabColor.b;
							else
								IMItemObj.r = 0;
								IMItemObj.g = 0;
								IMItemObj.b = 0;
							end
						
							if (self._buildtable[itemIndex].idchk) then
								IMItemObj_GB_Blip:SetTexture("Interface\\AddOns\\ItemSync\\images\\Input");
								IMItemObj_GB:Show();
							else
								IMItemObj_GB:Hide();
							end
							
							IMItemObj.iteminfo = self._buildtable[itemIndex];
								
								--add icon texture
								_, _, _, _, _, _, _, _, _, IMItemObj.iteminfo.icontexture  = GetItemInfo("item:"..self._buildtable[itemIndex].idcore..":0:0:0:0:0:0:0");

							IMItemObj.invalid = nil;
						else
						
							if (lastName and lastName == self._buildtable[itemIndex].name) then
								IMItemObj_Text:SetPoint( "LEFT",  29, 1 );
								IMItemObj_Indexed:SetTexture("Interface\\MoneyFrame\\Arrow-Right-Down");
								IMItemObj_Indexed:Show();
							else
								IMItemObj_Text:SetPoint( "LEFT",  19, 1 );
								IMItemObj_Indexed:Hide();
							end
							
							IMItemObj:SetText(self.crayon:Colorize("FC5252", self._buildtable[itemIndex].name));
							
							IMItemObj_GB_Blip:SetTexture("Interface\\AddOns\\ItemSync\\images\\Invalid");
							IMItemObj_GB:Show();
							
							IMItemObj.iteminfo = self._buildtable[itemIndex];
							IMItemObj.invalid = 1;
						end
					
					else
-- kirson add sfactor to item check
						local sGName = GetItemInfo("item:"..self._buildtable[itemIndex].idcore..":0:0:0:0:0:"..self._buildtable[itemIndex].subid..":"..self._buildtable[itemIndex].sfactor);
						
						if (sGName) then --check to see if it's valid
							
							if (lastName and lastName == sGName) then
								IMItemObj_Text:SetPoint( "LEFT",  29, 1 );
								IMItemObj_Indexed:SetTexture("Interface\\AddOns\\ItemSync\\images\\Repeat");
								IMItemObj_Indexed:Show();
								IMItemObj:SetText(self.crayon:Colorize("F3EF86", sGName));
							else
								IMItemObj_Text:SetPoint( "LEFT",  19, 1 );
								IMItemObj_Indexed:Hide();
								IMItemObj:SetText(self.crayon:Colorize(ItemSync:ReturnHexColor(self._buildtable[itemIndex].quality), sGName));
							end
							


							local grabColor = ITEM_QUALITY_COLORS[tonumber(self._buildtable[itemIndex].quality)];
							if( grabColor) then
								IMItemObj:SetNormalFontObject("GameFontNormal");  -- Font prüfen
								local font = IMItemObj:GetNormalFontObject();
								font:SetTextColor(grabColor.r, grabColor.g, grabColor.b);
								IMItemObj:SetNormalFontObject(font);
								-- IMItemObj:SetTextColor(grabColor.r, grabColor.g, grabColor.b);
								IMItemObj.r = grabColor.r;
								IMItemObj.g = grabColor.g;
								IMItemObj.b = grabColor.b;
							else
								IMItemObj.r = 0;
								IMItemObj.g = 0;
								IMItemObj.b = 0;
							end
						
							if (self._buildtable[itemIndex].idchk) then
								IMItemObj_GB_Blip:SetTexture("Interface\\AddOns\\ItemSync\\images\\Input");
								IMItemObj_GB:Show();
							else
								IMItemObj_GB:Hide();
							end
							
							IMItemObj.iteminfo = self._buildtable[itemIndex];
								
								--add icon texture
								_, _, _, _, _, _, _, _, _, IMItemObj.iteminfo.icontexture  = GetItemInfo("item:"..self._buildtable[itemIndex].idcore..":0:0:0:0:0:"..self._buildtable[itemIndex].subid..":0");
							
							IMItemObj.invalid = nil;
						else
							
							if (lastName and lastName == self._buildtable[itemIndex].name) then
								IMItemObj_Text:SetPoint( "LEFT",  29, 1 );
								IMItemObj_Indexed:SetTexture("Interface\\MoneyFrame\\Arrow-Right-Down");
								IMItemObj_Indexed:Show();
							else
								IMItemObj_Text:SetPoint( "LEFT",  19, 1 );
								IMItemObj_Indexed:Hide();
							end
							
							IMItemObj:SetText(self.crayon:Colorize("FC5252", self._buildtable[itemIndex].name));
							
							IMItemObj_GB_Blip:SetTexture("Interface\\AddOns\\ItemSync\\images\\Invalid");
							IMItemObj_GB:Show();

							IMItemObj.iteminfo = self._buildtable[itemIndex];
							IMItemObj.invalid = 1;
						end
						
					
					end
					
					--store itemidex for deletion
					IMItemObj.itemIndex = itemIndex;

					--show it
					IMItemObj:Show();
			
			--we deleted an item
			elseif( itemIndex < self._buildtable.onePastEnd and not self._buildtable[itemIndex]) then
				
				IMItemObj.iteminfo = nil;
				IMItemObj.itemIndex = nil;
				IMItemObj:SetText(self.crayon:Colorize("FC5252", ISL["ItemDeleted"]));
				IMItemObj:Show();
				IMItemObj_Indexed:Hide();
				IMItemObj_GB:Hide();
				
			else
				IMItemObj.iteminfo = nil;
				IMItemObj.itemIndex = nil;
				IMItemObj:SetText("");
				IMItemObj:Hide();
				IMItemObj_Indexed:Hide();
				IMItemObj_GB:Hide();
			
			end--if( itemIndex < self._buildtable.onePastEnd ) then
			
		end--if(IMItemObj) then
		
	end--for iItem = 1, ISYNC_SHOWN, 1 do

end

function ItemSync:ButtonEnter(self, motion)

	if(not self.iteminfo) then return nil; end
	local this = ItemSync; -- we don't have variable Itemsync in self !!!
	--fix the color with the scrolling
	if (not self.invalid) then
		
		if (not self.iteminfo.subid) then
		
			if (GetItemInfo("item:"..self.iteminfo.idcore..":0:0:0:0:0:0:0")) then
			
				ISync_MainFrame.TooltipButton = self:GetID();
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
				GameTooltip:SetHyperlink("item:"..self.iteminfo.idcore..":0:0:0:0:0:0:0");
				
				if (self.iteminfo.icontexture and this:Get_Opt("showmoney", 3, 1)) then
					getglobal("ISync_GameTooltipIconTexture"):SetTexture(self.iteminfo.icontexture);
					getglobal("ISync_GameTooltipIcon"):Show();
				else
					getglobal("ISync_GameTooltipIcon"):Hide();
				end
				
				this:Parse(self.iteminfo.idcore, "item:"..self.iteminfo.idcore..":0:0:0:0:0:0:0");

			end
		else
-- kirson add sfactor to item check
			if (GetItemInfo("item:"..self.iteminfo.idcore..":0:0:0:0:0:"..self.iteminfo.subid..":"..self.iteminfo.sfactor)) then
			
				ISync_MainFrame.TooltipButton = self:GetID();
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
-- kirson add sfactor to link to retreive proper item stats
				GameTooltip:SetHyperlink("item:"..self.iteminfo.idcore..":0:0:0:0:0:"..self.iteminfo.subid..":"..self.iteminfo.sfactor);
				
				if (self.iteminfo.icontexture and ItemSync:Get_Opt("showmoney", 3, 1)) then
					getglobal("ISync_GameTooltipIconTexture"):SetTexture(self.iteminfo.icontexture);
					getglobal("ISync_GameTooltipIcon"):Show();
				else
					getglobal("ISync_GameTooltipIcon"):Hide();
				end
				
				this:Parse(self.iteminfo.idcore, "item:"..self.iteminfo.idcore..":0:0:0:0:0:0:0"); --we don't want subid
				
			end
		end
		
		
	else --item is invalid

		ISync_MainFrame.TooltipButton = self:GetID();
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");

		GameTooltip:AddLine(this.crayon:Colorize("FF0000", ISL["InvalidItem"]), 0, 0, 0); 
		GameTooltip:AddLine(" ", 0, 0, 0);
		GameTooltip:AddLine(this.crayon:Colorize("A2D96F", ISL["InvalidForce"]), 0, 0, 0);
		GameTooltip:AddLine(" ", 0, 0, 0);
		GameTooltip:AddLine(this.crayon:Colorize("FC5252", ISL["InvalidWarning"]), 0, 0, 0);
		GameTooltip:AddLine(" ", 0, 0, 0);
		
		if (not self.iteminfo.subid) then
			GameTooltip:AddLine(this.crayon:Colorize("00FF00", ISL["ItemID"]..":").." "..this.crayon:Colorize("BDFCC9", self.iteminfo.idcore..":0:0:0:0:0:0:0"), 0, 0, 0);
		else
-- kirson add sfactor to tooltip for proper reference
			GameTooltip:AddLine(this.crayon:Colorize("00FF00", ISL["ItemID"]..":").." "..this.crayon:Colorize("BDFCC9", self.iteminfo.idcore..":0:0:0:0:0:"..self.iteminfo.subid..":"..self.iteminfo.sfactor), 0, 0, 0);
		end
		

		GameTooltip:Show();
	
	end
	
	
end

function ItemSync:ButtonClick(self, sButton, down)
	
	-- ISynctext("MF-601 sButton =" ,sButton)
	if(not self.iteminfo) then return nil; end
	
	local this = ItemSync; -- we don't have variable Itemsync in self !!!
	if (sButton == "LeftButton") then
		-- Rework ChatFrameEditbox funktioniert nicht mehr bzw. neu ChatEdit_GetActiveWindow ab 3.3.5
		local ChatFrameEditBox = (ChatEdit_GetActiveWindow and ChatEdit_GetActiveWindow()) or ChatFrameEditBox
			
		if( ChatFrameEditBox and ChatFrameEditBox:IsVisible() and not self.invalid) then
			ChatFrameEditBox:Insert( this:ReturnHyperlink(self.iteminfo.idcore, self.iteminfo.subid, self.iteminfo.sfactor) );
			
		elseif( IsShiftKeyDown() and ChatFrameEditBox and ChatFrameEditBox:IsVisible() and not self.invalid) then
			ChatFrameEditBox:Insert( this:ReturnHyperlink(self.iteminfo.idcore, self.iteminfo.subid, self.iteminfo.sfactor) );
			
		elseif( IsControlKeyDown() and IsShiftKeyDown()) then
			this:Dialog_Add_Favorite(self:GetName());
			
		elseif( IsControlKeyDown() and not self.invalid) then
			DressUpItemLink( this:ReturnHyperlink(self.iteminfo.idcore, self.iteminfo.subid, self.iteminfo.sfactor) );
		end
		
	elseif (sButton == "RightButton") then
	
		if (IsControlKeyDown() and self.invalid and self.iteminfo) then --if invalid
		
			ISync_ItemPopup.barname = self:GetName();
			ISync_ItemPopup.iteminfo = self.iteminfo;
			
			ISync_ItemPopupHeaderText:SetText(ISL["ForceInvalid"]);

			ISync_ItemPopupInfo:SetText(this.crayon:Colorize("FC5252", ISL["ItemForce"]));
			ISync_ItemPopupItemText:SetText(this.crayon:Colorize(ItemSync:ReturnHexColor(self.iteminfo.quality), self.iteminfo.name));

			ISync_ItemPopupNoButton:SetText(ISL["No"]);
			ISync_ItemPopupYesButton:SetText(ISL["Yes"]);

			ISync_ItemPopup:SetBackdropColor(0,0,0,1); --set black background no transparency
			 
			ISync_ItemPopup:Show();
		
		elseif (IsAltKeyDown() and self.iteminfo) then --delete item
			
			this:Dialog_Delete_Item(self:GetName(), self.itemIndex);
		
		end
	
	end
		
end

function ItemSync:ForceClick(self)
	
	local frame = getglobal(self:GetParent():GetName())
	if (not frame) then return nil; end
	
	local this = ItemSync; -- we don't have variable Itemsync in self !!!
	--check for previously running checks
	if (this.gnome:Status("ForceClickWait")) then
		this:Print(this.crayon:Colorize("FC5252", ISL["InvalidForce_Wait"]));
		return nil;
	end
	
	ISync_MainFrame.TooltipButton = frame:GetID();
	GameTooltip:SetOwner(frame, "ANCHOR_RIGHT");
	
	local link;
	
	if (not frame.iteminfo.subid) then
		link = "item:"..frame.iteminfo.idcore..":0:0:0:0:0:0:0";
	else
-- kirson add sfactor to link
		link = "item:"..frame.iteminfo.idcore..":0:0:0:0:0:"..frame.iteminfo.subid..":".. frame.iteminfo.sfactor;
	end

	if (not link) then return nil; end
	
	--now to force it
	GameTooltip:SetHyperlink(link);
	GameTooltip:Show();
	GameTooltip:Hide();
	
	this:Print(this.crayon:Colorize("FC5252", ISL["ItemForceWait"]));
	
	self._canScroll = 1; --[r10001] added to prevent scrolling of window while validating
	ItemSync:ForceClick_Wait(link, frame.iteminfo.idcore, frame.iteminfo.subid, sfactor, frame); --now send
	
end

-- kirson  add sfactor as 4th argument for passthrough
function ItemSync:ForceClick_Wait(link, coreid, subid, sfactor, frame)
	
	if (not link or not coreid or not frame) then self._canScroll = nil; return nil; end
	
	if (not self.gnome:Status("ForceClickWait")) then
	
		local ForceClickChkDone = function()
			local linkold = link;
			local oldcore = coreid;
			local oldsub = subid;
-- kirson add oldsfactor for passthrough
			local oldsfactor = sfactor;
			local oldframe = frame;

			
			if ( ItemSync:ReturnHyperlink(oldcore, oldsub, oldsfactor) ) then
				self:Print(self.crayon:Colorize("A2D96F", ISL["ItemForceSuccess"]));
-- kirson add sfactor as argument 3
				self:Print(ItemSync:ReturnHyperlink(oldcore, oldsub, oldsfactor));
				
				--now change the bar to reflect the new changes
				if (oldframe and oldframe.barname) then
					local itemBar = getglobal(oldframe.barname);
					if (itemBar) then
						itemBar:SetText(self.crayon:Colorize(ItemSync:ReturnHexColor(self._iteminfo.quality), self._iteminfo.name));
						itemBar.iteminfo.quality = self._iteminfo.quality;
						itemBar.iteminfo.name = self._iteminfo.name;
						itemBar.invalid = nil;
						if (self._iteminfo.icontexture) then itemBar.iteminfo.icontexture = self._iteminfo.icontexture; end
					
						if (itemBar:GetID()) then --hide invalid icon
							local itemBarGB = getglobal("ISync_ItemIDGB_Button"..itemBar:GetID());
							if (itemBarGB) then itemBarGB:Hide(); end
						end

					end	
				end

				ItemSync:Parse(self._iteminfo.coreid, self._iteminfo.link);
				
			else
				self:Print(self.crayon:Colorize("A2D96F", ISL["ItemForceFail"]));
			end
			
			self.gnome:Unregister("ForceClickWait"); --unregister to do the function again
			self._canScroll = nil;
		end
	
		self.gnome:Register("ForceClickWait", ForceClickChkDone , 3)
-- kirson add sfactor as 4th arguement
		ItemSync:ForceClick_Wait(link, coreid, subid, sfactor, frame);
	else
		local avail, rate, running = self.gnome:Status("ForceClickWait")

		if (not running ) then
			self.gnome:Start("ForceClickWait", 1)
		else
			self.gnome:ChangeRate("ForceClickWait", 3)
		end
	end
end