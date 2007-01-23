--[[--------------------------------------------------------------------------------
  ItemSync German Localization

  Author:  Derkyle
  Website: http://www.manaflux.com
  
  German Translation By The Following:
  	 Rene Hunkel - (ui.worldofwar.net)
 	 Maischter82 - (ui.worldofwar.net)
 	 Nelson Br0adsw0rd - (ui.worldofwar.net)
 	 Marco De Luca - (ui.worldofwar.net)
 	 
 	 
	Special Keys in German:
	-- Ä =  \195\132
	-- Ö =  \195\150
	-- Ü =  \195\156
	-- ä =  \195\164
	-- ö =  \195\182
	-- ü =  \195\188
	-- ß =  \195\159
-----------------------------------------------------------------------------------]]


ISL = AceLibrary("AceLocale-2.2"):new("ItemSync")
	ISL:RegisterTranslations("deDE", function()
	
	    return {
	    	["No"] = "Nein",
	    	["Yes"] = "Ja",
		["Sell"] = "Verkaufe f\195\188r ",
		["Vendor"] = "Beim H\195\164ndler f\195\188 ",
		["NoSellP"] = "Kein Verkaufspreis",
		["ReqSearch1"] = "Ben\195\182tigt (.+)",
		["ReqSearch2"] = "Stufe (%d+)",
		["ReqSearch3"] = "(.+) %((%d+)%)",
		["Help"] = "[Hilfe]",
		["OfThe"] = "des/der ???",
		--OfTheCheck refers to the sub items like  Swash Buckler of the Whale
		["OfTheCheck1"] = "des", --added two because some languages have masculine and feminine names
		["OfTheCheck2"] = "der", --so one can be example: german  OfTheCheck1 = der OfTheCheck2 = des
		["TotalItems"] = "Item Anzahl:",
		["TotalShown"] = "Gezeigte Menge:",
		["TotalInvalid"] = "Total Invalid:",
		["Item"] = "Item:",
		["ItemDeleted"] = "[Item gel\195\182scht]",
		["Reset"]="Zur\195\188cksetzen",
		["Refresh"] = "Aktualisieren",
		["Search"] = "Suche",
		["Options"] = "Optionen",
		["Filters"] = "Filter",
		["Favorites"] = "Favoriten",
		["ItemID"] = "ItemID",
		["QuickBag"] = "QuickBag",
		["Unknown"] = "Unbekannt",
		["Purge"] = "Bereinigen",
		["OperationComplete"] = "Operation komplett!",
		["Purge_all_db"] = "Wollen Sie wirklich ihre komplette\nDatenbank UNWIDERRUFLICH l\195\182schen?",
		["ShowNone"] = "None",
		
		--////////////////////////////////
		--Key Bindings
		["ToggleMain"] = "Hauptfenster Umschalten",
		["ToggleFav"] = "Favoritenfenster Umschalten",
		["ToggleQuick"] = "QuickBagfenster Umschalten",
		["ToggleItemID"] = "Toggle ItemID Window",
		["ToggleItemSyncFubar"] = "Click to toggle ItemSync.",
		--////////////////////////////////
		
		--////////////////////////////////
		--Special Cases
		["Crossbow"] = "Armbrust",
		["Thrown"] = "Wurfwaffe",
		["Gun"] = "Schusswaffe",
		["Wand"] = "Zauberstab",
		"|c00FF0000ACHTUNG: Der Autor von ItemSync ist nicht f\195\188r\neventuelle Verbindungsabbr\195\188che verantwortlich!|r\n|c00A2D96FBENUTZUNG AUF EIGENE GEFAHR!|r";
		--////////////////////////////////

		--////////////////////////////////
		--Invalid Item
		["InvalidItem"] = "Gegenstand ist ung\195\188ltig",
		["InvalidForce"] = "Dieses Item konnte im Itemcache\nnicht gefunden werden, um dies Item dennoch\nzu validieren, dr\195\188cken Sie bitte:\n(Strg + Rechtsklick)",
		["InvalidWarning"] = "ACHTUNG: Der Autor von ItemSync\n ist nicht f\195\188r eventuelle\n Verbindungsabbr\195\188che verantwortlich.",
		["ForceInvalid"] = "Erzwingung ung\195\188ltig",
		["ItemForce"] = "Sind Sie sicher, dass jenes Item\nerzwungen werden soll?",
		["ItemForceWait"] = "Ung\195\188ltige Itemvalidierung in 3 Sek. Hinweis: M\195\182glicher Verbindungsabbruch",
		["ItemForceFail"] = "Konnte Itenm leider nicht validieren.",
		["ItemForceSuccess"] = "Jenes Item wurde erfolgreich validiert: ",
		["InvalidForce_Wait"] = "Bitte warten, ung\195\188ltige Item-Validierung bereits gestartet!",
		--////////////////////////////////

		--////////////////////////////////
		--Search Feature
		["SearchName"]="Namenssuche:",
		["Location"] = "Position:",
		["Rarity"] = "Seltenheit:",
		["Weapon"] = "Waffen:",
		["Level"] = "Level:",
		["TradeSkill"] = "Beruf:",
		["Armor"] = "R\195\188stung:",
		["Shield"] = "Schild:",
		["Resistance"] = "Widerstand:",
		["ArcaneResistance"]="Arkanwiderstand",
		["FireResistance"]="Feuerwiderstand",
		["NatureResistance"]="Naturwiderstande",
		["FrostResistance"]="Frostwiderstand",
		["ShadowResistance"]="Schattenwiderstand",
		--////////////////////////////////
		
		--////////////////////////////////
		--Options
		["MoneyOpt_Header"] = "Tooltip-Anzeigeoptionen",
		["MoneyOpt_1"] = "Zeige Itemverkaufspreis.",
		["MoneyOpt_2"] = "Zeige Itemh\195\164ndlerpreis.",
		["MoneyOpt_3"] = "Zeige Itemtextur im Tooltip.",
		["ExternalOpt_Header"] = "Externe Optionen",
		["ExternalOpt_1"] = "Zeige das Item Count Fenster.",
		["ExternalOpt_2"] = "Zeige den Minimap-Button.",
		["ExternalOpt_3"] = "Chat-Links und autom. Vervollst\195\164ndiung.",
		["ExternalOpt_4"] = "Erm\195\182gliche Mouseover-Betrachtung. |c00A2D96F(Verursacht vielleicht Lag)|r",
		["ExternalOpt_5"] = "Verberge jedes Item beim \195\182ffnen von ItemSync.",
		["DatabaseOpt_Header"] = "Datenbank Optionen",
		["DatabaseOpt_1"] = "Nutze eine Datenbank f\195\188r alle Server.",
		["AdditionalOpt_Header"] = "Zus\195\164tzliche Optionen",
		["AdditionalOpt_1"] = "Alle Fenster zur\195\188cksetzen.",
		["AdditionalOpt_2"] = "Datenbank optimieren.",
		["AdditionalOpt_3"] = "Validiere ung\195\188ltige Items.",
		["AdditionalOpt_4"] = "Item-Datenbank zur\195\188cksetzen.",
		--////////////////////////////////
		
		--////////////////////////////////
		--Filters
		["RarityOpt_Header"] = "Seltenheit Filtern",
		["RarityOpt_0"] = "|cff9d9d9dSchlecht|r",
		["RarityOpt_1"] = "|cffffffffVerbreitet|r",
		["RarityOpt_2"] = "|cff1eff00Selten|r",
		["RarityOpt_3"] = "|cff0070ddRar|r",
		["RarityOpt_4"] = "|cffa335eeEpisch|r",
		["RarityOpt_5"] = "|cffff8000Legend\195\164r|r",
		["Filters_PurgeInvalid"] = "Bereinige alle ung\195\188ltigen Items",
		["Filters_PurgeRarity"] = "Bereinige alle ung\195\188ltigen Items nach Seltenheit",
		["PurgeInvalid_DialogHeader"] = "Bereinige ung\195\188ltige",
		["PurgeInvalid_DialogWarn"] = "Sind Sie sicher, dies zu bereinigen:\n",
		["PurgeInvalid_DialogWarn2"] = "[Ung\195\188ltige Items]",
		["PurgeInvalid_DialogComplete"] = "Bereinigungsprozess komplett: [INVALID ITEMS]",
		["PurgeRarity_DialogHeader"] = "Bereinige Seltenheit",
		["PurgeRarity_DialogWarn"] = "Sind Sie sicher, dies zu bereinigen:\n",
		["PurgeRarity_DialogComplete"] = "Bereinigungsprozess komplett:",
		
		--////////////////////////////////

		--////////////////////////////////
		--Favorites
		["Fav_CurrentUsr"] = "Derzeitige Auswahl:",
		["Fav_DialogHeader"] = "Favorit hinzuf\195\188gen",
		["Fav_DialogWarn"] = "Dieses Item, zu den derzeit ausgew\195\164hlten, Benutzer-Favoriten hinzuf\195\188gen?",
		["Fav_DialogComplete"] = "Favorit hinzugef\195\188gt zu Benutzer:",
		["Fav_Duplicate"] = "Item bereits in Favoriten eingetragen.",
		["Fav_Delete"] = "Klicken um Item aus Favoriten zu entfernen.",
		["Fav_PurgeWarning"] = "Sind Sie sicher, dass Sie die Faforiten\ndes folgenden Benutzers bereinigen wollen?",
		["Fav_PurgeDialogComplete"] = "Favoritenbereinigungsprozess komplett:",
		["Fav_DeleteHeader"] = "Favoriten l\195\182schen",
		["Fav_DeleteWarning"] = "Folgendes Item von Benutzer entfernen?",
		["Fav_DeleteComplete"] = "Item wurde erfolgreich aus Favoriten gel\195\182scht.",
		--////////////////////////////////

		--////////////////////////////////
		--ItemID
		["ItemID_Item"] = "Item:",
		["ItemID_Format"] = "Bsp: 12345:0:0:0:0:0:0:0 oder 12345",
		["ItemID_Warn"] = "ACHTUNG: Der Autor von ItemSync\n ist nicht f\195\188r eventuelle\n Verbindungsabbr\195\188che verantwortlich.",
		["ItemID_Warn2"] = "BENUTZUNG AUF EIGENE GEFAHR!",
		["ItemID_Invalid"] = "Ung\195\188ltige ItemID!",
		["ItemID_Valid"] = "Bitte warten Sie 3 Sek. f\195\188r Item-Validierung [",
		["ItemID_ValidYes"] = "Item-Validierung erfolgreich!",
		["ItemID_ValidNo"] = "Item-Validierung fehlgeschlagen!",
		["ItemID_ValidWait"] = "Bitte warten, ItemID-Validierung bereits gestartet!",
		--////////////////////////////////
		
		--////////////////////////////////
		--Delete Item
		["DeleteItem_Header"] = "L\195\182sche Item",
		["DeleteItem_Warn"] = "Sind Sie sicher, dass Sie dieses Item\naus der Datenbank l\195\182schen wollen?",
		["DeleteItem_DeleteComplete"] = "Item erfolgreich gel\195\182scht.",
		--////////////////////////////////

		--////////////////////////////////
		--QuickBag
		["QuickBag_ShowStack"] = "Stapelmenge zeigen",
		["QuickBag_HideEmpty"] = "Leere Preise verbergen",
		["QuickBag_SortPrice"] = "Nach Preis sortieren",
		["QuickBag_SortRarity"] = "Nach Seltenheit sortieren",
		--////////////////////////////////

		--////////////////////////////////
		--MiniMap
		["MiniMap_LeftClick"] = "Linksklick = ItemSync \195\182ffnen/schlie\195\159en",
		["MiniMap_RightClick"] = "Rechtsklick = Minimap-Button verschieben",
		["MiniMap_Float1"] = "Control+Shift+Right-Click = Floating Minimap Button",
		["MiniMap_Float2"] = "Alt+Shift+Right-Click = Floating Minimap Button",
		--////////////////////////////////
		
		--////////////////////////////////
		--One database
		["OneDB_Header"] = "Datenbanken vereinigen",
		["OneDB_SplitHeader"] = "Datenbank teilen",
		["OneDB_SureFirst"] = "Sind Sie sich sicher, dass Sie ihre\n Datenbanken vereinigen wollen?",
		["OneDB_SureSecond"] = "Sind Sie sich sicher, dass Sie ihre\n Datenbanken teilen wollen in:",
		["OneDB_Complete"] = "Datatenbank Operation komplett!",
		--////////////////////////////////
	

		--////////////////////////////////
		--Optimize
		["Optimize_Header"] = "Optimieren",
		["Optimize_InvalidHeader"] = "Validieren",
		["Optimize_Running"] = "Optimierung",
		["Optimize_InvalidRunning"] = "Validierung",
		["Optimize_Complete"] = "Optimierung ist komplett",
		["Optimize_InvalidComplete"] = "Validierung ist komplett",
		["Optimize_Check"] = "Wollen Sie wirklich\nihre Datenbank optimieren?",
		["Optimize_InvalidCheck"] = "Wollen Sie wirklich\nung\195\188ltige Items validieren?",
		["Optimize_No"] = "Optimierung bereitz gestartet!",
		["Optimize_InvalidRelog"] = "Notiz: Nicht alle Items werden Validiert\nbevor Sie nicht neu einloggen.",
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

	    }--end return
	    
	end
	)--end function


