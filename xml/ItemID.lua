
--[[--------------------------------------------------------------------------------
  ItemSync ItemID Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]


function ItemSync:ItemID_Search()

	local _, _, userLink = string.find(ISync_ItemIDFrameEdit:GetText(), "([-0-9]+:?[-0-9]*:?[-0-9]*:?[-0-9]*:?[-0-9]*:?[-0-9]*:?[-0-9]*:?[-0-9]*)");
	
	if (userLink) then
		
		local sVar;
	
		if (tonumber(userLink)) then --single digit
			sVar = userLink..":0:0:0:0:0:0:0";
		else
			local sChk2 = string.gsub(userLink, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%8")
			if (not tonumber(sChk2)) then
				self:Print(self.crayon:Colorize("A2D96F", ISL["ItemID_Invalid"]));
				return nil;
			end
			sVar = userLink;
		end
		
		if (not sVar) then self:Print(self.crayon:Colorize("A2D96F", ISL["ItemID_Invalid"])); return nil; end
		
		local coreid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1")
		local regid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%1:0:0:0:0:0:%7:0")
		local subid = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%7")

-- kirson sfactor is the reduced subitem multiplier for negative subids
		local sfactor = 0
		if tonumber(subid) < 0 then
		   sfactor = string.gsub(sVar, "([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+):([-0-9]+)", "%8")
		   sfactor = bit.band(tonumber(sfactor), 65535);
		end

-- kirson pass sfactor as the 4th arguement
		self:ItemID_Start("item:"..sVar,coreid,subid,sfactor);
		
	
	else
		self:Print(self.crayon:Colorize("A2D96F", ISL["ItemID_Invalid"]));
	end

	ISync_ItemIDFrameEdit:SetText(""); --reset

end

-- kirson added sfactor arguement for passthrough
function ItemSync:ItemID_Start(link, coreid, subid, sfactor)
	
	if (not link or not coreid or not subid) then
		self:Print(self.crayon:Colorize("A2D96F", ISL["ItemID_Invalid"]));
		return nil;
	end
	--check for previously running checks
	if (self.gnome:Status("ItemIDValidWait")) then
		self:Print(self.crayon:Colorize("FC5252", ISL["ItemID_ValidWait"]));
		return nil;
	end

	local frame = getglobal("ISync_ItemIDFrame")
	if (not frame) then return nil; end
	
	ISync_ItemIDFrame.TooltipButton = frame:GetID();
	GameTooltip:SetOwner(frame, "ANCHOR_RIGHT");
	
	--now to force it
	GameTooltip:SetHyperlink(link);
	GameTooltip:Show();
	GameTooltip:Hide();
	
	self:Print(self.crayon:Colorize("FC5252", ISL["ItemID_Valid"])..self.crayon:White(link)..self.crayon:Colorize("FC5252", "]"));
	
-- kirson pass sfactor as 4th argument, change reflected at function as well
	self:ItemID_StartShow(link, coreid, subid, sfactor, frame); --now send
	
end

-- kirson added sfactor as 4th arguement for passthrough
function ItemSync:ItemID_StartShow(link, coreid, subid, sfactor, frame)
	
	if (not link or not coreid or not frame or not subid) then return nil; end
	
	if (not self.gnome:Status("ItemIDValidWait")) then
	
		local ItemIDValidChkDone = function()
			local linkold = link;
			local oldcore = coreid;
			local oldsub = subid;
			local oldsfactor = sfactor;
			local oldframe = frame;
			
			if ( ItemSync:ReturnHyperlink(oldcore, oldsub, oldsfactor) ) then
				self:Print(self.crayon:Colorize("A2D96F", ISL["ItemID_ValidYes"]));
				self:Print(ItemSync:ReturnHyperlink(oldcore, oldsub, oldsfactor));
				
				--blizzard really screwed up with negatives so we have to parse two different ways
				for color, item, name in string.gmatch(ItemSync:ReturnHyperlink(oldcore, oldsub, oldsfactor), "|c(%x+)|Hitem:([-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+:[-0-9]+)|h%[(.-)%]|h|r") do
					if(item) then
						self:_parselinks(item, color, name);
					end
				end	
		
				self:Parse(oldcore, linkold);
		
			else
				self:Print(self.crayon:Colorize("FC5252", ISL["ItemID_ValidNo"]));
			end
			
			self.gnome:Unregister("ItemIDValidWait"); --unregister to do the function again
		end
	
		self.gnome:Register("ItemIDValidWait", ItemIDValidChkDone , 3)
-- kirson add sfactor ass 4th arguement
		self:ItemID_StartShow(link, coreid, subid, sfactor, frame);
	else
		local avail, rate, running = self.gnome:Status("ItemIDValidWait")

		if (not running ) then
			self.gnome:Start("ItemIDValidWait", 1)
		else
			self.gnome:ChangeRate("ItemIDValidWait", 3)
		end
	end
end