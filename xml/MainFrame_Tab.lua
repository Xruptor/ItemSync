-- Id: $Id: MainFrame_Tab.lua 81 2011-05-07 18:31:22Z Brandmauer $
-- Version: r$Revision: 81 $

--[[--------------------------------------------------------------------------------
  ItemSync MainFrame Tab Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

local ItemSync_Tabs = {
	{ ISL["Search"], ISL["Search"], "Interface\\Icons\\INV_Misc_QuestionMark" },
	{ ISL["Options"], ISL["Options"], "Interface\\Icons\\Trade_Engineering" },
	{ ISL["Filters"], ISL["Filters"], "Interface\\Icons\\Spell_Nature_WispSplode" },
	{ ISL["Favorites"], ISL["Favorites"], "Interface\\Icons\\INV_ValentinesCard01" },
	{ ISL["ItemID"], ISL["ItemID"], "Interface\\Icons\\Ability_Spy" },
	{ ISL["QuickBag"], ISL["QuickBag"], "Interface\\Icons\\INV_Misc_Bag_18" },
};

function ItemSync:MainFrame_TabLoad()

	for i = 1, 6, 1 do
		getglobal("ISync_Tab" .. i).tipinfo = ItemSync_Tabs[i][2];
		getglobal("ISync_Tab" .. i):SetNormalTexture(ItemSync_Tabs[i][3]);
	end
	
end

function ItemSync:TabClick(self, button, down)

	self:SetChecked(0);
	
	if(self:GetID() == 1) then
    		ISync_OptionsFrame:Hide();
    		ISync_FiltersFrame:Hide();
    		if ( ISync_SearchFrame:IsVisible() ) then ISync_SearchFrame:Hide(); else ISync_SearchFrame:Show(); end
	elseif(self:GetID() == 2) then
		ISync_FiltersFrame:Hide();
		ISync_SearchFrame:Hide();
		if ( ISync_OptionsFrame:IsVisible() ) then ISync_OptionsFrame:Hide(); else ISync_OptionsFrame:Show(); end
	elseif(self:GetID() == 3) then
		ISync_OptionsFrame:Hide();
		ISync_SearchFrame:Hide();
		if ( ISync_FiltersFrame:IsVisible() ) then ISync_FiltersFrame:Hide(); else ISync_FiltersFrame:Show(); end
	elseif(self:GetID() == 4) then
		if ( ISync_Favorites:IsVisible() ) then ISync_Favorites:Hide(); else ISync_Favorites:Show(); end
	elseif(self:GetID() == 5) then
		if ( ISync_ItemIDFrame:IsVisible() ) then ISync_ItemIDFrame:Hide(); else ISync_ItemIDFrame:Show(); end
	elseif(self:GetID() == 6) then
		if ( ISync_QuickBagFrame:IsVisible() ) then ISync_QuickBagFrame:Hide(); else ISync_QuickBagFrame:Show(); end			    
	end

end