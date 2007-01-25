--[[--------------------------------------------------------------------------------
  ItemSync Tooltip Display Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

function ItemSync:OnTooltipEnable()

	self:SecureHook("GameTooltip_OnHide");
	self:SecureHook("GameTooltip_ClearMoney");
	self:HookScript(ItemRefTooltip, "OnHide", "ItemRefTooltip_OnHide")
	self:SecureHook("SetItemRef");
	
	self:SecureHook(GameTooltip, "SetAuctionItem", "SetAuctionItem")
	self:SecureHook(GameTooltip, "SetBagItem", "SetBagItem")
	self:SecureHook(GameTooltip, "SetCraftItem", "SetCraftItem")
	self:SecureHook(GameTooltip, "SetHyperlink", "SetHyperlink")
	self:SecureHook(GameTooltip, "SetInventoryItem", "SetInventoryItem")
	self:SecureHook(GameTooltip, "SetLootItem", "SetLootItem")
	self:SecureHook(GameTooltip, "SetMerchantItem", "SetMerchantItem")
	self:SecureHook(GameTooltip, "SetQuestItem", "SetQuestItem")
	self:SecureHook(GameTooltip, "SetQuestLogItem", "SetQuestLogItem")
	self:SecureHook(GameTooltip, "SetTradePlayerItem", "SetTradePlayerItem")
	self:SecureHook(GameTooltip, "SetTradeSkillItem", "SetTradeSkillItem")
	self:SecureHook(GameTooltip, "SetTradeTargetItem", "SetTradeTargetItem")
	
end

function ItemSync:GameTooltip_OnHide()

	if(this:GetName() == "GameTooltip") then --we only want to deal with the gametooltip
		getglobal("ISync_GameTooltipIcon"):Hide();
		getglobal("ISync_MoneyTooltip"):Hide();
		GameTooltip_ClearMoney();
		
		--[r10001]
		if (EnhTooltip) then
			EnhTooltip.ClearTooltip();
			EnhTooltip.HideTooltip();
		end
	end
	
end

function ItemSync:GameTooltip_ClearMoney()

	--function here for future use
end

function ItemSync:ItemRefTooltip_OnHide()
	
	getglobal("ISync_ItemRefTooltipIcon"):Hide();
	getglobal("ISync_MoneyTooltipItemRef"):Hide();
	
	--[r10001]
	if (EnhTooltip) then
		EnhTooltip.HideTooltip();
	end
end

function ItemSync:SetItemRef(link, text, button)

	if(not link) then return nil; end
	
	if( strsub(link, 1, 6) ~= "Player" ) then
		if( ItemRefTooltip:IsVisible() and link) then
			if (link) then
			
				if(not DressUpFrame:IsVisible()) then
					ItemSync:Process_Tooltip(ItemRefTooltip,link,1)
				end
			end

		end
		
	end
	

end

function ItemSync:SetAuctionItem(tooltip, type, slot)

	local link = GetAuctionItemLink(type, slot);
	local _,_,qty = GetAuctionItemInfo(type, slot);
	
	self:Process_Tooltip(tooltip,link,qty);
	return link, qty, 1;
end
			
			
function ItemSync:SetBagItem(tooltip, bag, slot)

	local link = GetContainerItemLink(bag, slot);
	local _, qty = GetContainerItemInfo(bag, slot);
	
	self:Process_Tooltip(tooltip,link,qty,1);
	return link, qty, 1;
end
				
				
function ItemSync:SetCraftItem(tooltip, skill, id)

	local link = (id) and GetCraftReagentItemLink(skill, id) or GetCraftItemLink(skill);
	local _, _, qty = GetCraftReagentInfo(skill, id);
	
	self:Process_Tooltip(tooltip,link,qty);
	return link, qty, 1;
end


function ItemSync:SetHyperlink(tooltip, link)
	
	self:Process_Tooltip(tooltip,link,1);
	
	--[r10001]
	if (EnhTooltip) then
		local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo(link)
		if (name_X) then
			EnhTooltip.TooltipCall(tooltip, name_X, link_X, quality_X, 1,nil,1);
		end
	end

	return link, 1;
end


function ItemSync:SetInventoryItem(tooltip, type, slot)

	local link = (type) and GetInventoryItemLink(type, slot) or GetContainerItemLink(BANK_CONTAINER,this:GetID());
	local _, qty;

	if(type) then
		qty = GetInventoryItemCount(type, slot);
	else
		_, qty = GetContainerItemInfo(BANK_CONTAINER,this:GetID());
	end
	
	self:Process_Tooltip(tooltip,link,qty,1);
	
	return link, qty, 1;
end
	
	
function ItemSync:SetLootItem(tooltip, slot)

	local link = GetLootSlotLink(slot);
	local _,_, qty = GetLootSlotInfo(slot);
	
	self:Process_Tooltip(tooltip,link,qty,1);
	return link, qty, 1;
end


function ItemSync:SetMerchantItem(tooltip, id)

	local link = GetMerchantItemLink(id);
	local _,_,_, qty = GetMerchantItemInfo(id);
	
	self:Process_Tooltip(tooltip,link,qty,1);
	return link, qty, 1;
end


function ItemSync:SetQuestItem(tooltip, type, slot)

	local link = GetQuestItemLink(type, slot);
	local _,_, qty = GetQuestItemInfo(type, slot);
	
	self:Process_Tooltip(tooltip,link,qty);
	return link, qty, 1;
end


function ItemSync:SetQuestLogItem(tooltip, type, slot)

	local link = GetQuestLogItemLink(type, slot);
	
	self:Process_Tooltip(tooltip,link,1);
	return link, 1, 1;
end


function ItemSync:SetTradePlayerItem(tooltip, id)

	local link = GetTradePlayerItemLink(id);
	local _,_, qty = GetTradeTargetItemInfo(id);
	
	self:Process_Tooltip(tooltip,link,qty);
	return link, qty, 1;
end
					
									
function ItemSync:SetTradeSkillItem(tooltip, skill, id)

	local link = (id) and GetTradeSkillReagentItemLink(skill, id) or GetTradeSkillItemLink(skill);
	local _, _, qty;

	if(id) then
		_, _, qty = GetTradeSkillReagentInfo(skill, id);
	else
		qty = 1;
	end
	
	self:Process_Tooltip(tooltip,link,qty);
	return link, qty, 1;
end
	
				
function ItemSync:SetTradeTargetItem(tooltip, id)

	local link = GetTradeTargetItemLink(id);
	local _,_, qty = GetTradeTargetItemInfo(id);
	
	self:Process_Tooltip(tooltip,link,qty);
	return link, qty, 1;
end


function ItemSync:Process_Tooltip(tooltip,link,qty,chk)

	if (not tooltip) then return nil; end
	if (not link) then return nil; end
	if (not tonumber(qty) or tonumber(qty) < 1) then qty = 1; end
	if (MerchantFrame:IsVisible() and tooltip:GetName() ~= "ItemRefTooltip") then return nil; end

	local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo(link)
	if (not name_X) then return nil; end

	local sVar = self:_removeNegative(link);
	if (not sVar) then return nil; end

	local coreid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1")
	local regid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1:0:0:0:0:0:%7:0")
	local subid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%7")

	coreid = tonumber(coreid);
	subid = tonumber(subid);
	
	if (not name_X or not sVar or not coreid or not subid) then return nil; end
	if (not self.db.account[self.realm]["items"][coreid]) then return nil; end

	if (not self._lasttooltip or not self._lasttooltip.coreid or self._lasttooltip.coreid ~= coreid) then
		self._lasttooltip = { };
		
		--quality,price,wl,wt,ts,at,st,level,vendor,vendorqty,idchk,resistances,subitem
		local r = {self:_split(self.db.account[self.realm]["items"][coreid], "°")}
		if (not r) then return nil; end
		
		self._lasttooltip.coreid = coreid;
		self._lasttooltip.subid = subid;
		self._lasttooltip.price = tonumber(r[2]) or -1;
		self._lasttooltip.priceqty = (tonumber(r[2]) * qty) or -1;
		self._lasttooltip.vendprice = tonumber(r[9]) or -1;
		self._lasttooltip.vendqty = tonumber(r[10]) or 1;
		self._lasttooltip.link = "item:"..sVar;
		self._lasttooltip.qty = qty;
		r = nil;
		
		self:Debug("Tooltip Process: "..name_X)
		
	elseif (self._lasttooltip.coreid == coreid and self._lasttooltip.qty ~= qty) then
	
		self._lasttooltip.priceqty = (self._lasttooltip.price * qty) or -1;
		self._lasttooltip.qty = qty;
		
		self:Debug("Tooltip Process: "..name_X)
	end
	
	if(self.db.account[self.realm]["options"]["showmoney"][3] == 1 and not chk) then
		
		getglobal("ISync_"..tooltip:GetName().."IconTexture"):SetTexture(iconTexture_X);

		if(tooltip:GetName() == "ItemRefTooltip") then --check for equipcompare
			if(EquipCompare_Enabled) then
				getglobal("ISync_"..tooltip:GetName().."Icon"):SetPoint("TOPLEFT", "ItemRefTooltip", "TOPLEFT" , 3, 39);
			end
		end
		
		getglobal("ISync_"..tooltip:GetName().."Icon"):Show();
	else
		getglobal("ISync_"..tooltip:GetName().."Icon"):Hide();
	end
	
	--//---------Grab Money Tooltip
	local sFrame;
	local lineChk = 0;
	
	if(tooltip:GetName() == "ItemRefTooltip") then
		sFrame = "ISync_MoneyTooltipItemRef";
	else
		sFrame = "ISync_MoneyTooltip";
	end
	
	getglobal(sFrame):Hide();
	
	local text1 = getglobal(sFrame.."Text1");
	local money1 = getglobal(sFrame.."Money1");
	local text2 = getglobal(sFrame.."Text2");
	local money2 = getglobal(sFrame.."Money2");
	money1:Hide();
	text1:Hide();
	money2:Hide();
	text2:Hide();
	--//---------
			
	--check for show price
	if (self.db.account[self.realm]["options"]["showmoney"][1] == 1) then
	
		if (self._lasttooltip.price < 0) then
			
			money1:Hide();
			text1:Hide();
			
			if(lineChk == 0) then tooltip:AddLine(" "); lineChk = 1; end
			tooltip:AddLine(self.crayon:Yellow(ISL["NoSellP"]));

		elseif(self._lasttooltip.price > 0) then
		
			if(lineChk == 0) then tooltip:AddLine(" "); lineChk = 1; end
			tooltip:AddLine(" ", 0, 0, 0);

			MoneyFrame_Update(sFrame.."Money1", self._lasttooltip.priceqty);
			
			text1:SetText("|c00FFFF00"..ISL["Sell"].."[|r|c00BDFCC9"..qty.."|r|c00FFFF00]:  |r");
			text1:ClearAllPoints();
			text1:SetPoint("LEFT", tooltip:GetName().."TextLeft"..tooltip:NumLines(), "LEFT", 0, 0);
			text1:SetWidth(text1:GetStringWidth());
					
			if ( (text1:GetWidth() + money1:GetWidth()) > getglobal(tooltip:GetName().."TextLeft1"):GetWidth() ) then
				getglobal(tooltip:GetName().."TextLeft1"):SetWidth((text1:GetWidth() + money1:GetWidth()) + 10);	
			end
	
			text1:Show();
			money1:Show();
			getglobal(sFrame):Show();
			
		else
			money1:Hide();
			text1:Hide();
		end
			
	end
	
	--check for vendor
	if (self.db.account[self.realm]["options"]["showmoney"][2] == 1) then

		if(self._lasttooltip.vendprice > 0) then
		
			if(lineChk == 0) then tooltip:AddLine(" "); lineChk = 1; end
			tooltip:AddLine(" ", 0, 0, 0);

			MoneyFrame_Update(sFrame.."Money2", self._lasttooltip.vendprice);
			
			text2:SetText("|c00FFFF00"..ISL["Vendor"].."[|r|c00BDFCC9"..self._lasttooltip.vendqty.."|r|c00FFFF00]:  |r");
			text2:ClearAllPoints();
			text2:SetPoint("LEFT", tooltip:GetName().."TextLeft"..tooltip:NumLines(), "LEFT", 0, 0);
			text2:SetWidth(text2:GetStringWidth());
					
			if ( (text2:GetWidth() + money2:GetWidth()) > getglobal(tooltip:GetName().."TextLeft1"):GetWidth() ) then
				getglobal(tooltip:GetName().."TextLeft1"):SetWidth((text2:GetWidth() + money2:GetWidth()) + 10);	
			end
	
			text2:Show();
			money2:Show();
			getglobal(sFrame):Show();
			
		else
			money2:Hide();
			text2:Hide();
		end
	
	end

	--we have to do this to setup the height after being edited (could use TipLib in future from Ace2)
	tooltip:Show();
end

