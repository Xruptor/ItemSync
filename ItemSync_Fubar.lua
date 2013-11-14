-- Id: $Id: ItemSync_Fubar.lua 64 2007-04-08 15:40:55Z derkyle $
-- Version: r$Revision: 64 $

--[[--------------------------------------------------------------------------------
  ItemSync FuBar Plugin

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

ItemSyncFu = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0")

ItemSyncFu.name = "ItemSync"
ItemSyncFu.version = ItemSync.version
ItemSyncFu.hasIcon = "Interface\\Icons\\INV_Misc_Bag_13.png"
ItemSyncFu.hasNoColor = true
ItemSyncFu.defaultMinimapPosition = 294
ItemSyncFu.hideWithoutStandby = true
ItemSyncFu.independentProfile = true
ItemSyncFu.cannotDetachTooltip = true

ItemSyncFu:RegisterDB("ItemSyncFuDB")

local Tablet = AceLibrary("Tablet-2.0")
local Crayon = AceLibrary("Crayon-2.0")

local options = {
	type = "group",
	args = {
		show = {
			type = "execute",
			name = ISL["ToggleMain"],
			desc = ISL["ToggleMain"],
			func = function()
				if (ISync_MainFrame:IsVisible()) then
					ISync_MainFrame:Hide();
				else
					ISync_MainFrame:Show();
				end
			end,
		},
	},
	handler = ItemSyncFu
}
ItemSyncFu.OnMenuRequest = options

function ItemSyncFu:OnEnable()
	--empty for right now
end

function ItemSyncFu:OnTextUpdate()

	if (ItemSync.db.account[ItemSync.realm]["options"]["ItemCount"]) then
		self:SetText(Crayon:Colorize("A2D96F", ItemSync.db.account[ItemSync.realm]["options"]["ItemCount"]));
	else
		self:SetText(Crayon:Colorize("A2D96F", 0));
	end
end

function ItemSyncFu:OnTooltipUpdate()
	
	if (self:IsMinimapAttached()) then
		local cat = Tablet:AddCategory("columns", 2)
		cat:AddLine("text", ISL["MiniMap_LeftClickDown"], "text2", Crayon:Green(ISL["MiniMap_LeftClickDown1"]))
		cat:AddLine("text", ISL["MiniMap_LeftClickMouseDrag"], "text2", Crayon:Green(ISL["MiniMap_LeftClickMouseDrag1"]))
		cat:AddLine("text", ISL["MiniMap_RightClick"], "text2", Crayon:Green(ISL["MiniMap_RightClick1"]))
	end
	Tablet:SetHint(Crayon:Colorize("eda55f", ISL["MiniMap_LeftClick"]).." = "..ISL["MiniMap_LeftClick1"])
	
end

function ItemSyncFu:OnClick(button)
	if (ISync_MainFrame:IsVisible()) then
		ISync_MainFrame:Hide();
	else
		ISync_MainFrame:Show();
	end
	self:UpdateDisplay()
end


