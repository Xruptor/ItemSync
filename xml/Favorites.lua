
--[[--------------------------------------------------------------------------------
  ItemSync Favorites Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]


function ItemSync:Favorites_Load()

	if (not self.db.account[self.realm]["favorites"][self.charname]) then --if no db then add it
		self.db.account[self.realm]["favorites"][self.charname] = { };
	end

	--ISync_Favorites_DropDown
	--/////////////////////////////////////
	if (ISync_Favorites_DropDown ) then
		ISync_Favorites_DropDown:SetBackdropColor(0,0,0,1);

		self.dewdrop:Register(ISync_Favorites_DropDown,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				for k, v in pairs(self.db.account[self.realm]["favorites"]) do

					self.dewdrop:AddLine(
						'text', k,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function() 

							ISync_Favorites_DropDownSelection:SetText(k);
							--ISync_Favorites_DropDownSelection:SetText(self.text:GetText());
							PlaySound("igMainMenuOptionCheckBoxOn");

							self:Fav_Refresh();		
						end
					)
					
				end
			
		    	end
		)

		ISync_Favorites_DropDown.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_Favorites_DropDown.OnEnter = function()

		end
		ISync_Favorites_DropDown.OnLeave = function()

		end
		ISync_Favorites_DropDown.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_Favorites_DropDown)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_Favorites_DropDown);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	
	--now set user if missing
	if (not ISync_Favorites_DropDownSelection:GetText() or ISync_Favorites_DropDownSelection:GetText() == "") then
		ISync_Favorites_DropDownSelection:SetText(self.charname);
	end
	
end


function ItemSync:Fav_Refresh()
	
	FauxScrollFrame_SetOffset(ISync_Favorites_ListScrollFrame, 0);
	getglobal("ISync_Favorites_ListScrollFrameScrollBar"):SetValue(0);
	ItemSync:Fav_BuildIndex();
	ItemSync:Fav_UpdateScrollFrame();
	
end

function ItemSync:Fav_BuildIndex()
		
		self._favbuildtable 	= { };
		iNew = 1;
		
		local r = { };
		
		for k, v in pairs(self.db.account[self.realm]["favorites"][ISync_Favorites_DropDownSelection:GetText()]) do
		   if (tonumber(v) and tonumber(v) == 0) then
				
				local subName = "";
				local name_X, link_X, quality_X  = GetItemInfo("item:"..k..":0:0:0:0:0:0:0");
			
				if ( name_X ) then
					subName = name_X;
				elseif (self.db.account[self.realm]["names"][k]) then
					subName = self.db.account[self.realm]["names"][k];
				else
					subName = ISL["Unknown"];
				end
				
				if (not quality_X) then quality_X = 0; end
				
				self._favbuildtable[iNew] = { };
				self._favbuildtable[iNew].name = subName;
				self._favbuildtable[iNew].quality = quality_X;
				self._favbuildtable[iNew].idcore = k;
				self._favbuildtable[iNew].subid = 0;
				self._favbuildtable[iNew].sfactor = 0;

				iNew = iNew + 1;
					
			else
				r = {self:_split(v, "�")}

				for kx, vx in pairs(r) do

-- kirson split subid "v" and sfactor "vsfactor" around �
					local vxsfactor = 0
					local vxp = strfind(vx, "�")
					if (vxp) then
						vxsfactor = strsub(vx, vxp+1)
						vx = strsub(vx, 1, vxp-1)
					end
					local subName = "";
-- kirson add vxsfactor for check
					local name_X, link_X, quality_X  = GetItemInfo("item:"..k..":0:0:0:0:0:"..vx..":"..vxsfactor);

					if ( name_X ) then
						subName = name_X;
					elseif (self.db.account[self.realm]["names"][k]) then
						subName = self.db.account[self.realm]["names"][k].." "..ISL["OfThe"];
					else
						subName = ISL["Unknown"].." "..ISL["OfThe"];
					end
					
					if (not quality_X) then quality_X = 0; end

					self._favbuildtable[iNew] = { };
					self._favbuildtable[iNew].name = subName;
					self._favbuildtable[iNew].quality = quality_X;
					self._favbuildtable[iNew].idcore = k;
					self._favbuildtable[iNew].subid = vx;
-- kirson add sfactor to favbuildtable[iNew]
					self._favbuildtable[iNew].sfactor = vxsfactor or 0;

					iNew = iNew + 1;
				end
			end
			
		end

	r = nil;
	

	self._favbuildtable.onePastEnd = iNew;
	ItemSync:Fav_ListSort();

end


function ItemSync:Fav_ListSort()
	table.sort(self._favbuildtable, function(a,b) return a.name<b.name end);	
end


function ItemSync:Fav_UpdateScrollFrame()

