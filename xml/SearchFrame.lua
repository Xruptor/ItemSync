
--[[--------------------------------------------------------------------------------
  ItemSync SearchFrame Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

function ItemSync:On_DD_SearchEnable()

	--ISync_DD_Location
	--/////////////////////////////////////
	if (ISync_DD_Location ) then
		ISync_DD_Location:SetBackdropColor(0,0,0,1);
		ISync_DD_LocationLabel:SetText(ISL["Location"]);
		ISync_DD_Location._svalue = nil;
		
		self.dewdrop:Register(ISync_DD_Location,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				--sort the keys
				---------------
				self.t2 = {};
				table.foreach (ISA["WL"], function (j) table.insert (self.t2, j) end )
				table.sort (self.t2);
				---------------
				
				self.dewdrop:AddLine(
					'text', ISL["ShowNone"],
					'closeWhenClicked', true,
					'tooltipTitle', "",
					'func', function() ISync_DD_LocationSelection:SetText(""); ISync_DD_Location._svalue = nil; PlaySound("igMainMenuOptionCheckBoxOn");end
				)
				
				for k, v in pairs(self.t2) do

					self.dewdrop:AddLine(
						'text', v,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function() ISync_DD_LocationSelection:SetText(this.text:GetText()); ISync_DD_Location._svalue = ISA["WL"][this.text:GetText()]; PlaySound("igMainMenuOptionCheckBoxOn");end
					)
					
				end
				
				self.t2 = nil; --nil it
			
		    	end
		)
		
		ISync_DD_Location.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_DD_Location.OnEnter = function()

		end
		ISync_DD_Location.OnLeave = function()

		end
		ISync_DD_Location.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_DD_Location)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_DD_Location);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	--/////////////////////////////////////
	

	--ISync_DD_Rarity
	--/////////////////////////////////////
	if (ISync_DD_Rarity ) then
		ISync_DD_Rarity:SetBackdropColor(0,0,0,1);
		ISync_DD_RarityLabel:SetText(ISL["Rarity"]);
		ISync_DD_Rarity._svalue = nil;
		
		self.dewdrop:Register(ISync_DD_Rarity,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()

				self.dewdrop:AddLine(
					'text', ISL["ShowNone"],
					'closeWhenClicked', true,
					'tooltipTitle', "",
					'func', function() ISync_DD_RaritySelection:SetText(""); ISync_DD_Rarity._svalue = nil; PlaySound("igMainMenuOptionCheckBoxOn");end
				)
					
				for k=0, 5, 1 do

					local grabColor = ITEM_QUALITY_COLORS[k];
				
					self.dewdrop:AddLine(
						'text', ISA["RARITY"][k],
						'textR', grabColor.r,
						'textG', grabColor.g,
						'textB', grabColor.b,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function()

							ISync_DD_RaritySelection:SetText(this.text:GetText());
							ISync_DD_Rarity._svalue = ISA["RARITY"][this.text:GetText()];
							
							local grabColor_but = ITEM_QUALITY_COLORS[ISync_DD_Rarity._svalue];
							ISync_DD_RaritySelection:SetTextColor(grabColor_but.r, grabColor_but.g, grabColor_but.b);
							
							PlaySound("igMainMenuOptionCheckBoxOn");
						end
					)
					
				end
		    	end
		)
		
		ISync_DD_Rarity.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_DD_Rarity.OnEnter = function()

		end
		ISync_DD_Rarity.OnLeave = function()

		end
		ISync_DD_Rarity.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_DD_Rarity)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_DD_Rarity);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	--/////////////////////////////////////


	--ISync_DD_Weapon
	--/////////////////////////////////////
	if (ISync_DD_Weapon ) then
		ISync_DD_Weapon:SetBackdropColor(0,0,0,1);
		ISync_DD_WeaponLabel:SetText(ISL["Weapon"]);
		ISync_DD_Weapon._svalue = nil;
		
		self.dewdrop:Register(ISync_DD_Weapon,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				--sort the keys
				---------------
				self.t2 = {};
				table.foreach (ISA["WT"], function (j) table.insert (self.t2, j) end )
				table.sort (self.t2);
				---------------
				
				self.dewdrop:AddLine(
					'text', ISL["ShowNone"],
					'closeWhenClicked', true,
					'tooltipTitle', "",
					'func', function() ISync_DD_WeaponSelection:SetText(""); ISync_DD_Weapon._svalue = nil; PlaySound("igMainMenuOptionCheckBoxOn");end
				)
					
				for k, v in pairs(self.t2) do

					self.dewdrop:AddLine(
						'text', v,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function() ISync_DD_WeaponSelection:SetText(this.text:GetText()); ISync_DD_Weapon._svalue = ISA["WT"][this.text:GetText()]; PlaySound("igMainMenuOptionCheckBoxOn");end
					)
					
				end
				
				self.t2 = nil; --nil it
			
		    	end
		)
		
		ISync_DD_Weapon.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_DD_Weapon.OnEnter = function()

		end
		ISync_DD_Weapon.OnLeave = function()

		end
		ISync_DD_Weapon.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_DD_Weapon)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_DD_Weapon);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	--/////////////////////////////////////
	
	
	--ISync_DD_Tradeskill
	--/////////////////////////////////////
	if (ISync_DD_Tradeskill ) then
		ISync_DD_Tradeskill:SetBackdropColor(0,0,0,1);
		ISync_DD_TradeskillLabel:SetText(ISL["TradeSkill"]);
		ISync_DD_Tradeskill._svalue = nil;
		
		self.dewdrop:Register(ISync_DD_Tradeskill,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				--sort the keys
				---------------
				self.t2 = {};
				table.foreach (ISA["TS"], function (j) table.insert (self.t2, j) end )
				table.sort (self.t2);
				---------------
				
				self.dewdrop:AddLine(
					'text', ISL["ShowNone"],
					'closeWhenClicked', true,
					'tooltipTitle', "",
					'func', function() ISync_DD_TradeskillSelection:SetText(""); ISync_DD_Tradeskill._svalue = nil; PlaySound("igMainMenuOptionCheckBoxOn");end
				)
				
				for k, v in pairs(self.t2) do

					self.dewdrop:AddLine(
						'text', v,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function() ISync_DD_TradeskillSelection:SetText(this.text:GetText()); ISync_DD_Tradeskill._svalue = ISA["TS"][this.text:GetText()]; PlaySound("igMainMenuOptionCheckBoxOn");end
					)
					
				end
				
				self.t2 = nil; --nil it
			
		    	end
		)
		
		ISync_DD_Tradeskill.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_DD_Tradeskill.OnEnter = function()

		end
		ISync_DD_Tradeskill.OnLeave = function()

		end
		ISync_DD_Tradeskill.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_DD_Tradeskill)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_DD_Tradeskill);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	--/////////////////////////////////////
	

	--ISync_DD_Armor
	--/////////////////////////////////////
	if (ISync_DD_Armor ) then
		ISync_DD_Armor:SetBackdropColor(0,0,0,1);
		ISync_DD_ArmorLabel:SetText(ISL["Armor"]);
		ISync_DD_Armor._svalue = nil;
		
		self.dewdrop:Register(ISync_DD_Armor,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				--sort the keys
				---------------
				self.t2 = {};
				table.foreach (ISA["AT"], function (j) table.insert (self.t2, j) end )
				table.sort (self.t2);
				---------------
				
				self.dewdrop:AddLine(
					'text', ISL["ShowNone"],
					'closeWhenClicked', true,
					'tooltipTitle', "",
					'func', function() ISync_DD_ArmorSelection:SetText(""); ISync_DD_Armor._svalue = nil; PlaySound("igMainMenuOptionCheckBoxOn");end
				)
				
				for k, v in pairs(self.t2) do

					self.dewdrop:AddLine(
						'text', v,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function() ISync_DD_ArmorSelection:SetText(this.text:GetText()); ISync_DD_Armor._svalue = ISA["AT"][this.text:GetText()]; PlaySound("igMainMenuOptionCheckBoxOn");end
					)
					
				end
				
				self.t2 = nil; --nil it
			
		    	end
		)
		
		ISync_DD_Armor.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_DD_Armor.OnEnter = function()

		end
		ISync_DD_Armor.OnLeave = function()

		end
		ISync_DD_Armor.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_DD_Armor)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_DD_Armor);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	--/////////////////////////////////////
	
	
	--ISync_DD_Shield
	--/////////////////////////////////////
	if (ISync_DD_Shield ) then
		ISync_DD_Shield:SetBackdropColor(0,0,0,1);
		ISync_DD_ShieldLabel:SetText(ISL["Shield"]);
		ISync_DD_Shield._svalue = nil;
		
		self.dewdrop:Register(ISync_DD_Shield,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				--sort the keys
				---------------
				self.t2 = {};
				table.foreach (ISA["ST"], function (j) table.insert (self.t2, j) end )
				table.sort (self.t2);
				---------------
				
				self.dewdrop:AddLine(
					'text', ISL["ShowNone"],
					'closeWhenClicked', true,
					'tooltipTitle', "",
					'func', function() ISync_DD_ShieldSelection:SetText(""); ISync_DD_Shield._svalue = nil; PlaySound("igMainMenuOptionCheckBoxOn");end
				)
				
				for k, v in pairs(self.t2) do

					self.dewdrop:AddLine(
						'text', v,
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function() ISync_DD_ShieldSelection:SetText(this.text:GetText()); ISync_DD_Shield._svalue = ISA["ST"][this.text:GetText()]; PlaySound("igMainMenuOptionCheckBoxOn");end
					)
					
				end
				
				self.t2 = nil; --nil it
			
		    	end
		)
		
		ISync_DD_Shield.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_DD_Shield.OnEnter = function()

		end
		ISync_DD_Shield.OnLeave = function()

		end
		ISync_DD_Shield.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_DD_Shield)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_DD_Shield);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	--/////////////////////////////////////
	
	
	--ISync_DD_Level
	--/////////////////////////////////////
	if (ISync_DD_Level ) then
		ISync_DD_Level:SetBackdropColor(0,0,0,1);
		ISync_DD_LevelLabel:SetText(ISL["Level"]);
		ISync_DD_Level._svalue = nil;
		
		self.dewdrop:Register(ISync_DD_Level,
			'point', "TOP",
   			'relativePoint', "BOTTOM",
			'children', function()
			
				self.dewdrop:AddLine(
					'text', ISL["ShowNone"],
					'closeWhenClicked', true,
					'tooltipTitle', "",
					'func', function() ISync_DD_LevelSelection:SetText(""); ISync_DD_Level._svalue = nil; PlaySound("igMainMenuOptionCheckBoxOn");end
				)
				
				for k=0, 13, 1 do

					self.dewdrop:AddLine(
						'text', ISA["LEVEL"][k],
						'closeWhenClicked', true,
						'tooltipTitle', "",
						'func', function()

							ISync_DD_LevelSelection:SetText(this.text:GetText());
							ISync_DD_Level._svalue = ISA["LEVEL"][this.text:GetText()];
							
							PlaySound("igMainMenuOptionCheckBoxOn");
						end
					)
					
				end
		    	end
		)
		
		ISync_DD_Level.OnHide = function()
			self.dewdrop:Close();
		end
		ISync_DD_Level.OnEnter = function()

		end
		ISync_DD_Level.OnLeave = function()

		end
		ISync_DD_Level.ToggleMenu = function()
			
			if (self.dewdrop:IsOpen(ISync_DD_Level)) then
				self.dewdrop:Close();
			else
				self.dewdrop:Open(ISync_DD_Level);
				PlaySound("igMainMenuOptionCheckBoxOn");
			end
		end
		
	end
	--/////////////////////////////////////
	

	
