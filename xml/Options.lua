--[[--------------------------------------------------------------------------------
  ItemSync Options Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]


function ItemSync:Validate_Opt()

	if (not self.db.account[self.realm]["options"]["showmoney"]) then
		self.db.account[self.realm]["options"]["showmoney"] = { };
	end
	if (not self.db.account[self.realm]["options"]["showmoney"][1]) then 
		self.db.account[self.realm]["options"]["showmoney"][1] = 1;
	end
	if (not self.db.account[self.realm]["options"]["showmoney"][2]) then 
		self.db.account[self.realm]["options"]["showmoney"][2] = 1;
	end
	if (not self.db.account[self.realm]["options"]["showmoney"][3]) then 
		self.db.account[self.realm]["options"]["showmoney"][3] = 1;
	end
	
	if (not self.db.account[self.realm]["options"]["external"]) then
		self.db.account[self.realm]["options"]["external"] = { };
	end
	if (not self.db.account[self.realm]["options"]["external"][1]) then 
		self.db.account[self.realm]["options"]["external"][1] = 1;
	end
	if (not self.db.account[self.realm]["options"]["external"][2]) then 
		self.db.account[self.realm]["options"]["external"][2] = 1;
	end
	if (not self.db.account[self.realm]["options"]["external"][3]) then 
		self.db.account[self.realm]["options"]["external"][3] = 0;
	end
	if (not self.db.account[self.realm]["options"]["external"][4]) then 
		self.db.account[self.realm]["options"]["external"][4] = 0;
	end
	if (not self.db.account[self.realm]["options"]["external"][5]) then 
		self.db.account[self.realm]["options"]["external"][5] = 0;
	end
	
	if (not self.db.account[self.realm]["options"]["database"]) then
		self.db.account[self.realm]["options"]["database"] = { };
	end
	if (not self.db.account[self.realm]["options"]["database"][1]) then 
		self.db.account[self.realm]["options"]["database"][1] = 0;
	end
	--[r10001]
	if (not self.db.account[self.realm]["options"]["dropdown"]) then
		self.db.account[self.realm]["options"]["dropdown"] = { };
	end
	if (not self.db.account[self.realm]["options"]["dropdown"][1]) then 
		self.db.account[self.realm]["options"]["dropdown"][1] = 1;
	end
end

function ItemSync:Load_Opt()

	if (not self.db.account[self.realm]["options"]["showmoney"]) then self:Validate_Opt(); end
	getglobal("ISync_Opt_ShowMoney_Opt1"):SetChecked(self.db.account[self.realm]["options"]["showmoney"][1]);
	getglobal("ISync_Opt_ShowMoney_Opt2"):SetChecked(self.db.account[self.realm]["options"]["showmoney"][2]);
	getglobal("ISync_Opt_ShowMoney_Opt3"):SetChecked(self.db.account[self.realm]["options"]["showmoney"][3]);
	
	if (not self.db.account[self.realm]["options"]["external"]) then self:Validate_Opt(); end
	getglobal("ISync_Opt_External_Opt1"):SetChecked(self.db.account[self.realm]["options"]["external"][1]);
	getglobal("ISync_Opt_External_Opt2"):SetChecked(self.db.account[self.realm]["options"]["external"][2]);
	getglobal("ISync_Opt_External_Opt3"):SetChecked(self.db.account[self.realm]["options"]["external"][3]);
	getglobal("ISync_Opt_External_Opt4"):SetChecked(self.db.account[self.realm]["options"]["external"][4]);
	getglobal("ISync_Opt_External_Opt5"):SetChecked(self.db.account[self.realm]["options"]["external"][5]);
	
	if (not self.db.account[self.realm]["options"]["database"]) then self:Validate_Opt(); end
	getglobal("ISync_Opt_Database_Opt1"):SetChecked(self.db.account[self.realm]["options"]["database"][1]);
	
	if (self.db.account[self.realm]["options"]["external"][1] == 1) then ItemSync_CountFrame:Show(); else ItemSync_CountFrame:Hide(); end

	self:UpdateItemCounter();
end

function ItemSync:Click_Opt(c, n, s)

	if (not s) then s = 0; end --do not store nils
	
	if (s == 1) then PlaySound("igMainMenuOptionCheckBoxOn"); else PlaySound("igMainMenuOptionCheckBoxOff"); end

	if (c == "SHOWMONEY") then
	
		if (not self.db.account[self.realm]["options"]["showmoney"]) then self:Validate_Opt(); end
		self.db.account[self.realm]["options"]["showmoney"][n] = s;
	
	elseif (c == "EXTERNAL") then
	
		if (not self.db.account[self.realm]["options"]["external"]) then self:Validate_Opt(); end
		self.db.account[self.realm]["options"]["external"][n] = s;
		
		if (n == 1 and s == 1) then ItemSync_CountFrame:Show(); elseif (n == 1 and s == 0) then ItemSync_CountFrame:Hide(); end
		if (n == 2) then self:MiniMap_Init(); end

	elseif (c == "DATABASE") then
	
		if (not self.db.account[self.realm]["options"]["database"]) then self:Validate_Opt(); end
		
		if (n==1 and s==1) then
			self:Dialog_MergeDatabase();
		elseif (n==1 and s==0) then
			self:Dialog_SplitDatabase();
		end
	end

end

function ItemSync:Check_Opt(c, n)
	if (not c or not n) then return nil; end
	if (not self.db.account[self.realm]["options"][c]) then return nil; end
	if (not self.db.account[self.realm]["options"][c][n]) then return nil; end
	if (self.db.account[self.realm]["options"][c][n] == 0) then return nil; end
	return self.db.account[self.realm]["options"][c][n];
end

function ItemSync:ResetWindows()

	ISync_MainFrame:ClearAllPoints()
	ISync_MainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		
	ISync_SearchFrame:ClearAllPoints()
	ISync_SearchFrame:SetPoint("TOPLEFT", ISync_MainFrame, "TOPRIGHT", 32, 0)
	
	ISync_OptionsFrame:ClearAllPoints()
	ISync_OptionsFrame:SetPoint("TOPLEFT", ISync_MainFrame, "TOPRIGHT", 32, 0)
	
	ISync_FiltersFrame:ClearAllPoints()
	ISync_FiltersFrame:SetPoint("TOPLEFT", ISync_MainFrame, "TOPRIGHT", 32, 0)
	
	ISync_Favorites:ClearAllPoints()
	ISync_Favorites:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	
	ISync_ItemIDFrame:ClearAllPoints()
	ISync_ItemIDFrame:SetPoint("TOP", ISync_MainFrame, "TOP", 0, 140)
	
	ISync_QuickBagFrame:ClearAllPoints()
	ISync_QuickBagFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	
	ISync_Optimize_Bar:ClearAllPoints()
	ISync_Optimize_Bar:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

	ISync_HelpFrame:ClearAllPoints()
	ISync_HelpFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
					
	self:Print(self.crayon:Colorize("FC5252", ISL["OperationComplete"]));
end

-------
--[r10001]
--ItemSync:ItemCount_OnEnter

function ItemSync:ItemCount_OnEnter()
    GameTooltip:SetOwner(this, "ANCHOR_LEFT");
    GameTooltip:SetText("[ "..self.crayon:Colorize("A2D96F", ISL["ItemCount_FrameHeader"]).." ]");
    GameTooltip:AddLine(self.crayon:White(ISL["ItemCount_LeftClick"]));
    GameTooltip:Show();
end

-------
--[r10001]
--ItemSync:ItemCount_OnMouseUp

function ItemSync:ItemCount_OnMouseUp(f,s)
	if (IsControlKeyDown() and s and s == "LeftButton") then
		if (ISync_MainFrame:IsVisible()) then
			ISync_MainFrame:Hide();
		else
			ISync_MainFrame:Show();
		end				
	else
		f:StopMovingOrSizing();
	end
end


