-- Id: $Id$
-- Version: r$Revision$

--[[--------------------------------------------------------------------------------
	ItemSync Traditional Chinese Localization 竹笙姬@暴風祭壇

	Author:  Derkyle
	Website: http://www.manaflux.com

	Chinese Translation By The Following:
-----------------------------------------------------------------------------------]]

ISL = AceLibrary("AceLocale-2.2"):new("ItemSync")
ISL:RegisterTranslations("zhCN", function()
	
	return {
		["No"] = "No",
		["Yes"] = "Yes",
		["Sell"] = "Sell for ",
		["Vendor"] = "Vendor for ",
		["NoSellP"] = "No Sell Price",
		["ReqSearch1"] = "Requires (.+)",
		["ReqSearch2"] = "Level (%d+)",
		["ReqSearch3"] = "(.+) %((%d+)%)",
		["Help"] = "[Help]",
		["OfThe"] = "of ???",
		--OfTheCheck refers to the sub items like  Swash Buckler of the Whale
		["OfTheCheck1"] = "of the", --added two because some languages have masculine and feminine names
		["OfTheCheck2"] = "of the", --so one can be example: german  OfTheCheck1 = der OfTheCheck2 = des
		["TotalItems"] = "Total Items:",
		["TotalShown"] = "Total Shown:",
		["TotalInvalid"] = "Total Invalid:",
		["Item"] = "Item:",
		["ItemDeleted"] = "[Item Deleted]",
		["Reset"]="Reset",
		["Refresh"] = "Refresh",
		["Search"] = "Search",
		["Options"] = "Options",
		["Filters"] = "Filters",
		["Favorites"] = "Favorites",
		["ItemID"] = "ItemID",
		["QuickBag"] = "QuickBag",
		["Unknown"] = "Unknown",
		["Purge"] = "Purge",
		["OperationComplete"] = "Operation Complete!",
		["Purge_all_db"] = "Are you sure you want to\npurge the entire item database? IRREVERSIBLE!",
		["ShowNone"] = "None",
		["DisplayInvalid"] = "Display Invalid",
		
		--////////////////////////////////
		--Key Bindings
		["ToggleMain"] = "Toggle Main Window",
		["ToggleFav"] = "Toggle Favorites Window",
		["ToggleQuick"] = "Toggle QuickBag Window",
		["ToggleItemID"] = "Toggle ItemID Window",
		--////////////////////////////////
		
		--////////////////////////////////
		--Special Cases
		["Crossbow"] = "Crossbow",
		["Thrown"] = "Thrown",
		["Gun"] = "Gun",
		["Wand"] = "Wand",
		"|c00FF0000WARNING: The creator of ItemSync is not\n responsible for any disconnections that\n may occur!|r\n|c00A2D96FUSE AT YOUR OWN RISK!|r";
		--////////////////////////////////
		
		--////////////////////////////////
		--Invalid Item
		["InvalidItem"] = "Item Invalid",
		["InvalidForce"] = "This item could not be found\nin the item cache, to forcefully\nvalidate this item press:\n(CTRL + Right Click)",
		["InvalidWarning"] = "Warning: The creator of ItemSync\ncannot be held accountable for\nany disconnections that may occur.",
		["ForceInvalid"] = "Force Invalid",
		["ItemForce"] = "Are you sure you want to force the\nfollowing item?",
		["ItemForceWait"] = "Item validation in 3 seconds. Note: You may disconnect!",
		["ItemForceFail"] = "Sorry, could not validate the item.",
		["ItemForceSuccess"] = "The following item was successfully validated: ",
		["InvalidForce_Wait"] = "Please wait Invalid Item validation already in progress!",
		--////////////////////////////////
		
		--////////////////////////////////
		--Search Feature
		["SearchName"]="Search by Name:",
		["Location"] = "Location:",
		["Rarity"] = "Rarity:",
		["Weapon"] = "Weapon:",
		["Level"] = "Level:",
		["TradeSkill"] = "Tradeskill:",
		["Armor"] = "Armor:",
		["Shield"] = "Shield:",
		["Resistance"] = "Resistance:",
		["ArcaneResistance"]="Arcane Resistance",
		["FireResistance"]="Fire Resistance",
		["NatureResistance"]="Nature Resistance",
		["FrostResistance"]="Frost Resistance",
		["ShadowResistance"]="Shadow Resistance",
		--////////////////////////////////
		
		--////////////////////////////////
		--Options
		["MoneyOpt_Header"] = "Tooltip Display Options",
		["MoneyOpt_1"] = "Display item sell price.",
		["MoneyOpt_2"] = "Display item vendor price.",
		["MoneyOpt_3"] = "Display item texture on tooltip.",
		["ExternalOpt_Header"] = "External Options",
		["ExternalOpt_1"] = "Display the item count frame.",
		["ExternalOpt_2"] = "Display the minimap button.",
		["ExternalOpt_3"] = "Enable the use of Fetch Links.",
		["ExternalOpt_4"] = "Enable MouseOver inspect. |c00A2D96F(May cause lag)|r",
		["ExternalOpt_5"] = "Hide all items when opening ItemSync.",
		["DatabaseOpt_Header"] = "Database Options",
		["DatabaseOpt_1"] = "Use the same database across servers.",
		["AdditionalOpt_Header"] = "Additional Options",
		["AdditionalOpt_1"] = "Reset all windows.",
		["AdditionalOpt_2"] = "Optimize the databse.",
		["AdditionalOpt_3"] = "Validate invalid items.",
		["AdditionalOpt_4"] = "Reset item database.",
		--////////////////////////////////
		
		--////////////////////////////////
		--Filters
		["RarityOpt_Header"] = "Filter By Rarity",
		["RarityOpt_0"] = "|cff9d9d9dPoor|r",
		["RarityOpt_1"] = "|cffffffffCommon|r",
		["RarityOpt_2"] = "|cff1eff00Uncommon|r",
		["RarityOpt_3"] = "|cff0070ddRare|r",
		["RarityOpt_4"] = "|cffa335eeEpic|r",
		["RarityOpt_5"] = "|cffff8000Legendary|r",
		["RarityOpt_6"] = "|cffffcc9dArtifact|r",
		["RarityOpt_7"] = "|cffe6cc80Heirloom|r",
		["Filters_PurgeInvalid"] = "Purge All Invalid Items",
		["Filters_PurgeRarity"] = "Purge All Items By Rarity",
		["PurgeInvalid_DialogHeader"] = "Purge Invalid",
		["PurgeInvalid_DialogWarn"] = "Are you sure you want to PURGE all:\n",
		["PurgeInvalid_DialogWarn2"] = "[INVALID ITEMS]",
		["PurgeInvalid_DialogComplete"] = "Purge process complete: [INVALID ITEMS]",
		["PurgeRarity_DialogHeader"] = "Purge Rarity",
		["PurgeRarity_DialogWarn"] = "Are you sure you want to PURGE all:\n",
		["PurgeRarity_DialogComplete"] = "Purge process complete:",
		--////////////////////////////////
		
		--////////////////////////////////
		--Favorites
		["Fav_CurrentUsr"] = "Current Selection:",
		["Fav_DialogHeader"] = "Add Favorite",
		["Fav_DialogWarn"] = "Add item to current selected users favorites?",
		["Fav_DialogComplete"] = "Favorite added to user:",
		["Fav_Duplicate"] = "Item is already stored in favorites.",
		["Fav_Delete"] = "Click to remove item from favorites.",
		["Fav_PurgeWarning"] = "Are you sure you want to purge the\n favorites for the following user?",
		["Fav_PurgeDialogComplete"] = "Favorites purge process complete:",
		["Fav_DeleteHeader"] = "Delete Favorite",
		["Fav_DeleteWarning"] = "Delete the following item from user?",
		["Fav_DeleteComplete"] = "Item has been successfully deleted from favorites.",
		--////////////////////////////////
		
		--////////////////////////////////
		--ItemID
		["ItemID_Item"] = "item:",
		["ItemID_Format"] = "Example: 12345:0:0:0:0:0:0:0 or 12345",
		["ItemID_Warn"] = "WARNING: The creator of ItemSync is not\n responsible for any disconnections that\n may occur!\n",
		["ItemID_Warn2"] = "USE AT YOUR OWN RISK!",
		["ItemID_Invalid"] = "Invalid ItemID!",
		["ItemID_Valid"] = "Please wait 3 seconds for item validation [",
		["ItemID_ValidYes"] = "Item validation successful!",
		["ItemID_ValidNo"] = "Item validation failed!",
		["ItemID_ValidWait"] = "Please wait ItemID validation already in progress!",
		--////////////////////////////////
		
		--////////////////////////////////
		--Delete Item
		["DeleteItem_Header"] = "Delete Item",
		["DeleteItem_Warn"] = "Are you sure you want to delete\nthe following item from the DATABASE?",
		["DeleteItem_DeleteComplete"] = "Item has been successfully deleted.",
		--////////////////////////////////
		
		--////////////////////////////////
		--QuickBag
		["QuickBag_ShowStack"] = "Show Stacked Total",
		["QuickBag_HideEmpty"] = "Hide Empty Prices",
		["QuickBag_SortPrice"] = "Sort by Price",
		["QuickBag_SortRarity"] = "Sort by Rarity",
		--////////////////////////////////
		
		--////////////////////////////////
		--MiniMap
		["MiniMap_LeftClick"] = "(Click)",
		["MiniMap_LeftClick1"] = "Toggle ItemSync",
		["MiniMap_LeftClickDown"] = "(Left-Click)",
		["MiniMap_LeftClickDown1"] = "Move Minimap",
		["MiniMap_LeftClickMouseDrag"] = "(Alt+Left-Click)",
		["MiniMap_LeftClickMouseDrag1"] = "Free Floating Minimap",
		["MiniMap_RightClick"] = "(Right-Click)",
		["MiniMap_RightClick1"] = "Display Menu",
		--////////////////////////////////
		
		--////////////////////////////////
		--One database
		["OneDB_Header"] = "Merge Database",
		["OneDB_SplitHeader"] = "Split Database",
		["OneDB_SureFirst"] = "Are you sure you wish to merge\nyour database into one?",
		["OneDB_SureSecond"] = "Are you sure you want to split\nyour database to:",
		["OneDB_Complete"] = "Database operation complete!",
		--////////////////////////////////
		
		--////////////////////////////////
		--Optimize
		["Optimize_Header"] = "Optimize",
		["Optimize_InvalidHeader"] = "Validate",
		["Optimize_Running"] = "Optimizing",
		["Optimize_InvalidRunning"] = "Validating",
		["Optimize_Complete"] = "Optimizing is complete",
		["Optimize_InvalidComplete"] = "Validating is complete",
		["Optimize_Check"] = "Are you sure you want to\noptimize the database?",
		["Optimize_InvalidCheck"] = "Are you sure you want to\nvalidate the invalid items?",
		["Optimize_No"] = "Optimizing already in progress!",
		["Optimize_InvalidRelog"] = "Note: Not all items will validate\nuntil you logout->login.",
		--////////////////////////////////
		
		--////////////////////////////////
		--Help
		["Help_MainSection"] = 19,
		["Help_MainSection1"] = "|c00A2D96F(LEFT-CLICK)|r\n",
		["Help_MainSection2"] = "(Left-Click) = Link item in chat.\n",
		["Help_MainSection3"] = "(Shift)+(Left-Click) = Link item in chat.\n",
		["Help_MainSection4"] = "(Control)+(Shift)+(Left-Click) = Add item to Favorites.\n",
		["Help_MainSection5"] = "(Control)+(Left-Click) = Use item in Dressing Room.\n",
		["Help_MainSection6"] = "\n",
		["Help_MainSection7"] = "|c00A2D96F(RIGHT-CLICK)|r\n",
		["Help_MainSection8"] = "(Control)+(Right-Click) = Force invalid item validation.\n",
		["Help_MainSection9"] = "(Alt)+(Right-Click) = Delete item from database.\n",
		["Help_MainSection10"] = "\n",
		["Help_MainSection11"] = "Total items is the amount of items stored in the database.\n",
		["Help_MainSection12"] = "Total shown is the amount of items currently shown in the main window.\n",
		["Help_MainSection13"] = "If you want to update your currently shown items then press the REFRESH button.\n",
		["Help_MainSection14"] = "\n",
		["Help_MainSection15"] = "|c00FC5252(ITEM)|r = Invalid item.\n",
		["Help_MainSection16"] = "|c00F3EF86(ITEM)|r = Duplicate item with [DIFFERENT] stats.\n",
		["Help_MainSection17"] = "\n",
		["Help_MainSection18"] = "Items with the same name but different classes are shown as sub-items.  They will have an arrow in front of them.\n",
		["Help_MainSection19"] = "\n\n",
		["Help_OptionsSection"] = 32,
		["Help_OptionsSection1"] = "|c00A2D96FFETCH LINKS|r\n",
		["Help_OptionsSection2"] = "Fetch Links allows you to link items in chat using partial item names; or full names. This feature is NOT case-sensative.  ",
		["Help_OptionsSection3"] = "You don't have to use the words in the front of the name.  You can use any part of the item name to link an item.\n\n",
		["Help_OptionsSection4"] = "Example: [*copp*] would return the item link for [Copper Ore]\n",
		["Help_OptionsSection5"] = "Example: [*ore*] would return the item link for [Copper Ore]\n",
		["Help_OptionsSection6"] = "Example: [*flight*] would return the item link for [Breastplate of the Chromatic Flight]\n",
		["Help_OptionsSection7"] = "Example: [*chrom*] would return the item link for [Breastplate of the Chromatic Flight]\n",
		["Help_OptionsSection8"] = "\n\n",
		["Help_OptionsSection9"] = "|c00A2D96FMOUSE INSPECT|r\n",
		["Help_OptionsSection10"] = "Allows you to collect items from players simply by passing your mouse over them.  Note: Blizzard has limited the range in which",
		["Help_OptionsSection11"] = " you can do this.  Also please note this feature may or may not cause lag on some computers.\n",
		["Help_OptionsSection12"] = "\n",
		["Help_OptionsSection13"] = "|c00A2D96FHIDE ITEMS|r\n",
		["Help_OptionsSection14"] = "This feature disables the loading of items in the main window each time that ItemSync is shown.  Items will only show during searches.\n",
		["Help_OptionsSection15"] = "\n",
		["Help_OptionsSection16"] = "|c00A2D96FSAME DATABASE|r\n",
		["Help_OptionsSection17"] = "NOTE: Use this feature at your own risk.  This feature will allow you to utilize the same database across all servers.\n",
		["Help_OptionsSection18"] = "\n",
		["Help_OptionsSection19"] = "|c00A2D96FOPTIMIZE DATABASE|r\n",
		["Help_OptionsSection20"] = "This feature will parse through all the items and update them in the database.  This feature helps and improves the search function.\n",
		["Help_OptionsSection21"] = "Only valid items will be parsed.\n",
		["Help_OptionsSection22"] = "\n",
		["Help_OptionsSection23"] = "|c00A2D96FVALIDATE INVALID|r\n",
		["Help_OptionsSection24"] = "NOTE: USE THIS FEATURE AT YOUR OWN RISK!\n",
		["Help_OptionsSection25"] = "\n",
		["Help_OptionsSection26"] = "This feature will attempt to validate invalid items.  You may or may not disconnect during the process.  Please take note that some items",
		["Help_OptionsSection27"] = " will not validate until you logout -> login.  Not all invalid items can be validated.\n",
		["Help_OptionsSection28"] = "\n",
		["Help_OptionsSection29"] = "|c00A2D96FRESET DATABASE|r\n",
		["Help_OptionsSection30"] = "NOTE: THIS FEATURE IS IRREVERSIBLE!\n\n",
		["Help_OptionsSection31"] = "This feature will delete all items within your database.  This will reset you back to zero items.\n",
		["Help_OptionsSection32"] = "\n\n",
		["Help_FilterSection"] = 13,
		["Help_FilterSection1"] = "|c00A2D96FFILTERING|r\n",
		["Help_FilterSection2"] = "ItemSync has the ability to filter out unwanted items by rarity/quality.\n",
		["Help_FilterSection3"] = "\n",
		["Help_FilterSection4"] = "To filter out a rarity/quality from being recorded to the database, simply mark the corresponding [CHECKBOX] next to the rarity you wish to [FILTER OUT].\n",
		["Help_FilterSection5"] = "\n",
		["Help_FilterSection6"] = "NOTE: Please remember that by placing a checkmark on a checkbox next to a rarity/quality, you are informing ItemSync to filter [OUT] any items of that rarity/quality!\n",
		["Help_FilterSection7"] = "\n",
		["Help_FilterSection8"] = "By default ItemSync is set to record all items regardless of quality/rarity.\n",
		["Help_FilterSection9"] = "\n",
		["Help_FilterSection10"] = "|c00A2D96FPURGING|r\n",
		["Help_FilterSection11"] = "NOTE: THIS IS IRREVERSIBLE!!!\n\n",
		["Help_FilterSection12"] = "To purge items by either rarity/quality or invalid items, please use the corresponding options provided for you.\n",
		["Help_FilterSection13"] = "\n\n",
		["Help_FavoritesSection"] = 16,
		["Help_FavoritesSection1"] = "|c00A2D96FFAVORITES|r\n",
		["Help_FavoritesSection2"] = "This feature displays all your favorite items you come across.  Please note when adding favorites make sure to select the user you wish to add to.\n",
		["Help_FavoritesSection3"] = "\n",
		["Help_FavoritesSection4"] = "|c00A2D96FADDING FAVORITES|r\n",
		["Help_FavoritesSection5"] = "(Control)+(Shift)+(Left-Click) items within the main ItemSync window to add them to your favorites.\n\n",
		["Help_FavoritesSection6"] = "Please note that items will be added to the [CURRENTLY] selected user within the Favorites window.\n",
		["Help_FavoritesSection7"] = "\n",
		["Help_FavoritesSection8"] = "|c00A2D96FREMOVING FAVORITES|r\n",
		["Help_FavoritesSection9"] = "NOTE: THIS IS IRREVERSIBLE\n\n",
		["Help_FavoritesSection10"] = "Click on the red button (box) next to the favorite item to remove it from the list.\n",
		["Help_FavoritesSection11"] = "\n",
		["Help_FavoritesSection12"] = "|c00A2D96F(LEFT-CLICK)|r\n",
		["Help_FavoritesSection13"] = "(Left-Click) = Link item in chat.\n",
		["Help_FavoritesSection14"] = "(Shift)+(Left-Click) = Link item in chat.\n",
		["Help_FavoritesSection15"] = "(Control)+(Left-Click) = Use item in Dressing Room.\n",
		["Help_FavoritesSection16"] = "\n\n",
		--////////////////////////////////
		
		--////////////////////////////////
		--ItemCount Frame
		["ItemCount_FrameHeader"] = "ItemSync ItemCount Frame",
		["ItemCount_LeftClick"] = "Control+Left-Click = Toggle ItemSync Window",
		--////////////////////////////////
		
		--////////////////////////////////
		--Binding
		["Toggle Main Frame"] = "Toggle Main Frame",
		["Toggle Favorites Frame"] = "Toggle Favorites Frame",
		["Toggle ItemID Frame"] = "Toggle ItemID Frame",
		["Toggle QuickBag Frame"] = "Toggle QuickBag Frame",
		--////////////////////////////////
		
		--////////////////////////////////
		--Options Menu
		["Debug"] = "Debug",
		["Turns display of debugging text on and off."] = "Turns display of debugging text on and off.",
		["Show"] = "Show",
		["Open the ItemSync window."] = "Open the ItemSync window.",
		["Itemid"] = "Itemid",
		["Open the ItemID window."] = "Open the ItemID window.",
		["Quickbag"] = "Quickbag",
		["Open the QuickBag window."] = "Open the QuickBag window.",
		["Favorites"] = "Favorites",
		["Open the Favorites window."] = "Open the Favorites window.",
		["Search"] = "Search",
		["Do a search for an item by keywords."] = "Do a search for an item by keywords.",
		["<partial item name>"] = "<partial item name>",
		["Reset Window"] = "Reset Window",
		["Resets all ItemSync windows."] = "Resets all ItemSync windows.",
		--////////////////////////////////
		
	}--end return
	
end
)--end function


