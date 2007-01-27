--[[--------------------------------------------------------------------------------
  ItemSync

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

BINDING_HEADER_ITEMSYNC = "ItemSync";
BINDING_NAME_ITEMSYNC = "Toggle Main Frame";
BINDING_NAME_FAVORITES = "Toggle Favorites Frame";
BINDING_NAME_ITEMID = "Toggle ItemID Frame";
BINDING_NAME_QUICKBAG = "Toggle QuickBag Frame";

ItemSync = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceModuleCore-2.0", "AceHook-2.1", "AceDebug-2.0", "AceConsole-2.0", "AceDB-2.0")

function ItemSync:OnInitialize()

	local defaults = {
		debug = false,
		show = true,
		mouseover = true,
	}
	
	local args	   = {
		type="group", 
		args = {
			debug = {
				name = "Debug", type = 'toggle', order = 1,
				desc = "Turns display of debugging text on and off.",
				get = function() return self.db.profile.debug end,
				set = function(v) 
					self.db.profile.debug = v
					if (v) then self:SetDebugging(true); else self:SetDebugging(false); end
				end,
			},
			show = {
				name = "Show", type = 'execute', order = 2,
				desc = "Open the ItemSync window.",
				func = function()
					ISync_MainFrame:Show();
				end	
			},
			itemid = {
				name = "Itemid", type = 'execute', order = 3,
				desc = "Open the ItemID window.",
				func = function()
					ISync_ItemIDFrame:Show();
				end	
			},
			quickbag = {
				name = "Quickbag", type = 'execute', order = 4,
				desc = "Open the QuickBag window.",
				func = function()
					ISync_QuickBagFrame:Show();
				end	
			},
			favorites = {
				name = "Favorites", type = 'execute', order = 5,
				desc = "Open the Favorites window.",
				func = function()
					ISync_Favorites:Show();
				end	
			},
			search = {
				name = "Search", type = 'text', order = 6,
			    	desc = 'Do a search for an item by keywords.',
			    	usage = "<partial item name>",
				get = false,
				set = function(v)
					ISyncMainFrame_QuickSearch:SetText("");
					self:ResetSearch();
					ISyncMainFrame_QuickSearch:SetText(v);
					self:Main_Refresh();
					ISync_MainFrame:Show();
					ISyncMainFrame_QuickSearch:SetText("");
				end,
			},
			resetwindow = {
				name = "Reset Window", type = 'execute', order = 7,
				desc = "Resets all ItemSync windows.",
				func = function()
					self:ResetWindows();
				end	
			},
		}
	}
	
	local AceDB = AceLibrary("AceDB-2.0") --get character info
	self.faction = AceDB.FACTION
	self.charId = AceDB.CHAR_ID
	self.realm = AceDB.REALM
	self.charname = AceDB.NAME

	self.gnome = AceLibrary("Metrognome-2.0")
	self.crayon = AceLibrary("Crayon-2.0")
	self.dewdrop = AceLibrary("Dewdrop-2.0")
	
	self:RegisterDB("ISyncDB") --register the database
	self:RegisterDefaults('profile', defaults) --register default profile
	self:RegisterDefaults("account", { ['*'] = { ['*'] = { } } }) --register the account storage
	self:RegisterChatCommand({"/is", "/itemsync", "/isync", "/ims"}, args) --register chat commands

end

function ItemSync:OnEnable()

	--bindings lang setting
	BINDING_NAME_ITEMSYNC = ISL["ToggleMain"];
	BINDING_NAME_FAVORITES = ISL["ToggleFav"];
	BINDING_NAME_ITEMID = ISL["ToggleItemID"];
	BINDING_NAME_QUICKBAG = ISL["ToggleQuick"];

	--same server check
	if (not self.db.account["dboptions"]["sameserv"][1]) then self.db.account["dboptions"]["sameserv"][1] = 0; end
	if (self.db.account["dboptions"]["sameserv"][1] == 1) then self.realm = 1; end --same server
	
	--version check
	if (not self.db.account["dboptions"]["version"][1]) then self.db.account["dboptions"]["version"][1] = self.version; end
	if (self.db.account["dboptions"]["version"][1] ~= self.version) then
		--do some form of update in the future
		self.db.account["dboptions"]["version"][1] = self.version;
	end
	
	--register hooks
	self:SecureHook("ChatEdit_OnTextChanged", "TextChange")
	self:SecureHook("MerchantFrame_Update", "MerchantUpdate")
	
	--load all the important stuff
	self:OnTooltipEnable();
	self:On_DD_MainEnable();
	self:On_DD_SearchEnable();
	self:On_DD_FiltersEnable();
	self:Validate_Opt();
	self:Validate_FilterOpt();
	self:Validate_QuickBagOpt();
	self:Load_Opt();
	self:Load_FilterOpt();
	self:Load_QuickBagOpt();
	self:Favorites_Load();
	self:MiniMap_OnLoad();
	
	self._doOnce = 0;
	self._iteminfo = { };
	
	--register events
	self:RegisterEvent("CHAT_MSG_SYSTEM",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_SAY",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_TEXT_EMOTE",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_YELL",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_WHISPER",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_PARTY",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_GUILD",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_OFFICER",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_CHANNEL",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_RAID",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_LOOT",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_EMOTE",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_MONSTER_SAY",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_MONSTER_WHISPER",	  function() self:ParseChat(arg1) end)
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL",	  function() self:ParseChat(arg1) end)
	
	self:RegisterEvent("PLAYER_ENTERING_WORLD",	  function() self:EventResync(event) end)
	self:RegisterEvent("PLAYER_LEAVING_WORLD",	  function() self:EventResync(event) end)
	self:RegisterEvent("PLAYER_TARGET_CHANGED",	  function() self:Inspect_Target() end)
	self:RegisterEvent("BANKFRAME_OPENED",	  function() self:ScanBank() end)
	self:RegisterEvent("AUCTION_ITEM_LIST_UPDATE",	  function() self:ScanAuction() end)
	self:RegisterEvent("MERCHANT_SHOW",	  function() self:Scan_Prices(); self:VendorScan(); end)
	self:RegisterEvent("BAG_UPDATE",	  function() self:BagUpdate() end)
	self:RegisterEvent("UNIT_INVENTORY_CHANGED",	  function() self:InvenUpdate() end)
	self:RegisterEvent("UPDATE_MOUSEOVER_UNIT",	  function() self:Inspect_Target("mouseover") end)

	--set initial debugging
	if(self.db.profile.debug) then self:SetDebugging(true); else self:SetDebugging(false); end
	
	self:ScanInv() --scan their inventory initially
	self._mousechk = { } --set the mouse check array
	
	tinsert(UISpecialFrames, "ISync_MainFrame"); --add to special frames (to close when pressing esc)
	
	self:Print("Version [ "..self.crayon:Colorize("A2D96F", self.version).." ] has been loaded.") --print load version
end

function ItemSync:OnDisable()
	--unregister stuff registered onenable
end

function ItemSync:TextChange()

	if (not self:Check_Opt("external",3)) then return nil; end
	
	--code credited to Kael KC_Items and creator of type links (Jonathan Ritchie)
	local text = this:GetText();
	
	if (not(strfind(text, "^/script") or strfind(text, "^/dump"))) then
		text = string.gsub(text, "%[%*(.-)%*%]", self.SetTextLink);
		this:SetText(text);

	end
end

function ItemSync.SetTextLink(n)
	local link = ItemSync:GetTextLink(n);
	if (link) then return link; else return nil; end
end

function ItemSync:GetTextLink(text)

	if(not self.db.account[self.realm]["names"]) then return nil; end

	for k, v in pairs(self.db.account[self.realm]["names"]) do
	
		if(strfind(string.lower(v), string.lower(text))) then
			local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo("item:"..k..":0:0:0:0:0:0:0")
				
			if(name_X and link_X) then
				return link_X;
			
			end
		end
	end

	return nil;
end

function ItemSync:MerchantUpdate()
	self:Debug("Checking Merchant Frame")
	self:VendorScan()
end

function ItemSync:ParseChat(text)

	if (text) then
		
		local sStore = { }; --prevent repeats
		
		--special thanks to Kaelten for some advice =)
		for color, item, name in string.gmatch(text, "|c(%x+)|Hitem:([-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+)|h%[(.-)%]|h|r") do
			if(item) then
				if (not sStore[item]) then
					sStore[item] = 1;
					self:_parselinks(item, color, name);
				end
				
			end
		end		
		
		sStore = nil;
	end
	
end

function ItemSync:EventResync(event)

	self:Debug("EventResync: %s", event)
	
	if ( event == "PLAYER_LEAVING_WORLD" ) then
		self:UnregisterEvent("UNIT_INVENTORY_CHANGED")
		self:UnregisterEvent("BAG_UPDATE")
		
	end
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		self:RegisterEvent("UNIT_INVENTORY_CHANGED",	  function() self:InvenUpdate() end)
		self:RegisterEvent("BAG_UPDATE",	  function() self:BagUpdate() end)
		
		if (self._doOnce == 0) then
			self:Inspect_Target("player")
			self:ScanInv()
			self._doOnce = 1;
		end
	end

end

function ItemSync:Inspect_Target(t)
	if (not t) then t = "target"; end
	
	if (t == "target") then
	
		if (UnitIsUnit("target", "player")) then return nil; end --do not do ourselves
		if (not UnitIsPlayer("target")) then return nil; end --don't do anything that isn't a player
		
	elseif (t == "mouseover") then
		
		if (not self:Check_Opt("external",4)) then return nil; end

		if (UnitIsUnit("mouseover", "player")) then return nil; end --do not do ourselves
		if (not UnitIsPlayer("mouseover")) then return nil; end --don't do anything that isn't a player
		
		local sLastScan = self._mousechk[UnitName(t)] or nil
		
		if ( sLastScan and GetTime() - sLastScan < 120 ) then --check if we have scanned them anytime soon, 2 min delay
			return nil; --we did so return nil
		end
		
		self._mousechk.iCount = (self._mousechk.iCount or 0) --initiate if missing
		if (self._mousechk.iCount < 0) then self._mousechk.iCount = 0; end --check for negatives
		
			for k, v in pairs(self._mousechk) do --clean array
				if (k ~= "iCount") then
					if (v and (GetTime() - v) > 120) then --time expired
						self._mousechk[k] = nil;
						self._mousechk.iCount = self._mousechk.iCount - 1;
					end
				
				end
			end
		
		if(self._mousechk.iCount > 50) then --clean out if it exceeds cause we don't want a memory leak
			self._mousechk = nil;
			self._mousechk = { };
		end
		
		self._mousechk[UnitName(t)] = GetTime(); --add our current item and time
		self._mousechk.iCount = (self._mousechk.iCount or 0) + 1; --increment for our current item
	end
	
	for i = 1, 19, 1 do --scan their items
		local link = GetInventoryItemLink(t, i);
		if( link ) then
			self:_parselinks(link);
		end
	end--for i = 1, 19, 1 do
		
end

function ItemSync:ScanBank()

	local bagid, size, slotid, link;
	
	--Bank Container
	size = GetContainerNumSlots(BANK_CONTAINER);
	for slotid = size, 1, -1 do
		link = GetContainerItemLink(BANK_CONTAINER, slotid);
		if( link ) then self:_parselinks(link); end
	end
	
	--Bank Bag Containers
	for bagid= NUM_BAG_SLOTS + 1, (NUM_BAG_SLOTS + NUM_BANKBAGSLOTS), 1 do
	
		size = GetContainerNumSlots(bagid);
		if( size ) then
			for slotid = size, 1, -1 do
				link = GetContainerItemLink(bagid, slotid);
				if( link ) then self:_parselinks(link); end
			end
		end
	end
	
end

function ItemSync:ScanInv()
	self:Debug("Inven Scan")
	
	local bagid, size, slotid, link;
	
	for bagid=0,NUM_BAG_FRAMES,1 do
	
		size = GetContainerNumSlots(bagid);
		
		if( size ) then
			for slotid = size, 1, -1 do
				link = GetContainerItemLink(bagid, slotid);
				if( link ) then self:_parselinks(link); end
			end
		end
	end
	
end

function ItemSync:ScanAuction()
	self:Debug("Auction Scan")
	
	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");
	local auctionid;
	local link;

	if( numBatchAuctions > 0 ) then
		for auctionid = 1, numBatchAuctions do
			link = GetAuctionItemLink("list", auctionid);
			if( link ) then self:_parselinks(link); end
		end
	end
	
end

function ItemSync:BagUpdate()
	
	if(arg1) then --we want to ignore any events in which the bag is ammo / to prevent lag
		if (not tonumber(arg1)) then return nil; end
		if (tonumber(arg1) < 1 or tonumber(arg1) > 11) then return nil; end --may need to fix this later
		
		local invID = ContainerIDToInventoryID(tonumber(arg1));
		if (invID) then
			local link = GetInventoryItemLink("player", invID)
			if (link) then
			
				local sVar = self:_removeNegative(link);
				if (not sVar) then return nil; end

				local coreid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1")
				if (not tonumber(coreid)) then return nil; end
				
				local _,_,_,_,_,_,subtype = GetItemInfo(tonumber(coreid)) 
				if (subtype) then
					if (ISA["BAGS"][subtype]) then --it's an ammo bag so lets ignore it
						self._bagIsAmmo = 1;
						return nil;
					end
				end
			end
		end
	end

	if (not self.gnome:Status("BagUpdate")) then
	
		local BagUpdateDone = function()
			self:ScanInv();
			self:Debug("Bag Update")
		end
	
		self.gnome:Register("BagUpdate", BagUpdateDone , 3)
		self:BagUpdate()
	else
		local avail, rate, running = self.gnome:Status("BagUpdate")

		if (not running ) then
			self.gnome:Start("BagUpdate", 1)
		else
			self.gnome:ChangeRate("BagUpdate", 3)
		end
	end
end

function ItemSync:InvenUpdate()
	
	if (self._bagIsAmmo) then self._bagIsAmmo = nil; return nil; end --check for ammo bag, if so then ignore

	if (not self.gnome:Status("InvenUpdate")) then
	
		local InvenUpdateDone = function()
			self:ScanInv()
			self:Inspect_Target("player")
			self:Debug("Inven Update")
		end
	
		self.gnome:Register("InvenUpdate", InvenUpdateDone , 2)
		self:InvenUpdate()
	else
		local avail, rate, running = self.gnome:Status("InvenUpdate")

		if (not running ) then
			self.gnome:Start("InvenUpdate", 1)
		else
			self.gnome:ChangeRate("InvenUpdate", 2)
		end
	end
end

function ItemSync:_split(s,p,n)
	if (type(s) ~= "string") then return nil; end
	    local l,sp,ep = {},0
	    while(sp) do
		sp,ep=strfind(s,p)
		if(sp) then
		    tinsert(l,strsub(s,1,sp-1))
		    s=strsub(s,ep+1)
		else
		    tinsert(l,s)
		    break
		end
		if(n) then n=n-1 end
		if(n and (n==0)) then tinsert(l,s) break end
	    end
	    return unpack(l)
end

function ItemSync:_removeNegative(l)
	--this function is used to remove the last portion of the itemid with the large numbers and replace it with zero
	
	--special thanks to Kaelten for some advice =)
	local sVar = string.match(l,"([-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:)");
	
	if (not sVar) then return nil; end
	
	sVar = sVar.."0"; --add a zero at the end since we stripped it
	return sVar;
end

function ItemSync:_parselinks(link, color, name)
	if (not link) then return nil; end

	local sVar = self:_removeNegative(link);
	if (not sVar) then return nil; end
	
	local coreid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1")
	local regid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1:0:0:0:0:0:%7:0")
	local subid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%7")
	
	coreid = tonumber(coreid);
	subid = tonumber(subid);
	if (not coreid or not regid) then return nil; end

	local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo("item:"..regid)
	if (not name_X) then --if item invalid add it forcefully
		if (not color) then return nil; end
		if (self:HexReturnQuality(color) == -1) then return nil; end
		if (not name) then return nil; end
		quality_X = self:HexReturnQuality(color);
		minLevel_X = 0;
		name_X = name;
		iconTexture_X = "";
		link_X = "item:"..regid;
	end

	--FILTERS
	if (self:Get_Opt("filterrarity", tonumber(quality_X), 1)) then return nil; end  --if returns true then option is on
	
	--check itemcount
	if (not self.db.account[self.realm]["options"]["ItemCount"]) then self.db.account[self.realm]["options"]["ItemCount"] = 0;  self:UpdateItemCounter(); end

	--quality,price,wl,wt,ts,at,st,level,vendor,vendorqty,idchk,resistances,subitem
	if (not self.db.account[self.realm]["items"][coreid]) then --if not in db then add it
		if(not subid or subid == 0) then
			self.db.account[self.realm]["items"][coreid] = quality_X.."񲣖񲣖񲣖�"..minLevel_X.."񲣖񲣖�0"
			self.db.account[self.realm]["names"][coreid] = name_X
			
			self:Parse(coreid, link_X); --parse the tooltip
			self.db.account[self.realm]["options"]["ItemCount"] = self.db.account[self.realm]["options"]["ItemCount"] + 1;
			self:UpdateItemCounter();

		else
			self.db.account[self.realm]["items"][coreid] = quality_X.."񲣖񲣖񲣖�"..minLevel_X.."񲣖񲣖�"..subid
			if (not GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0")) then
				self.db.account[self.realm]["names"][coreid] = self:StripSubName(name_X)
			else
				self.db.account[self.realm]["names"][coreid] = self:StripSubName(GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0"))
			end
			
			self:Parse(coreid, "item:"..coreid..":0:0:0:0:0:0:0"); --parse the tooltip
			self.db.account[self.realm]["options"]["ItemCount"] = self.db.account[self.realm]["options"]["ItemCount"] + 1;
			self:UpdateItemCounter();
		end
		
	elseif (self.db.account[self.realm]["items"][coreid] and subid ~= 0) then --else check for subitem
		local r = {self:_split(self.db.account[self.realm]["items"][coreid], "�")}
		
		if (r and r[13]) then
			local q = {self:_split(r[13], "�")}
			
			for k, v in pairs(q) do
				if (tonumber(v) == subid) then
					return nil;
				end
			end
			
			self.db.account[self.realm]["items"][coreid] = self.db.account[self.realm]["items"][coreid].."�"..subid
			if (not self.db.account[self.realm]["names"][coreid]) then
				if (not GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0")) then
					self.db.account[self.realm]["names"][coreid] = self:StripSubName(name_X)
				else
					self.db.account[self.realm]["names"][coreid] = self:StripSubName(GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0"))
				end
			elseif ( GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0") and self:StripSubName(GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0"))) then
				if (self.db.account[self.realm]["names"][coreid] ~= self:StripSubName(GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0"))) then
					self.db.account[self.realm]["names"][coreid] = self:StripSubName(GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0"))
				end
			end

			self.db.account[self.realm]["options"]["ItemCount"] = self.db.account[self.realm]["options"]["ItemCount"] + 1;
			self:UpdateItemCounter();
			
		end
		
		--empty out
		r = nil;
		q = nil;
	
	elseif (self.db.account[self.realm]["names"][coreid] and name_X and subid == 0) then --update name if incorrect (not subitem)
		if (self.db.account[self.realm]["names"][coreid] ~= name_X) then
			self.db.account[self.realm]["names"][coreid] = name_X
		end
	elseif (self.db.account[self.realm]["names"][coreid] and name_X and subid ~= 0) then --update name if incorrect for subitems but strip name
	
		if (not self.db.account[self.realm]["names"][coreid]) then
			if (not GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0")) then
				self.db.account[self.realm]["names"][coreid] = self:StripSubName(name_X)
			else
				self.db.account[self.realm]["names"][coreid] = self:StripSubName(GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0"))
			end
		elseif (self.db.account[self.realm]["names"][coreid]) then
			if (not GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0")) then
				if (self.db.account[self.realm]["names"][coreid] ~= self:StripSubName(name_X)) then
					self.db.account[self.realm]["names"][coreid] = self:StripSubName(name_X)
				end	
			else
				if (self.db.account[self.realm]["names"][coreid] ~= self:StripSubName(GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0"))) then
					self.db.account[self.realm]["names"][coreid] = self:StripSubName(GetItemInfo("item:"..coreid..":0:0:0:0:0:0:0"))
				end
			end	
		end
		
	end
	self:Debug("ItemSync:_parselinks: "..name_X.." >> "..link_X.." >> "..iconTexture_X)
	return nil;
end

function ItemSync:StripSubName(t)
	local sFound = 0;
	
	for newName in string.gmatch(t, "(.-)% "..ISL["OfTheCheck1"]) do 
		t = newName;
		sFound = 1;
	end
	
	if (sFound == 0) then 
	
		for newName in string.gmatch(t, "(.-)% "..ISL["OfTheCheck2"]) do 
			t = newName;
			sFound = 1;
		end
	
	end
	
	return t;
end

function ItemSync:ReturnHexColor(n)
	
	if (not n) then return nil; end
	n = tonumber(n);
	if (not n) then return nil; end
	local QL_Colors = { "9d9d9d", "ffffff", "1eff00", "0070dd", "a335ee", "ff8000", "ffcc9d"};
	local color = QL_Colors[n + 1];
	QL_Colors = nil;
	return color;
end
	
function ItemSync:HexReturnQuality(hex)
	
	if (not hex) then return nil; end
	local QL_Colors = {};
	QL_Colors["ff9d9d9d"] = 0;
	QL_Colors["ffffffff"] = 1;
	QL_Colors["ff1eff00"] = 2;
	QL_Colors["ff0070dd"] = 3;
	QL_Colors["ffa335ee"] = 4;
	QL_Colors["ffff8000"] = 5;
	QL_Colors["ffffcc9d"] = 6;
	
	local color = QL_Colors[hex];
	QL_Colors = nil;
	if(not color) then color = -1; end
	return color;
end

function ItemSync:_ItemCache(link, coreid, subid)
	
	if (not link) then return nil; end
	if (strfind(link, ":") and not strfind(link, "item:")) then link = "item:" .. link; end
	if (self._iteminfo.link and self._iteminfo.link == link) then return self._iteminfo.link; end --don't process the same
	
	self._iteminfo = { }; --renew it

	local name_X, link_X, quality_X, itemLevel_X, minLevel_X, class_X, subclass_X, maxStack_X, equipType_X, iconTexture_X  = GetItemInfo(link)
	if (not name_X) then return nil; end
	
	self._iteminfo.coreid =	coreid;
	self._iteminfo.subid =	subid;
	self._iteminfo.name = name_X;
	self._iteminfo.linkClick = link_X;
	self._iteminfo.link = link;
	self._iteminfo.quality = quality_X;
	self._iteminfo.minlevel = minLevel_X;
	self._iteminfo.class = class_X;
	self._iteminfo.subclass = subclass_X;
	self._iteminfo.maxstack = maxStack_X;
	self._iteminfo.icontexture = iconTexture_X;

	return link;
end
		
function ItemSync:ReturnHyperlink(coreid, subid)
	
	if (not coreid) then return nil; end
	if (not subid) then subid = 0; end
	
	local link = "item:"..coreid..":0:0:0:0:0:"..subid..":0";
	
	if (not self:_ItemCache(link, coreid, subid) ) then return nil; end
	if (not	self._iteminfo.quality or not self._iteminfo.link or not self._iteminfo.name or not self._iteminfo.linkClick) then return nil; end
	
	--local color = "|cff" .. self:ReturnHexColor(self._iteminfo.quality);
	--if (not color) then return nil; end
	
	--local returnText = color .. "|H" .. self._iteminfo.link.. "|h[" ..self._iteminfo.name.. "]|h|r";

	return self._iteminfo.linkClick;
	
end

function ItemSync:Scan_Prices()
	self:SecureHook("SetTooltipMoney")
	
	for bag=0,NUM_BAG_FRAMES do
		for slot=1,GetContainerNumSlots(bag) do
		    local link = GetContainerItemLink(bag, slot);
			if (link and link ~= "") then
			
				local sVar = self:_removeNegative(link);
				
				if (sVar) then
				
					local coreid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1")
					coreid = tonumber(coreid)

					if (coreid) then
						self.itemC = nil

						GameTooltip:SetBagItem(bag, slot); --set the bag slot to grab tooltip
						GameTooltip:Hide();

						if(self.itemC) then
							local _, qty = GetContainerItemInfo(bag, slot)
							local CofItem = self.itemC;

							if (qty and qty > 0 and self.itemC > 0) then
								CofItem = floor(self.itemC / qty)
							end

							if (self.itemC < 1) then --item has no value
								self:SavePrice(coreid, -1)
							else
								self:SavePrice(coreid, CofItem)
							end

						else --item has no value
							self:SavePrice(coreid, -1)
						end

					end--if (coreid) then
				end--if (sVar) then
			end--if (link and link ~= "") then
		end
	end
	
	self:Unhook("SetTooltipMoney")
end

function ItemSync:SetTooltipMoney(obj, money)
	self.itemC = money
end

function ItemSync:SavePrice(c, p)
	if (not c or not p) then return nil; end
	if (not self.db.account[self.realm]["items"][c]) then return nil; end

	--quality,price,wl,wt,ts,at,st,level,vendor,vendorqty,idchk,resistances,subitem
	local r = {self:_split(self.db.account[self.realm]["items"][c], "�")}
	
	if (not r or not r[2]) then return nil; end
	if (r[2] == p) then return nil; end --don't save the same price twice
	r[2] = p --set the price
	
	local sVar = ""
	
	for k, v in pairs(r) do --rebuild the string and store it
		sVar = sVar..v.."�"
	end
	
	sVar = string.sub(sVar, 1, string.len(sVar) - 1) --strip off the extra � at the end
	self.db.account[self.realm]["items"][c] = sVar --store it into database
	r = nil;
end

function ItemSync:VendorScan()
	if(not MerchantFrame:IsVisible()) then return nil; end
	
	local numMerchantItems = GetMerchantNumItems();
	local name, texture, price, quantity, numAvailable, isUsable;
	
	for i=1, MERCHANT_ITEMS_PER_PAGE, 1 do
		local index = (((MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE) + i);

		if ( index <= numMerchantItems ) then
			name, texture, price, quantity, numAvailable, isUsable = GetMerchantItemInfo(index);
		
			local link = GetMerchantItemLink(index)
		
			if (link) then
			
				local sVar = self:_removeNegative(link);
				
				if (sVar) then
					local coreid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1")
					coreid = tonumber(coreid)

					if (coreid and not self.db.account[self.realm]["items"][c]) then self:_parselinks(link); end --add if not in db

					if (link and quantity and price) then

						if (coreid) then
							self:SaveMerchantPrice(coreid, price, quantity)
						end

					elseif (link) then --no price so lets just add it
						self:_parselinks(link);
					end
				end--if (sVar) then
			end
			
		end
	end
end

function ItemSync:SaveMerchantPrice(c, p, q)
	if (not c or not p or not q) then return nil; end
	if (not self.db.account[self.realm]["items"][c]) then return nil; end

	--quality,price,wl,wt,ts,at,st,level,vendor,vendorqty,idchk,resistances,subitem
	local r = {self:_split(self.db.account[self.realm]["items"][c], "�")}
	
	if (not r or not r[9] or not r[10]) then return nil; end
	if (r[9] == p and r[10] == q) then return nil; end --don't save the same price twice
	r[9] = p --set the price
	r[10] = q --set the quantity
	
	local sVar = ""
	
	for k, v in pairs(r) do --rebuild the string and store it
		sVar = sVar..v.."�"
	end
	
	sVar = string.sub(sVar, 1, string.len(sVar) - 1) --strip off the extra � at the end
	self.db.account[self.realm]["items"][c] = sVar --store it into database
	r = nil;

end
