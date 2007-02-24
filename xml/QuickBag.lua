-- Id: $Id: ItemSync.toc 26541 2007-01-30 00:14:59Z kergoth $
-- Version: r$Revision: 26541 $

--[[--------------------------------------------------------------------------------
  ItemSync QuickBag Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]


function ItemSync:Validate_QuickBagOpt()

	if (not self.db.account[self.realm]["options"]["quickbag"]) then
		self.db.account[self.realm]["options"]["quickbag"] = { };
	end
	if (not self.db.account[self.realm]["options"]["quickbag"][0]) then --showstack
		self.db.account[self.realm]["options"]["quickbag"][0] = 1;
	end
	if (not self.db.account[self.realm]["options"]["quickbag"][1]) then --hide empty prices
		self.db.account[self.realm]["options"]["quickbag"][1] = 1;
	end
	if (not self.db.account[self.realm]["options"]["quickbag"][2]) then --sort price
		self.db.account[self.realm]["options"]["quickbag"][2] = 1;
	end
	if (not self.db.account[self.realm]["options"]["quickbag"][3]) then --sort rarity
		self.db.account[self.realm]["options"]["quickbag"][3] = 0;
	end
	
end

function ItemSync:Load_QuickBagOpt()

	if (not self.db.account[self.realm]["options"]["quickbag"]) then self:Validate_QuickBagOpt(); end
	getglobal("ISync_Quickbag_Opt0"):SetChecked(self.db.account[self.realm]["options"]["quickbag"][0]);
	getglobal("ISync_Quickbag_Opt1"):SetChecked(self.db.account[self.realm]["options"]["quickbag"][1]);
	getglobal("ISync_Quickbag_Opt2"):SetChecked(self.db.account[self.realm]["options"]["quickbag"][2]);
	getglobal("ISync_Quickbag_Opt3"):SetChecked(self.db.account[self.realm]["options"]["quickbag"][3]);
	
end

function ItemSync:Click_QuickBagOpt(c, n, s)

	if (not s) then s = 0; end --do not store nils
	
	if (s == 1) then PlaySound("igMainMenuOptionCheckBoxOn"); else PlaySound("igMainMenuOptionCheckBoxOff"); end

	if (c == "QUICKBAG") then
	
		if (not self.db.account[self.realm]["options"]["quickbag"]) then self:Validate_QuickBagOpt(); end
		self.db.account[self.realm]["options"]["quickbag"][n] = s;
	
	end
	
	self:QuickBag_Refresh();
	
end

function ItemSync:QuickBag_Refresh()
	
	local offset = FauxScrollFrame_GetOffset(ISync_QuickBag_ScrollFrame);
	
	if( offset ) then
		--set to last offset
		FauxScrollFrame_SetOffset(ISync_QuickBag_ScrollFrame, offset);	
	else
		--set to zero offset
		FauxScrollFrame_SetOffset(ISync_QuickBag_ScrollFrame, 0);
	end
	
	self:QuickBag_BuildIndex();
	self:QuickBag_UpdateScrollFrame();
end


function ItemSync:QuickBag_BuildIndex()

	self._quickbagindex 	= { };
	iNew = 1;

	local r = { };
	local costOfItem;
	
	for bag=0,NUM_BAG_FRAMES do
		for slot=1,GetContainerNumSlots(bag) do
		    local link = GetContainerItemLink(bag, slot);

		    if (link) then

			local sVar = self:_removeNegative(link);
			
			if (sVar) then
			
				local coreid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1")
				local regid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1:0:0:0:0:0:%7:0")
				local subid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%7")

				coreid = tonumber(coreid);
				subid = tonumber(subid);

				if(self.db.account[self.realm]["items"][coreid]) then

					r = {self:_split(self.db.account[self.realm]["items"][coreid], "°")}

					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(bag, slot);
					local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo(link)

					if(itemCount and name_X) then

						costOfItem = 0;
						costOfItem = tonumber(r[2]);

						--show stacked
						if(costOfItem > 0 and itemCount > 0 and self:Get_Opt("quickbag", 0, 1)) then
							 costOfItem = floor(tonumber(costOfItem) * tonumber(itemCount));
						end

						if(not costOfItem or costOfItem < 1 and self:Get_Opt("quickbag", 1, 1)) then
							--do nothing cause we want to hide value for this item
						else
							if(not costOfItem or costOfItem < 1) then costOfItem = 0; end
							--insert into table
							self._quickbagindex[iNew] = { };
							self._quickbagindex[iNew].name = name_X;
							self._quickbagindex[iNew].money = costOfItem;
							self._quickbagindex[iNew].bag = bag;
							self._quickbagindex[iNew].slot = slot;
							self._quickbagindex[iNew].count = itemCount;
							self._quickbagindex[iNew].quality = quality_X;
							self._quickbagindex[iNew].texture = texture;
							self._quickbagindex[iNew].link = sVar;
							self._quickbagindex[iNew].coreID = coreid;
							self._quickbagindex[iNew].subID = subid;

							iNew = iNew + 1;

						end


					end--if(itemCount) then

				end--if(self.db.account[self.realm]["items"][coreid]) then
			
			end--if (sVar) then
			
		    end-- if (link) then

		end--for slot=1,GetContainerNumSlots(bag) do
	end--end for
    
    
    	self._quickbagindex.onePastEnd = iNew;
	self:QuickBag_Sort();
	
	
end

function ItemSync:QuickBag_Sort()

	if (not self._quickbagindex) then return; end

	--both price and rarity
	if (self:Get_Opt("quickbag", 2, 1) and self:Get_Opt("quickbag", 3, 1)) then
		table.sort(self._quickbagindex, ItemSync_QuickBag_SortBoth);
	elseif (self:Get_Opt("quickbag", 2, 1)) then --price
		table.sort(self._quickbagindex, ItemSync_QuickBag_SortPrice);
	elseif (self:Get_Opt("quickbag", 3, 1)) then --rarity
		table.sort(self._quickbagindex, ItemSync_QuickBag_SortRarity);
	else
		table.sort(self._quickbagindex, function(a,b) return a.name<b.name end);
	end

end

function ItemSync_QuickBag_SortPrice(a,b)

	if(a.money and b.money) then
		return b.money < a.money;
	end

end

function ItemSync_QuickBag_SortRarity(elem1, elem2)

	local color1, color2;

	color1 = elem1.quality;
	color2 = elem2.quality
	
	if(color1 and color2) then
	
		if( color1 == color2 ) then
			return elem1.name < elem2.name;
		end
	
		return color2 < color1;
	
	else
		return nil;
	end
	
end

function ItemSync_QuickBag_SortBoth(elem1, elem2)

	local color1, color2;

	color1 = elem1.quality;
	color2 = elem2.quality
	
	if(color1 and color2) then
	
		if( color1 == color2 ) then
			return elem1.money > elem2.money;
		end
	
		return color2 < color1;
	
	else
		return nil;
	end
	
end

function ItemSync:QuickBag_UpdateScrollFrame()

	local iItem;

	if (not self) then self = ItemSync; end --for some reason we lose this upon scroll
	if (not ISync_QuickBagFrame:IsVisible()) then return; end
	if (not self._quickbagindex) then self:QuickBag_BuildIndex(); end --make sure
	if (not self._quickbagindex or not self._quickbagindex.onePastEnd) then return nil; end

	FauxScrollFrame_Update(ISync_QuickBag_ScrollFrame, self._quickbagindex.onePastEnd - 1, 15, 16);

	for iItem = 1, 15, 1 do

		local itemIndex = iItem + FauxScrollFrame_GetOffset(ISync_QuickBag_ScrollFrame);
		local QuickBagObj = getglobal("ISync_QB_Button"..iItem);

		if( itemIndex < self._quickbagindex.onePastEnd ) then

			if(self._quickbagindex[itemIndex] and self._quickbagindex[itemIndex].link) then

				if(self._quickbagindex[itemIndex].name) then
					getglobal("ISync_QB_Button"..iItem.."Name"):SetText(self._quickbagindex[itemIndex].name);
				end

				--set color
				local color = { };
				if(self._quickbagindex[itemIndex].quality) then
					color = ITEM_QUALITY_COLORS[tonumber(self._quickbagindex[itemIndex].quality)];
					getglobal("ISync_QB_Button"..iItem.."Name"):SetTextColor(color.r, color.g, color.b);
					getglobal("ISync_QB_Button"..iItem.."Name").r = color.r;
					getglobal("ISync_QB_Button"..iItem.."Name").g = color.g;
					getglobal("ISync_QB_Button"..iItem.."Name").b = color.b;
				else
					getglobal("ISync_QB_Button"..iItem.."Name").r = 0;
					getglobal("ISync_QB_Button"..iItem.."Name").g = 0;
					getglobal("ISync_QB_Button"..iItem.."Name").b = 0;
				end


				local moneyFrame = getglobal("ISync_QB_Button"..iItem.."MoneyFrame");

				--set price if available
				if(self._quickbagindex[itemIndex].money and moneyFrame) then

					MoneyFrame_Update(moneyFrame:GetName(), self._quickbagindex[itemIndex].money);
					moneyFrame:Show();
				end


				--set texture
				if(self._quickbagindex[itemIndex].texture) then
					getglobal("ISync_QB_Button"..iItem.."ItemIconTexture"):SetTexture(self._quickbagindex[itemIndex].texture);
				end

				--show stacked items
				if(self._quickbagindex[itemIndex].count > 1 and self:Get_Opt("quickbag", 0, 1)) then
					getglobal("ISync_QB_Button"..iItem.."ItemCount"):SetText(self._quickbagindex[itemIndex].count);
					getglobal("ISync_QB_Button"..iItem.."ItemCount"):Show();
					
					--store the count
					QuickBagObj.storeCount = self._quickbagindex[itemIndex].count;

				else
					getglobal("ISync_QB_Button"..iItem.."ItemCount"):Hide();
					QuickBagObj.storeCount = 1; --default
				end
				
				
				--store the item array in both the item bar and texture
				QuickBagObj.itemInfo = self._quickbagindex[itemIndex];
				
				
				--show the item
				QuickBagObj:Show(); 
			else
				--nothing to show then hide it
				QuickBagObj:Hide();
			end

		else
			--error occured hide it
			QuickBagObj:Hide();
		end

	end --end for
	
end


function ItemSync:QuickBag_ItemEnter()

	local iItem,sFrame

	if(this.itemInfo) then
		iItem = this.itemInfo;
		sFrame = this;
	elseif(this:GetParent():GetName() and getglobal(this:GetParent():GetName()).itemInfo) then
		iItem = getglobal(this:GetParent():GetName()).itemInfo;
		sFrame = getglobal(this:GetParent():GetName());
	else
		return nil;
	end
	
	if(not iItem) then return; end

	local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X = GetItemInfo("item:"..iItem.link);

	if(name_X) then

		--show the sell cursor
		if(MerchantFrame:IsVisible() and not InRepairMode()) then
			ShowContainerSellCursor(iItem.bag, iItem.slot);
		elseif(not MerchantFrame:IsVisible() and InRepairMode()) then
			ResetCursor();
		end

		ISync_QuickBagFrame.TooltipButton = sFrame:GetID();
		GameTooltip:SetOwner(sFrame, "ANCHOR_RIGHT");
		GameTooltip:SetHyperlink(link_X);

		if (iconTexture_X) then
			getglobal("ISync_GameTooltipIconTexture"):SetTexture(iconTexture_X);
			getglobal("ISync_GameTooltipIcon"):Show();
		else
			getglobal("ISync_GameTooltipIcon"):Hide();
		end
				
		self:Parse(iItem.coreID, "item:"..iItem.link); --parse the tooltip

	end
		
end

function ItemSync:QuickBag_ItemClick(sButton)

	local iItem,sFrame

	if(this.itemInfo) then
		iItem = this.itemInfo;
		sFrame = this;
	elseif(this:GetParent():GetName() and getglobal(this:GetParent():GetName()).itemInfo) then
		iItem = getglobal(this:GetParent():GetName()).itemInfo;
		sFrame = getglobal(this:GetParent():GetName());
	else
		return nil;
	end

	if(not iItem) then return; end
	
	if sButton == "LeftButton" then
	
		if IsShiftKeyDown() then
		
		    if ChatFrameEditBox:IsVisible() then
			local link = GetContainerItemLink(iItem.bag, iItem.slot);
			if link then ChatFrameEditBox:Insert(link); end
		    end
		    
		elseif( IsControlKeyDown()) then

			DressUpItemLink(GetContainerItemLink(iItem.bag, iItem.slot));
		else
		    	PickupContainerItem(iItem.bag, iItem.slot);
		end
		
	elseif sButton == "RightButton" then
		
		--sFrame:SetAttribute("unit", "player")
		--sFrame:SetAttribute("type","item")
		--sFrame:SetAttribute("bag",iItem.bag)
		--sFrame:SetAttribute("slot",iItem.slot) 

		--sFrame:SetAttribute("type1", "item")			
		--sFrame:SetAttribute("bag1", "1")
		--sFrame:SetAttribute("slot1", "1")


	 	--inherits="SecureActionButtonTemplate"
	 
		--UseContainerItem(iItem.bag, iItem.slot);
		
		--UseContainerItem(iItem.bag, iItem.slot, "player");
		
		-----------------------------
		--==============================
		
		--QBTempItem1 = CreateFrame('Button')
		--QBTempItem1.SIZE = 37

		--local Item_mt = {__index = QBTempItem1}
		--local name = "QBTempItem1"

		--local item = CreateFrame("Button",name,UIParent,"SecureActionButtonTemplate,ActionButtonTemplate") 


		--local item = CreateFrame('Button', name, nil, 'ContainerFrameItemButtonTemplate')
		--setmetatable(item, Item_mt)
		--item:ClearAllPoints()
		--item:SetPoint("CENTER", UIParent, "CENTER", 0, 0)

		--local border = item:CreateTexture(name .. "Border", "OVERLAY")
		--border:SetWidth(67)
		--border:SetHeight(67)
		--border:SetPoint("CENTER", item)
		--border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
		--border:SetBlendMode("ADD")
		--border:Hide()

		--item:SetScript("PostClick", PostClick)
		--item:SetAttribute("unit", "player")
		--item:SetAttribute("type","item")
		--item:SetAttribute("bag",iItem.bag)
		--item:SetAttribute("slot",iItem.slot)
		--item:Show();			
	end
	
end