if ( GetLocale() == "zhCN" ) then
	
	--array type
	ISA = {
		
		--////////////////////////////////
		--Weapon Location
		["SORTING"] = {
			["Name"]=1,
			["Rarity"]=2,
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Types of Bags
		--This corresponds to the subItemTypes in getiteminfo()
		--we want to ignore any events in which the bag is ammo / to prevent lag (this list will be ignored)
		--because we have no ammo bags anymore in wow 4.x.x the list is disabled completly
		["BAGS"] = { 
			--old ["Soul Bag"]=1,
			--old ["Ammo Pouch"]=1,
			--old ["Quiver"]=1,
			--["Enchanting Bag"]=1,
			--["Engineering Bag"]=1,
			--["Herb Bag"]=1,
			--["Gem Bag"]=1,
			--["Mining Bag"]=1,
			--["Leatherworking Bag"]=1,
			--["Inscription Bag"]=1,
			--["Tackle Box"]=1,
			--["Bag"]=1,
		},
		--////////////////////////////////

		--////////////////////////////////
		--Weapon Location
		["WL"] = { 
			["Held In Off-hand"]=1,
			["Back"]=2,
			["One-Hand"]=3,
			["Two-Hand"]=4,
			["Off Hand"]=5,
			["Wrist"]=6,
			["Chest"]=7,
			["Legs"]=8,
			["Feet"]=9,
			["Shirt"]=10,
			["Ranged"]=11,
			["Main Hand"]=12,
			["Waist"]=13,
			["Head"]=14,
			["Finger"]=15,
			["Hands"]=16,
			["Shoulder"]=17,
			["Trinket"]=18,
			["Tabard"]=19,
			["Neck"]=20,
			["Thrown"]=21, -- check this
			--["Gun"]=22,     see weapon types
			--["Wand"]=23,    see weapon types
			--["Crossbow"]=24 see weapon types
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Weapon Types
		["WT"] = { 
			["Axe"]=1,
			["Bow"]=2,
			["Dagger"]=3,
			["Mace"]=4,
			["Staff"]=5,
			["Sword"]=6,
			["Gun"]=7,
			["Wand"]=8,
			["Thrown"]=9,
			["Polearm"]=10,
			["Fist Weapon"]=11,
			["Crossbow"]=12,
			["Fishing Pole"]=13
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Tradeskills
		["TS"] = { 
			["Alchemy"]=1,
			["Blacksmithing"]=2,
			["Cooking"]=3,
			["Enchanting"]=4,
			["Engineering"]=5,
			["Leatherworking"]=6,
			["Tailoring"]=7,
			["Jewelcrafting"]=8,
			["First Aid"]=9,
			["Fishing"]=10,
			["Inscription"]=11,
			["Herbalism"]=12,
			["Skinning"]=13,
			["Mining"]=14,
			["Archaeology"]=15
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Types
		["AT"] = { 
			["Cloth"]=1,
			["Leather"]=2,
			["Mail"]=3,
			["Plate"]=4,
			["Shield"]=5,
			["Relic"]=6
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Shield Type
		["ST"] = { 
			--["Buckler"]=1,
			["Shield"]=0	--we want to reset old values from old databases
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Resistances
		["AR"] = { 
			["Arcane Resistance"]=1,
			["Fire Resistance"]=2,
			["Nature Resistance"]=3,
			["Frost Resistance"]=4,
			["Shadow Resistance"]=5
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Rarity
		["RARITY"] = { 
			["Poor"]=0,
			["Common"]=1,
			["Uncommon"]=2,
			["Rare"]=3,
			["Epic"]=4,
			["Legendary"]=5,
			["Artifact"]=6,
			["Heirloom"]=7,
			[0]="Poor",
			[1]="Common",
			[2]="Uncommon",
			[3]="Rare",
			[4]="Epic",
			[5]="Legendary",
			[6]="Artifact",
			[7]="Heirloom"
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Level
		["LEVEL"] = {
			[0]="1-5",
			[1]="5-10",
			[2]="10-15",
			[3]="15-20",
			[4]="20-25",
			[5]="25-30",
			[6]="30-35",
			[7]="35-40",
			[8]="40-45",
			[9]="45-50",
			[10]="50-55",
			[11]="55-60",
			[12]="60-65",
			[13]="65-70",
			[14]="70-75",
			[15]="75-80",
			[16]="80-85",
			["1-5"]=0,
			["5-10"]=1,
			["10-15"]=2,
			["15-20"]=3,
			["20-25"]=4,
			["25-30"]=5,
			["30-35"]=6,
			["35-40"]=7,
			["40-45"]=8,
			["45-50"]=9,
			["50-55"]=10,
			["55-60"]=11,
			["60-65"]=12,
			["65-70"]=13,
			["70-75"]=14,
			["75-80"]=15,
			["80-85"]=16
		},
		--////////////////////////////////
		
		};
	
end
