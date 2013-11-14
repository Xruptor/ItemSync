-- Id: $Id: Filters.lua 81 2011-05-07 18:31:22Z Brandmauer $
-- Version: r$Revision: 81 $

--[[--------------------------------------------------------------------------------
  ItemSync Filters Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]


function ItemSync:On_DD_FiltersEnable()

	--ISync_Filters_Rarity_DropDown
	--/////////////////////////////////////
	if (ISync_Filters_Rarity_DropDown ) then
		ISync_Filters_Rarity_DropDown:SetBackdropColor(0,0,0,1);
		ISync_Filters_Rarity_DropDownLabel:SetText(ISL["Rarity"]);
		ISync_Filters_Rarity_DropDown._svalue = nil;
		
		self.dewdrop:Register(ISync_Filters_Rarity_DropDown,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				for k=0, 7, 1 do

					local grabColor = ITEM_QUALITY_COLORS[k];
			
					self.dewdrop:AddLine(
						'text', ISA["RARITY"][k],
						'textR', grabColor.r,
						'textG', grabColor.g,
						'textB', grabColor.b,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function()

							ISync_Filters_Rarity_DropDownSelection:SetText(ISA["RARITY"][k]);
							ISync_Filters_Rarity_DropDown._svalue = ISA["RARITY"][ISA["RARITY"][k]];
							--ISync_Filters_Rarity_DropDownSelection:SetText(self.text:GetText());
							--ISync_Filters_Rarity_DropDown._svalue = ISA["RARITY"][self.text:GetText()];
							
							local grabColor_but = ITEM_QUALITY_COLORS[ISync_Filters_Rarity_DropDown._svalue];
							ISync_Filters_Rarity_DropDownSelection:SetTextColor(grabColor_but.r, grabColor_but.g, grabColor_but.b);
							
							PlaySound("igMainMenuOptionCheckBoxOn");
						end
					)
					
				end
		    	end
		)
		
		ISync_Filters_Rarity_DropDown.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_Filters_Rarity_DropDown.OnEnter = function()

		end
		ISync_Filters_Rarity_DropDown.OnLeave = function()

		end
		ISync_Filters_Rarity_DropDown.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_Filters_Rarity_DropDown)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_Filters_Rarity_DropDown);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	--/////////////////////////////////////

	
end

function ItemSync:Validate_FilterOpt()

	if (not self.db.account[self.realm]["options"]["filterrarity"]) then
		self.db.account[self.realm]["options"]["filterrarity"] = { };
	end
	if (not self.db.account[self.realm]["options"]["filterrarity"][0]) then 
		self.db.account[self.realm]["options"]["filterrarity"][0] = 0;
	end
	if (not self.db.account[self.realm]["options"]["filterrarity"][1]) then 
		self.db.account[self.realm]["options"]["filterrarity"][1] = 0;
	end
	if (not self.db.account[self.realm]["options"]["filterrarity"][2]) then 
		self.db.account[self.realm]["options"]["filterrarity"][2] = 0;
	end
	if (not self.db.account[self.realm]["options"]["filterrarity"][3]) then 
		self.db.account[self.realm]["options"]["filterrarity"][3] = 0;
	end
	if (not self.db.account[self.realm]["options"]["filterrarity"][4]) then 
		self.db.account[self.realm]["options"]["filterrarity"][4] = 0;
	end
	if (not self.db.account[self.realm]["options"]["filterrarity"][5]) then 
		self.db.account[self.realm]["options"]["filterrarity"][5] = 0;
	end
	
end

function ItemSync:Load_FilterOpt()

	if (not self.db.account[self.realm]["options"]["filterrarity"]) then self:Validate_FilterOpt(); end
	getglobal("ISync_Filters_Rarity_Opt0"):SetChecked(self.db.account[self.realm]["options"]["filterrarity"][0]);
	getglobal("ISync_Filters_Rarity_Opt1"):SetChecked(self.db.account[self.realm]["options"]["filterrarity"][1]);
	getglobal("ISync_Filters_Rarity_Opt2"):SetChecked(self.db.account[self.realm]["options"]["filterrarity"][2]);
	getglobal("ISync_Filters_Rarity_Opt3"):SetChecked(self.db.account[self.realm]["options"]["filterrarity"][3]);
	getglobal("ISync_Filters_Rarity_Opt4"):SetChecked(self.db.account[self.realm]["options"]["filterrarity"][4]);
	getglobal("ISync_Filters_Rarity_Opt5"):SetChecked(self.db.account[self.realm]["options"]["filterrarity"][5]);
	
end

function ItemSync:Click_FilterOpt(c, n, s)

	if (not s) then s = 0; end --do not store nils
	
	if (s == 1) then PlaySound("igMainMenuOptionCheckBoxOn"); else PlaySound("igMainMenuOptionCheckBoxOff"); end
	
	if (c == "FILTERRARITY") then
	
		if (not self.db.account[self.realm]["options"]["filterrarity"]) then self:Validate_FilterOpt(); end
		self.db.account[self.realm]["options"]["filterrarity"][n] = s;
	
	end
end
