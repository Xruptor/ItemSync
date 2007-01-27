--[[--------------------------------------------------------------------------------
  ItemSync Dialog Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]


function ItemSync:Dialog_Purge_Invalid()

	ISync_DialogHeaderText:SetText(ISL["PurgeInvalid_DialogHeader"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["PurgeInvalid_DialogWarn"]));
	ISync_DialogItemText:SetText(self.crayon:Green(ISL["PurgeInvalid_DialogWarn2"]));
	ISync_DialogMoreInfo:SetText("");

	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
		
			for k, v in pairs(self.db.account[self.realm]["items"]) do

				r = {self:_split(v, "°")}

				if (r) then

					if(r[13] and tonumber(r[13]) == 0) then

						if ( not GetItemInfo("item:"..k..":0:0:0:0:0:0:0") ) then
						
							self.db.account[self.realm]["items"][k] = nil;
							self.db.account[self.realm]["options"]["ItemCount"] = self.db.account[self.realm]["options"]["ItemCount"] - 1;
							self:UpdateItemCounter();
						end
					else
						q = {self:_split(r[13], "º")}
						
						local subSave;

						for kx, vx in pairs(q) do

							if ( GetItemInfo("item:"..k..":0:0:0:0:0:"..vx..":0") ) then --add if valid
							
								if (not subSave) then
									subSave = vx;
								else
									subSave = subSave.."º"..vx;
								end
							else
								self.db.account[self.realm]["options"]["ItemCount"] = self.db.account[self.realm]["options"]["ItemCount"] - 1;
								self:UpdateItemCounter();
							end

						end
						
						if (not subSave) then --if all the subs were invalid, then delete
							self.db.account[self.realm]["items"][k] = nil;
						else --valid so save it

							r[13] = subSave; --save new one
							
							local sVarQ = ""
	
							for kq, vq in pairs(r) do
								sVarQ = sVarQ..vq.."°"
							end
							
							sVarQ = string.sub(sVarQ, 1, string.len(sVarQ) - 1); --strip off the extra ° at the end
							self.db.account[self.realm]["items"][k] = sVarQ; --store it into database
						end

					end

				end--if (r) then

			end--for k, v in pairs(self.db.account[self.realm]["items"]) do
			
			ISync_Dialog:Hide();
			self:Main_Refresh();
			self:Print(self.crayon:Colorize("FC5252", ISL["PurgeInvalid_DialogComplete"]));
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();

end

function ItemSync:Dialog_Purge_Rarity()

	if (not ISync_Filters_Rarity_DropDown._svalue) then return nil; end

	ISync_DialogHeaderText:SetText(ISL["PurgeRarity_DialogHeader"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["PurgeRarity_DialogWarn"]));
	ISync_DialogItemText:SetText("|cff" .. self:ReturnHexColor(ISync_Filters_Rarity_DropDown._svalue) .. "["..string.upper(ISA["RARITY"][ISync_Filters_Rarity_DropDown._svalue]).."]|r");
	ISync_DialogMoreInfo:SetText("");
	
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
		
			for k, v in pairs(self.db.account[self.realm]["items"]) do

				r = {self:_split(v, "°")}

				if (r) then

					if(r[13] and tonumber(r[13]) == 0) then

						local name_X, link_X, quality_X  = GetItemInfo("item:"..k..":0:0:0:0:0:0:0");
						
						if ( name_X and quality_X and quality_X == ISync_Filters_Rarity_DropDown._svalue) then
						
							self.db.account[self.realm]["items"][k] = nil;
							self.db.account[self.realm]["options"]["ItemCount"] = self.db.account[self.realm]["options"]["ItemCount"] - 1;
							self:UpdateItemCounter();
						end
						
					else
						q = {self:_split(r[13], "º")}
						
						local subSave;

						for kx, vx in pairs(q) do

							local name_X, link_X, quality_X  = GetItemInfo("item:"..k..":0:0:0:0:0:"..vx..":0");
							
							if ( name_X and quality_X and quality_X == ISync_Filters_Rarity_DropDown._svalue) then
							
								self.db.account[self.realm]["options"]["ItemCount"] = self.db.account[self.realm]["options"]["ItemCount"] - 1;
								self:UpdateItemCounter();
							else
							
								if (not subSave) then
									subSave = vx;
								else
									subSave = subSave.."º"..vx;
								end
								
							end

						end
						
						if (not subSave) then --if all the subs were invalid, then delete
							self.db.account[self.realm]["items"][k] = nil;
						else --valid so save it

							r[13] = subSave; --save new one
							
							local sVarQ = ""
	
							for kq, vq in pairs(r) do
								sVarQ = sVarQ..vq.."°"
							end
							
							sVarQ = string.sub(sVarQ, 1, string.len(sVarQ) - 1); --strip off the extra ° at the end
							self.db.account[self.realm]["items"][k] = sVarQ; --store it into database
						end

					end

				end--if (r) then

			end--for k, v in pairs(self.db.account[self.realm]["items"]) do
			
			ISync_Dialog:Hide();
			self:Main_Refresh();
			self:Print(self.crayon:Colorize("FC5252", ISL["PurgeRarity_DialogComplete"]).." |cff" .. self:ReturnHexColor(ISync_Filters_Rarity_DropDown._svalue) .. "["..string.upper(ISA["RARITY"][ISync_Filters_Rarity_DropDown._svalue]).."]|r");
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();

end

function ItemSync:Dialog_Add_Favorite(sFrame)

	if (not sFrame) then return nil; end
						
	ISync_DialogHeaderText:SetText(ISL["Fav_DialogHeader"]);

	local sVal = self.crayon:White(ISL["Fav_CurrentUsr"]).." "..self.crayon:Green(ISync_Favorites_DropDownSelection:GetText());
	sVal = sVal.."\n"..self.crayon:Colorize("A2D96F", ISL["Fav_DialogWarn"]);

	ISync_DialogInfo:SetJustifyH("LEFT");
	ISync_DialogInfo:SetText(sVal);
	
	ISync_DialogInfo.favname = ISync_Favorites_DropDownSelection:GetText();
	ISync_DialogInfo.favframe = sFrame;
	
	ISync_DialogMoreInfo:SetText("");
	
	local grabColor;
	local sF = getglobal(sFrame);
	if (not sF) then return nil; end
			
	if (not sF.invalid) then
	
		grabColor = ITEM_QUALITY_COLORS[tonumber(sF.iteminfo.quality)];					

		ISync_DialogItemText:SetText(sF.iteminfo.name);
		ISync_DialogItemText:SetTextColor(grabColor.r, grabColor.g, grabColor.b);
		
	else
		ISync_DialogItemText:SetText(self.crayon:Colorize("FC5252", sF.iteminfo.name));
	
	end
	
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
		
			local sF = getglobal(ISync_DialogInfo.favframe);
			if (not sF) then return nil; end
	
			local saveSlot = self.db.account[self.realm]["favorites"][ISync_DialogInfo.favname][sF.iteminfo.idcore];
		
			if ( sF.iteminfo.subid ) then
			
				if ( saveSlot ) then
			
					local r = {self:_split(saveSlot, "º")}
						
					if (r) then

						for kx, vx in pairs(r) do

							if (tonumber(vx) and tonumber(vx) == tonumber(sF.iteminfo.subid)) then
								ISync_Dialog:Hide();
								self:Print(self.crayon:Colorize("A2D96F", ISL["Fav_Duplicate"]));
								return nil;
							end
						end							

						saveSlot = saveSlot.."º"..sF.iteminfo.subid; --add it
	
					elseif (not r) then
						
						saveSlot = sF.iteminfo.subid; --add marker at end
					end
					
					r = nil;
					
				else
					saveSlot = sF.iteminfo.subid; --add marker at end
				end
			
			else
				if (tonumber(saveSlot) and tonumber(saveSlot) == 0) then
					ISync_Dialog:Hide();
					self:Print(self.crayon:Colorize("A2D96F", ISL["Fav_Duplicate"]));
					return nil;
				end
				
				saveSlot = "0";
			end
			
			--save it
			self.db.account[self.realm]["favorites"][ISync_DialogInfo.favname][sF.iteminfo.idcore] = saveSlot; 
			
			ISync_Dialog:Hide();
			
			if (sF.invalid) then
				self:Print(self.crayon:White(ISL["Fav_DialogComplete"].." "..self.crayon:Red(ISync_DialogInfo.favname).." | "..self.crayon:Colorize("FC5252", sF.iteminfo.name) ));
			else
				self:Print(self.crayon:White(ISL["Fav_DialogComplete"].." "..self.crayon:Red(ISync_DialogInfo.favname).." | ".."|cff"..self:ReturnHexColor(tonumber(sF.iteminfo.quality))..sF.iteminfo.name.."|r" ));
			end
			
			--refresh the favorites window
			self:Fav_Refresh();
			
			
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySound("igMainMenuOptionCheckBoxOn");	
	--PlaySoundFile("Sound\\Spells\\bind2_Impact_Base.wav");
	
	ISync_Dialog:Show();

end


function ItemSync:Dialog_Purge_Fav()

	ISync_DialogHeaderText:SetText(ISL["Purge"].." "..ISL["Favorites"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["Fav_PurgeWarning"]));
	ISync_DialogItemText:SetText(self.crayon:Green(ISync_Favorites_DropDownSelection:GetText()));
	ISync_DialogMoreInfo:SetText("");
	
	ISync_DialogInfo.favname = ISync_Favorites_DropDownSelection:GetText();

	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
			
			self.db.account[self.realm]["favorites"][ISync_DialogInfo.favname] = nil;
			self.db.account[self.realm]["favorites"][ISync_DialogInfo.favname] = { };
			
			ISync_Dialog:Hide();
			self:Fav_Refresh();
			self:Print(self.crayon:Colorize("FC5252", ISL["Fav_PurgeDialogComplete"]));
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end


function ItemSync:Dialog_Delete_Fav(sFrame)
	
	if (not sFrame) then return nil; end
	
	ISync_DialogHeaderText:SetText(ISL["Fav_DeleteHeader"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["Fav_DeleteWarning"]).."\n"..self.crayon:White("User: ")..self.crayon:Green(ISync_Favorites_DropDownSelection:GetText()));
	ISync_DialogItemText:SetText(self.crayon:Colorize(sFrame.getColor, sFrame:GetText()));
	ISync_DialogMoreInfo:SetText("");
	
	ISync_DialogInfo.favname = ISync_Favorites_DropDownSelection:GetText();
	ISync_DialogInfo.favframe = sFrame:GetName();

	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
		
			local sF = getglobal(ISync_DialogInfo.favframe);
			if (not sF) then ISync_Dialog:Hide(); return nil; end
			
			if (tonumber(sF.iteminfo.subid) and tonumber(sF.iteminfo.subid) == 0) then
			
				self.db.account[self.realm]["favorites"][ISync_DialogInfo.favname][sF.iteminfo.idcore] = nil;
			else
				local saveSlot = self.db.account[self.realm]["favorites"][ISync_DialogInfo.favname][sF.iteminfo.idcore];
				
				local r = {self:_split(saveSlot, "º")}
				local savestring;
						
					if (r) then

						for kx, vx in pairs(r) do

							if (tonumber(vx) and tonumber(vx) ~= tonumber(sF.iteminfo.subid)) then
								
								if (not savestring) then
									savestring = vx;
								else
									savestring = savestring.."º"..vx; --add it
								end
							end
						end
						
					end
				
				r = nil;
				
				self.db.account[self.realm]["favorites"][ISync_DialogInfo.favname][sF.iteminfo.idcore] = savestring;

			end
			
			ISync_Dialog:Hide();
			self:Fav_Refresh();
			self:Print(self.crayon:Colorize(sFrame.getColor, sFrame:GetText())..": "..self.crayon:Colorize("FC5252", ISL["Fav_DeleteComplete"]));
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end


function ItemSync:Dialog_Delete_Item(sFrame, sItemIndex)
	
	if (not sFrame) then return nil; end
	
	ISync_DialogHeaderText:SetText(ISL["DeleteItem_Header"]);
	ISync_DialogInfo:SetJustifyH("CENTER");
	ISync_DialogInfo:SetText(self.crayon:Colorize("A2D96F", ISL["DeleteItem_Warn"]));
	ISync_DialogMoreInfo:SetText("");
	
	local grabColor;
	local sF = getglobal(sFrame);
	if (not sF) then return nil; end
	if (not sF.itemIndex) then return nil; end --make sure we have an index
			
	if (not sF.invalid) then
	
		grabColor = ITEM_QUALITY_COLORS[tonumber(sF.iteminfo.quality)];					

		ISync_DialogItemText:SetText(sF.iteminfo.name);
		ISync_DialogItemText:SetTextColor(grabColor.r, grabColor.g, grabColor.b);
		
	else
		ISync_DialogItemText:SetText(self.crayon:Colorize("FC5252", sF.iteminfo.name));
	
	end
	
	ISync_DialogInfo.deleteframe = sFrame;
	ISync_DialogInfo.deletename = sF.iteminfo.name;
								
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
		
			local sF = getglobal(ISync_DialogInfo.deleteframe);
			if (not sF) then ISync_Dialog:Hide(); return nil; end
			
			if (not sF.invalid) then
				local getColor = self:ReturnHexColor(sF.iteminfo.quality) or "FC5252";
			else
				local getColor = "FC5252";
			end
			
			
			if (not sF.iteminfo.subid) then
			
				self.db.account[self.realm]["items"][sF.iteminfo.idcore] = nil; --delete item but not stored name
				
			else
				local saveSlot = self.db.account[self.realm]["items"][sF.iteminfo.idcore];
				
				local r = {self:_split(saveSlot, "°")}
				local savestring;
					
					if (r) then

						local q = {self:_split(r[13], "º")}
						
						for kx, vx in pairs(q) do

							if (tonumber(vx) and tonumber(vx) ~= tonumber(sF.iteminfo.subid)) then
								
								if (not savestring) then
									savestring = vx;
								else
									savestring = savestring.."º"..vx; --add it
								end
							end
						end
												
						q = nil;
					end
					
					if (not savestring) then --delete it if we have no more subs
						self.db.account[self.realm]["items"][sF.iteminfo.idcore] = nil; --delete item but not stored name
					else
						local sVar = ""
						r[13] = savestring; --save the edited string

						for k, v in pairs(r) do --rebuild the string and store it
							sVar = sVar..v.."°"
						end

						sVar = string.sub(sVar, 1, string.len(sVar) - 1) --strip off the extra ° at the end
						self.db.account[self.realm]["items"][sF.iteminfo.idcore] = sVar --store it into database
	
					end

				r = nil;
			end
			
			self._buildtable[sF.itemIndex] = nil; --delete it from array
			
			self.db.account[self.realm]["options"]["ItemCount"] = self.db.account[self.realm]["options"]["ItemCount"] - 1;
			self:UpdateItemCounter();

			ISync_Dialog:Hide();
			self:UpdateScrollFrame();
			self:Print(self.crayon:Colorize(getColor, ISync_DialogInfo.deletename)..": "..self.crayon:Colorize("FC5252", ISL["DeleteItem_DeleteComplete"]));
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end


function ItemSync:Dialog_MergeDatabase()
	
	ISync_DialogHeaderText:SetText(ISL["OneDB_Header"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["OneDB_SureFirst"]));
	ISync_DialogItemText:SetText(self.crayon:Green(ISL["OneDB_Header"]));
	ISync_DialogMoreInfo:SetText("");
	
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
			
			for k, v in pairs(self.db.account) do --rebuild the string and store it
				if (k ~= "dboptions" or k ~= 1) then
				
					--ITEMS
					for kx, vx in pairs(self.db.account[k]["items"]) do --rebuild the string and store it
						if (not self.db.account[1]["items"][kx]) then
							self.db.account[1]["items"][kx] = vx;
						end
						
						self.db.account[k]["items"][kx] = nil;
					end
					
					--NAMES
					for kx, vx in pairs(self.db.account[k]["names"]) do --rebuild the string and store it
						if (not self.db.account[1]["names"][kx]) then
							self.db.account[1]["names"][kx] = vx;
						end
						
						self.db.account[k]["names"][kx] = nil;
					end
					
					--FAVORITES
					for kx, vx in pairs(self.db.account[k]["favorites"]) do --rebuild the string and store it
						if (not self.db.account[1]["favorites"][kx]) then
							self.db.account[1]["favorites"][kx] = vx;
						end
						
						self.db.account[k]["favorites"][kx] = nil;
					end
					
					self.db.account[k] = nil; --delete the db entry
				end
			end
			
			self.realm = 1; --change the realm
			self:Validate_Opt();
			self.db.account["dboptions"]["sameserv"][1] = 1; --turn it on
			self.db.account[self.realm]["options"]["database"][1] = 1; --tirn it on
			
			ISync_Dialog:Hide();
			ReloadUI();
			self:Print(self.crayon:Colorize("FC5252", ISL["OneDB_Complete"]));
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
	
			local AceDB = AceLibrary("AceDB-2.0")
			self.realm = AceDB.REALM;
			self:Validate_Opt();
			self.db.account["dboptions"]["sameserv"][1] = 0; --turn it off
			self.db.account[self.realm]["options"]["database"][1] = 0; --turn it off
			
			getglobal("ISync_Opt_Database_Opt1"):SetChecked(0);
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end

function ItemSync:Dialog_SplitDatabase()

	ISync_DialogHeaderText:SetText(ISL["OneDB_SplitHeader"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["OneDB_SureSecond"]));
	
	local AceDB = AceLibrary("AceDB-2.0")
	
	ISync_DialogItemText:SetText(self.crayon:Green(AceDB.REALM));
	ISync_DialogMoreInfo:SetText("");
	
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
			
			local AceDB = AceLibrary("AceDB-2.0")
			self.realm = AceDB.REALM; --change the realm back
			
			self:Validate_Opt();
			
			--ITEMS
			for kx, vx in pairs(self.db.account[1]["items"]) do --rebuild the string and store it
				if (not self.db.account[self.realm]["items"][kx]) then
					self.db.account[self.realm]["items"][kx] = vx;
				end

				self.db.account[1]["items"][kx] = nil;
			end

			--NAMES
			for kx, vx in pairs(self.db.account[1]["names"]) do --rebuild the string and store it
				if (not self.db.account[self.realm]["names"][kx]) then
					self.db.account[self.realm]["names"][kx] = vx;
				end

				self.db.account[1]["names"][kx] = nil;
			end

			--FAVORITES
			for kx, vx in pairs(self.db.account[1]["favorites"]) do --rebuild the string and store it
				if (not self.db.account[self.realm]["favorites"][kx]) then
					self.db.account[self.realm]["favorites"][kx] = vx;
				end

				self.db.account[1]["favorites"][kx] = nil;
			end

			self.db.account[1] = nil; --delete the db entry
			
			self.db.account["dboptions"]["sameserv"][1] = 0; --turn it off
			self.db.account[self.realm]["options"]["database"][1] = 0; --turn it off
			
			ISync_Dialog:Hide();
			ReloadUI();
			self:Print(self.crayon:Colorize("FC5252", ISL["OneDB_Complete"]));
			
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			self.db.account["dboptions"]["sameserv"][1] = 1; --turn it on
			self.db.account[self.realm]["options"]["database"][1] = 1; --turn it on
			getglobal("ISync_Opt_Database_Opt1"):SetChecked(1);
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end

function ItemSync:Dialog_Reset_ItemDB()

	ISync_DialogHeaderText:SetText(ISL["Purge"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["Purge_all_db"]));
	ISync_DialogItemText:SetText(self.crayon:Green(ISL["Purge"].."?"));
	ISync_DialogMoreInfo:SetText("");
	
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
			
			self.db.account[self.realm]["items"] = nil;
			self.db.account[self.realm]["items"] = { };

			ISync_Dialog:Hide();
			self:Main_Refresh();
			self:Print(self.crayon:Colorize("FC5252", ISL["Purge"]..": "..ISL["OperationComplete"]));
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end

function ItemSync:Dialog_Optimize()

	ISync_DialogHeaderText:SetText(ISL["Optimize_Header"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["Optimize_Check"]));
	ISync_DialogItemText:SetText(self.crayon:Green(ISL["Optimize_Header"].."?"));
	ISync_DialogMoreInfo:SetText("");
	
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
			
			self:Optimize_Start();
			
			ISync_Dialog:Hide();
			self:Print(self.crayon:Colorize("FC5252", ISL["Optimize_Running"]));
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end


function ItemSync:Dialog_Optimize_Invalid()

	ISync_DialogHeaderText:SetText(ISL["Optimize_InvalidHeader"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["InvalidWarning"]));
	ISync_DialogItemText:SetText("");
	ISync_DialogMoreInfo:SetText(self.crayon:Green(ISL["Optimize_InvalidRelog"]));
	
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
			
			ISync_Dialog:Hide();
			self:Dialog_Optimize_Invalid_Yes();
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end


function ItemSync:Dialog_Optimize_Invalid_Yes()

	ISync_DialogHeaderText:SetText(ISL["Optimize_InvalidHeader"]);

	ISync_DialogInfo:SetJustifyH("CENTER");
	
	ISync_DialogInfo:SetText(self.crayon:Colorize("FC5252", ISL["Optimize_InvalidCheck"]));
	ISync_DialogItemText:SetText(self.crayon:Green(ISL["Optimize_InvalidHeader"].."?"));
	ISync_DialogMoreInfo:SetText("");
	
	ISync_DialogNoButton:SetText(ISL["No"]);
	ISync_DialogYesButton:SetText(ISL["Yes"]);

	ISync_Dialog:SetBackdropColor(0,0,0,1); --set black background no transparency

		ISync_Dialog.DoAction = function()
			
			self:Optimize_Invalid_Start();
			
			ISync_Dialog:Hide();
			self:Print(self.crayon:Colorize("FC5252", ISL["Optimize_InvalidRunning"]));
		
		end--ISync_Dialog.DoAction = function()
		
		ISync_Dialog.DontAction = function()
			
			ISync_Dialog:Hide();
		
		end--ISync_Dialog.DontAction = function()
		
	PlaySoundFile("sound/spells/ShieldWallTarget.wav")
	
	ISync_Dialog:Show();
end