end

function ItemSync:ResetSearch()

	ISync_DD_Location._svalue = nil;
	ISync_DD_Rarity._svalue = nil;
	ISync_DD_Weapon._svalue = nil;
	ISync_DD_Tradeskill._svalue = nil;
	ISync_DD_Armor._svalue = nil;
	ISync_DD_Shield._svalue = nil;
	ISync_DD_Level._svalue = nil;
	
	ISync_DD_LocationSelection:SetText("");
	ISync_DD_RaritySelection:SetText("");
	ISync_DD_WeaponSelection:SetText("");
	ISync_DD_TradeskillSelection:SetText("");
	ISync_DD_ArmorSelection:SetText("");
	ISync_DD_ShieldSelection:SetText("");
	ISync_DD_LevelSelection:SetText("");
	
	ISync_Search_Resist1:SetChecked(0);
	ISync_Search_Resist2:SetChecked(0);
	ISync_Search_Resist3:SetChecked(0);
	ISync_Search_Resist4:SetChecked(0);
	ISync_Search_Resist5:SetChecked(0);

	ISync_SearchFrameName_Search:SetText(""); --search edit field
	
end

function ItemSync:Parse_Search(c, r, n)
	
	if (not c or not r or not n) then return nil; end

	--text search
	if(ISyncMainFrame_QuickSearch:GetText() and ISyncMainFrame_QuickSearch:GetText() ~= "") then
		
		self:ResetSearch();
		if (not n) then return nil; end
		if (not string.find( string.lower(n), string.lower( ISyncMainFrame_QuickSearch:GetText() ))) then return nil; end
	
	elseif(ISync_SearchFrameName_Search:GetText() and ISync_SearchFrameName_Search:GetText() ~= "") then
	
		if (not n) then return nil; end
		if (not string.find( string.lower(n), string.lower( ISync_SearchFrameName_Search:GetText() ))) then return nil; end

	end
	
	--------------------------------------------------------	
	--------------------------------------------------------
	--quality,price,wl,wt,ts,at,st,level,vendor,vendorqty,idchk,resistances,subitem
	--------------------------------------------------------	
	--------------------------------------------------------
			
	if (ISync_DD_Rarity._svalue and r[1] and tonumber(r[1]) ~= ISync_DD_Rarity._svalue) then return nil; end
	if (ISync_DD_Location._svalue and r[3] and tonumber(r[3]) ~= ISync_DD_Location._svalue) then return nil; end
	if (ISync_DD_Weapon._svalue and r[4] and tonumber(r[4]) ~= ISync_DD_Weapon._svalue) then return nil; end
	if (ISync_DD_Tradeskill._svalue and r[5] and tonumber(r[5]) ~= ISync_DD_Tradeskill._svalue) then return nil; end
	if (ISync_DD_Armor._svalue and r[6] and tonumber(r[6]) ~= ISync_DD_Armor._svalue) then return nil; end
	if (ISync_DD_Shield._svalue and r[7] and tonumber(r[7]) ~= ISync_DD_Shield._svalue) then return nil; end
	
	
	if (ISync_DD_Level._svalue and r[8] and tonumber(r[8])) then --level check
	
		if (not ISA["LEVEL"][ISync_DD_Level._svalue]) then return nil; end
		
		local lvl1 = string.gsub(ISA["LEVEL"][ISync_DD_Level._svalue], "^(.-)-(.-)$", "%1");
		local lvl2 = string.gsub(ISA["LEVEL"][ISync_DD_Level._svalue], "^(.-)-(.-)$", "%2");
		
		if (not lvl1 or not lvl2) then return nil; end
		if (tonumber(r[8]) < tonumber(lvl1) or  tonumber(r[8]) > tonumber(lvl2)) then return nil; end
		
	end
	
	--resistances
	if (r[12] and ISync_Search_Resist1:GetChecked() or 
		ISync_Search_Resist2:GetChecked() or 
			ISync_Search_Resist3:GetChecked() or 
				ISync_Search_Resist4:GetChecked() or 
					ISync_Search_Resist5:GetChecked() ) then

		if (tonumber(r[12]) and tonumber(r[12]) == 0) then return nil; end
		
		local q = {self:_split(r[12], "¢")}
		if (not q) then return nil; end

		local j = { }; --add it to a temp array

		for kz, vz in pairs(q) do
			if (tonumber(vz)) then j[tonumber(vz)] = "yes"; end
		end

		if (ISync_Search_Resist1:GetChecked() and not j[1]) then return nil; end
		if (ISync_Search_Resist2:GetChecked() and not j[2]) then return nil; end
		if (ISync_Search_Resist3:GetChecked() and not j[3]) then return nil; end
		if (ISync_Search_Resist4:GetChecked() and not j[4]) then return nil; end
		if (ISync_Search_Resist5:GetChecked() and not j[5]) then return nil; end

	end
	
	return 1; --return yes if all passes

end
	