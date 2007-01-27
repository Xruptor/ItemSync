--[[--------------------------------------------------------------------------------
  ItemSync Minimap Core

  Author:  Derkyle
  Website: http://www.manaflux.com
  Special thanks to the Atlas team which the code was inspired from.
-----------------------------------------------------------------------------------]]
			
function ItemSync:MiniMap_OnLoad()
	if (not self.db.account[self.realm]["options"]["minimap"]) then
		self.db.account[self.realm]["options"]["minimap"] = 294;
	end
	
	if (not self.db.account[self.realm]["options"]["minimapfloat"]) then
		self.db.account[self.realm]["options"]["minimapfloat"] = 0;
	end

	self:MiniMap_Init();
	self:MiniMap_UpdatePosition();
end

function ItemSync:MiniMap_Init()

	if (self:Get_Opt("external", 2, 1)) then
		ItemSyncMiniMapButtonFrame:Show();
	else
		ItemSyncMiniMapButtonFrame:Hide();
	end
end

function ItemSync:MiniMap_UpdatePosition()
	if (not self.db.account[self.realm]["options"]["minimap"]) then self:MiniMap_OnLoad(); end

	if (self.db.account[self.realm]["options"]["minimapfloat"] == 0) then
		ItemSyncMiniMapButtonFrame:ClearAllPoints()
		ItemSyncMiniMapButtonFrame:SetPoint(
			"TOPLEFT",
			"Minimap",
			"TOPLEFT",
			54 - (78 * cos(self.db.account[self.realm]["options"]["minimap"])),
			(78 * sin(self.db.account[self.realm]["options"]["minimap"])) - 55
		);
	end
end

function ItemSync:MiniMap_isBeingDragged(s)

	if (not s) then
	
		local xpos,ypos = GetCursorPosition() 
		local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom() 
			
		--FreeFloat Setup
		if (IsControlKeyDown() and IsShiftKeyDown() and self.db.account[self.realm]["options"]["minimapfloat"] == 0) then
			self.db.account[self.realm]["options"]["minimapfloat"] = 1;
			
			ItemSyncMiniMapButtonFrame:ClearAllPoints()
			ItemSyncMiniMapButtonFrame:SetPoint(
				"CENTER",
				"UIParent",
				"CENTER",
				0,
				0
			);
			
			ItemSyncMiniMapButtonFrame.isbeing_dragged = false;
		end
		--Reset FreeFloat
		if (IsAltKeyDown() and IsShiftKeyDown() and self.db.account[self.realm]["options"]["minimapfloat"] == 1) then
			self.db.account[self.realm]["options"]["minimapfloat"] = 0;
			self.db.account[self.realm]["options"]["minimap"] = 294;
			self:MiniMap_UpdatePosition();
		end

		--Non-FreeFloat
		if (self.db.account[self.realm]["options"]["minimapfloat"] == 0) then
			xpos = xmin-xpos/UIParent:GetScale()+70 
			ypos = ypos/UIParent:GetScale()-ymin-70
		end

		--FreeFloat
		if (self.db.account[self.realm]["options"]["minimapfloat"] == 1) then
			ItemSyncMiniMapButtonFrame:StartMoving();
		else --Non-FreeFloat
			self:MiniMap_SetPosition(math.deg(math.atan2(ypos,xpos)));
		end
    
    	else
    		ItemSyncMiniMapButtonFrame:StopMovingOrSizing()
    	end
end

function ItemSync:MiniMap_SetPosition(v,x)
	
	--[r10001]
	if (self.db.account[self.realm]["options"]["minimapfloat"] == 0) then
		if(v < 0) then
			v = v + 360;
		end

		self.db.account[self.realm]["options"]["minimap"] = v;
		self:MiniMap_UpdatePosition();
	end
end

function ItemSync:MiniMap_OnClick()
	if (ISync_MainFrame:IsVisible()) then ISync_MainFrame:Hide(); else ISync_MainFrame:Show(); end
end

function ItemSync:MiniMap_OnEnter()
    GameTooltip:SetOwner(this, "ANCHOR_LEFT");
    GameTooltip:SetText("ItemSync Version [ "..self.crayon:Colorize("A2D96F", self.version).." ]");
    GameTooltip:AddLine(self.crayon:White(ISL["MiniMap_LeftClick"]));
    GameTooltip:AddLine(self.crayon:White(ISL["MiniMap_RightClick"]));
    GameTooltip:AddLine(self.crayon:White(ISL["MiniMap_Float1"]));
    GameTooltip:AddLine(self.crayon:White(ISL["MiniMap_Float2"]));
    GameTooltip:Show();
end