local ISYNC_HEIGHT 		= 16;
local ISYNC_SHOWN 		= 23;
local LAST_SHOWN		= 1;

	if self == ISync_Favorites_ListScrollFrame then self = ItemSync; --we get only the srollframe while scrolling
	elseif (not self) then self = ItemSync; --for some reason we lose this upon scroll 
	end
	
	if( not self._favbuildtable or not self._favbuildtable.onePastEnd) then
		 ItemSync:Fav_BuildIndex();
	end
	
	--double check
	if(not self._favbuildtable.onePastEnd) then return nil; end
	
	--Since patch 1.4 the 5th arguement must be nill or an error will occur
	FauxScrollFrame_Update(ISync_Favorites_ListScrollFrame, self._favbuildtable.onePastEnd - 1, ISYNC_SHOWN, ISYNC_HEIGHT, nil);
	
	--do loop until all slots are filled, or we are out of information
	for iItem = 1, ISYNC_SHOWN, 1 do

		local itemIndex = iItem + FauxScrollFrame_GetOffset(ISync_Favorites_ListScrollFrame);
		local FavItemObj = getglobal("ISync_FavoritesItem"..iItem);
		local FavItemObj_Text = getglobal("ISync_FavoritesItem"..iItem.."Text");
		local FavItemObj_Indexed = getglobal("ISync_FavoritesItem"..iItem.."SubItem");
		local FavItemObj_Button = getglobal("ISync_FavoritesRemItem"..iItem);

		if(FavItemObj) then

			if( itemIndex < self._favbuildtable.onePastEnd and self._favbuildtable[itemIndex]) then --are we within bounds?
				
				local lastName;
				if (self._favbuildtable[itemIndex-1]) then lastName = self._favbuildtable[itemIndex-1].name; end --get last name

-- kirson probably unneeded but add sfactor in the check
				local sGName = GetItemInfo("item:"..self._favbuildtable[itemIndex].idcore..":0:0:0:0:0:"..self._favbuildtable[itemIndex].subid..":"..self._favbuildtable[itemIndex].sfactor);

				if (sGName) then --check to see if it's valid
					
					if (lastName and lastName == sGName and tonumber(self._favbuildtable[itemIndex].subid) ~= 0) then
						FavItemObj_Text:SetPoint( "LEFT",  29, 1 );
						FavItemObj_Indexed:SetTexture("Interface\\AddOns\\ItemSync\\images\\Repeat");
						FavItemObj_Indexed:Show();
						FavItemObj:SetText(self.crayon:Colorize("F3EF86", sGName));
						FavItemObj.getColor = "F3EF86";
						
					elseif (lastName and lastName == sGName) then
						FavItemObj_Text:SetPoint( "LEFT",  29, 1 );
						FavItemObj_Indexed:SetTexture("Interface\\MoneyFrame\\Arrow-Right-Down");
						FavItemObj_Indexed:Show();
						FavItemObj:SetText(sGName);
						FavItemObj.getColor = self:ReturnHexColor(self._favbuildtable[itemIndex].quality);
					else
						FavItemObj_Text:SetPoint( "LEFT",  19, 1 );
						FavItemObj_Indexed:Hide();
						FavItemObj:SetText(sGName);
						FavItemObj.getColor = self:ReturnHexColor(self._favbuildtable[itemIndex].quality);
						
					end
							
					local grabColor = ITEM_QUALITY_COLORS[tonumber(self._favbuildtable[itemIndex].quality)];
					if( grabColor) then
						FavItemObj:SetNormalFontObject("GameFontNormal"); -- Font pr�fen
						local font = FavItemObj:GetNormalFontObject();
						font:SetTextColor(grabColor.r, grabColor.g, grabColor.b);
						FavItemObj:SetNormalFontObject(font);
						--FavItemObj:SetTextColor(grabColor.r, grabColor.g, grabColor.b);
						FavItemObj.r = grabColor.r;
						FavItemObj.g = grabColor.g;
						FavItemObj.b = grabColor.b;
					else
						FavItemObj.r = 0;
						FavItemObj.g = 0;
						FavItemObj.b = 0;
					end

					FavItemObj_Button:Show();

					FavItemObj.iteminfo = self._favbuildtable[itemIndex];

--kirson left sfactor out as all subitems share the same texture, technically subitem could be set to 0 here as well
						--add icon texture
						_, _, _, _, _, _, _, _, _, FavItemObj.iteminfo.icontexture  = GetItemInfo("item:"..self._favbuildtable[itemIndex].idcore..":0:0:0:0:0:"..self._favbuildtable[itemIndex].subid..":0");

					FavItemObj.invalid = nil;
				else

					if (lastName and lastName == self._favbuildtable[itemIndex].name) then
						FavItemObj_Text:SetPoint( "LEFT",  29, 1 );
						FavItemObj_Indexed:SetTexture("Interface\\MoneyFrame\\Arrow-Right-Down");
						FavItemObj:SetText(self.crayon:Colorize("FC5252", self._favbuildtable[itemIndex].name));
						FavItemObj.getColor = "FC5252";
						FavItemObj_Indexed:Show();
					else
						FavItemObj_Text:SetPoint( "LEFT",  19, 1 );
						FavItemObj_Indexed:Hide();
						FavItemObj:SetText(self.crayon:Colorize("FC5252", self._favbuildtable[itemIndex].name));
						FavItemObj.getColor = "FC5252";
					end
					

					FavItemObj_Button:Show();

					FavItemObj.iteminfo = self._favbuildtable[itemIndex];
					FavItemObj.invalid = 1;
				end
						

				--show it
				FavItemObj:Show();

				
			else
				FavItemObj.iteminfo = nil;
				FavItemObj:SetText("");
				FavItemObj:Hide();
				FavItemObj_Indexed:Hide();
				FavItemObj_Button:Hide();

			
			end--if( itemIndex < self._favbuildtable.onePastEnd ) then
			
		end--if(FavItemObj) then
		
	end--for iItem = 1, ISYNC_SHOWN, 1 do

