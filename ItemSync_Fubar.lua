--[[--------------------------------------------------------------------------------
  ItemSync FuBar Plugin

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

ItemSyncFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceDB-2.0", "AceEvent-2.0")

ItemSyncFu:RegisterDB("ItemSyncFuDB")

ItemSyncFu.name = "ItemSync"
ItemSyncFu.version = ItemSync.version
ItemSyncFu.hasIcon = "Interface\\Icons\\INV_Misc_Bag_13.png"
ItemSyncFu.clickableTooltip = false
ItemSyncFu.cannotDetachTooltip = true
ItemSyncFu.hideWithoutStandby = true
ItemSyncFu.defaultPosition = "RIGHT"
ItemSyncFu.cannotAttachToMinimap = true
ItemSyncFu.dontCreateMinimap = true

local L = AceLibrary("AceLocale-2.2"):new("FuBar_ItemSyncFu")

local Tablet = AceLibrary("Tablet-2.0")
local Crayon = AceLibrary("Crayon-2.0")

local options = {
	type = "group",
	args = {
		show = {
			type = "execute",
			name = "ItemSync",
			desc = ISL["ToggleMain"],
			func = function()
				ISync_MainFrame:Show();
			end,
		},
	},
	handler = ItemSyncFu
}

ItemSyncFu.OnMenuRequest = options

function ItemSyncFu:OnEnable()

	--self:RegisterEvent("PLAYER_ENTERING_WORLD")
	--self:RegisterEvent("ADDON_LOADED")
end

function ItemSyncFu:OnTextUpdate()

	if (ItemSync.db.account[ItemSync.realm]["options"]["ItemCount"]) then
		self:SetText(Crayon:Colorize("A2D96F", ItemSync.db.account[ItemSync.realm]["options"]["ItemCount"]));
	else
		self:SetText(Crayon:Colorize("A2D96F", 0));
	end

end

function ItemSyncFu:OnTooltipUpdate()
	Tablet:SetHint(ISL["ToggleItemSyncFubar"])
end

function ItemSyncFu:OnClick()
	if (ISync_MainFrame:IsVisible()) then
		ISync_MainFrame:Hide();
	else
		ISync_MainFrame:Show();
	end
end