if ( GetLocale() == "deDE" ) then

	--array type
	ISA = {
	
		--////////////////////////////////
		--Weapon Location
		["SORTING"] = {
			["Name"]=1,
			["Seltenheit"]=2,
		},
		--////////////////////////////////
	
		--////////////////////////////////
		--Types of Bags
		--This corresponds to the subItemTypes in getiteminfo()
		["BAGS"] = { 
			["Verzauberertasche"]=1,
			["Ingenieurstasche"]=1,
			["Kr\195\164utertasche"]=1,
			["Seelentasche"]=1,
			["Edelsteintasche"]=1,
			["Munitionsbeutel"]=1,
			["K\195\182cher"]=1,
			
		},
		--////////////////////////////////

		--////////////////////////////////
		--Weapon Location
		["WL"] = { 
			["In Schildhand gef\195\188hrt"]=1,
			["R\195\188cken"]=2,
			["Einh\195\164ndig"]=3,
			["Zweih\195\164ndig"]=4,
			["Schildhand"]=5,
			["Handgelenke"]=6,
			["Brust"]=7,
			["Beine"]=8,
			["F\195\188\195\159e"]=9,
			["Hemd"]=10,
			["Distanz"]=11,
			["Waffenhand"]=12,
			["Taille"]=13,
			["Kopf"]=14,
			--["Schusswaffe"]=15,
			["Finger"]=15,
			["H\195\164nde"]=16,
			["Schulter"]=17,
			--["Zauberstab"]=19,
			["Schmuck"]=18,
			["Wappenrock"]=19,
			["Hals"]=20,
			["Thrown"]=21,
			--["Armbrust"]=24
		},


		--////////////////////////////////

		--////////////////////////////////
		--Weapon Types
		["WT"] = { 
			["Axt"]=1,
			["Bogen"]=2,
			["Dolch"]=3,
			["Streitkolben"]=4,
			["Stab"]=5,
			["Schwert"]=6,
			["Schusswaffe"]=7,
			["Zauberstab"]=8,
			["Wurfwaffe"]=9,
			["Stangenwaffe"]=10,
			["Faustwaffe"]=11,
			["Armbrust"]=12
		},


		--////////////////////////////////
		
		--////////////////////////////////
		--Tradeskills
		["TS"] = { 
			["Alchimie"]=1,
			["Schmiedekunst"]=2,
			["Kochkunst"]=3,
			["Verzauberkunst"]=4,
			["Ingenieurskunst"]=5,
			["Lederverarbeitung"]=6,
			["Schneiderei"]=7,
			["Juwelenschleifen"]=8
		},


		--////////////////////////////////

		--////////////////////////////////
		--Armor Types
		["AT"] = { 
			["Stoff"]=1,
			["Leder"]=2,
			["Schwere R\195\188stung"]=3,
			["Platte"]=4
		},


		--////////////////////////////////

		--////////////////////////////////
		--Shield Type
		["ST"] = { 
			--["Rundschild"]=1,
			["Schild"]=1
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Resistances
		["AR"] = { 
			["Arkanwiderstand"]=1,
			["Feuerwiderstand"]=2,
			["Naturwiderstand"]=3,
			["Frostwiderstand"]=4,
			["Schattenwiderstand"]=5
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Rarity
		["RARITY"] = { 
			["Schlecht"]=0,
			["Verbreitet"]=1,
			["Selten"]=2,
			["Rar"]=3,
			["Episch"]=4,
			["Legend\195\164r"]=5,
			[0]="Schlecht",
			[1]="Verbreitet",
			[2]="Selten",
			[3]="Rar",
			[4]="Episch",
			[5]="Legend\195\164r"
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
			["65-70"]=13
		},
		--////////////////////////////////
		
		
	};
	
end