end


function ItemSync:Fav_ButtonEnter(self, button)

	if(not self.iteminfo) then return nil; end
	
	--fix the color with the scrolling
	if (not self.invalid) then
		
-- kirson add sfactor into check
		if (GetItemInfo("item:"..self.iteminfo.idcore..":0:0:0:0:0:"..self.iteminfo.subid..":"..self.iteminfo.sfactor)) then

			ISync_MainFrame.TooltipButton = self:GetID();
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
-- kirson add sfactor to retreive proper item stats
			GameTooltip:SetHyperlink("item:"..self.iteminfo.idcore..":0:0:0:0:0:"..self.iteminfo.subid..":"..self.iteminfo.sfactor);

			if (self.iteminfo.icontexture) then
				getglobal("ISync_GameTooltipIconTexture"):SetTexture(self.iteminfo.icontexture);
				getglobal("ISync_GameTooltipIcon"):Show();
			else
				getglobal("ISync_GameTooltipIcon"):Hide();
			end

			ItemSync:Parse(self.iteminfo.idcore, "item:"..self.iteminfo.idcore..":0:0:0:0:0:0:0"); --we don't want subid

		end
		
	else --item is invalid

		ISync_MainFrame.TooltipButton = self:GetID();
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");

		GameTooltip:AddLine(self.crayon:Colorize("FF0000", ISL["InvalidItem"]), 0, 0, 0);
		GameTooltip:AddLine(" ", 0, 0, 0);
-- kirson add sfactor to properly reflect the item
		GameTooltip:AddLine(self.crayon:Colorize("00FF00", ISL["ItemID"]..":").." "..self.crayon:Colorize("BDFCC9", self.iteminfo.idcore..":0:0:0:0:0:"..self.iteminfo.subid..":"..self.iteminfo.sfactor), 0, 0, 0);
		GameTooltip:AddLine(" ", 0, 0, 0);
		
		GameTooltip:Show();
	
	end
	
	
end


function ItemSync:Fav_ButtonClick(self, sButton, down)

	if(not self.iteminfo) then return nil; end

	if (sButton == "LeftButton") then
	
		-- Rework ChatFrameEditbox funktioniert nicht mehr bzw. neu ChatEdit_GetActiveWindow ab 3.3.5
		local ChatFrameEditBox = (ChatEdit_GetActiveWindow and ChatEdit_GetActiveWindow()) or ChatFrameEditBox
		
		if( ChatFrameEditBox and ChatFrameEditBox:IsVisible() and not self.invalid) then
-- kirson pass this.iteminfo.sfactor as 3rd arguement
			ChatFrameEditBox:Insert( ItemSync:ReturnHyperlink(self.iteminfo.idcore, self.iteminfo.subid, self.iteminfo.sfactor) );
			
		elseif( IsShiftKeyDown() and ChatFrameEditBox and ChatFrameEditBox:IsVisible() and not self.invalid) then
-- kirson pass this.iteminfo.sfactor as 3rd arguement
			ChatFrameEditBox:Insert( ItemSync:ReturnHyperlink(self.iteminfo.idcore, self.iteminfo.subid, self.iteminfo.sfactor) );
			
		elseif( IsControlKeyDown() and not self.invalid) then
-- kirson pass this.iteminfo.sfactor as 3rd arguement, more for consistancy than needed as subitems share textures
			DressUpItemLink( ItemSync:ReturnHyperlink(self.iteminfo.idcore, self.iteminfo.subid, self.iteminfo.sfactor) );
		end
		
	elseif (sButton == "RightButton") then
	
	
	end
	
end

function ItemSync:Fav_DeleteButton(self, sFrame, opt)
	
	local this = ItemSync; -- we don't have variable Itemsync in self !!!
	if (opt == 1) then
	
		ISync_MainFrame.TooltipButton = self:GetID();
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");

		GameTooltip:AddLine(this.crayon:Colorize("A2D96F", ISL["Fav_Delete"]), 0, 0, 0); --error:crayon == nil value 
		GameTooltip:AddLine(" ", 0, 0, 0);
		
		local sT = getglobal("ISync_FavoritesItem"..sFrame:GetID());
		
		if (not sT) then return nil; end
		
		GameTooltip:AddLine(this.crayon:Colorize(sT.getColor, sT:GetText()), 0, 0, 0);
		GameTooltip:AddLine(" ", 0, 0, 0);
		
		GameTooltip:Show();
		
	
	elseif (opt == 2) then
	
		local sT = getglobal("ISync_FavoritesItem"..sFrame:GetID());
		
		if (not sT) then return nil; end
		this:Dialog_Delete_Fav(sT);
	end

end