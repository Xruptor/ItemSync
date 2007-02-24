-- Id: $Id: ItemSync.toc 26541 2007-01-30 00:14:59Z kergoth $
-- Version: r$Revision: 26541 $

--[[--------------------------------------------------------------------------------
  ItemSync German Localization

  Author:  Derkyle
  Website: http://www.manaflux.com
  
  German Translation By The Following:
  	 Rene Hunkel (Bashman) - (ui.worldofwar.net)
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
		["TotalItems"] = "Items gesamt:",
		["TotalShown"] = "Gezeigte:",
		["TotalInvalid"] = "Ung\195\188ltige gesamt:",
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
		["Purge"] = "L\195\182schen",
		["OperationComplete"] = "Fertig!",
		["Purge_all_db"] = "Wollen Sie wirklich Ihre komplette\nDatenbank UNWIDERRUFLICH l\195\182schen?",
		["ShowNone"] = "Keine",
		["DisplayInvalid"] = "Ung\195\188ltige anzeigen",
		
		--////////////////////////////////
		--Key Bindings
		["ToggleMain"] = "Hauptfenster zeigen",
		["ToggleFav"] = "Favoritenfenster zeigen",
		["ToggleQuick"] = "QuickBag-Fenster zeigen",
		["ToggleItemID"] = "ItemID-Fenster zeigen",
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
		["InvalidItem"] = "Item ist ung\195\188ltig!",
		["InvalidForce"] = "Dieses Item konnte im Itemcache\nnicht gefunden werden, um dieses Item dennoch\nabzufragen, dr\195\188cken Sie bitte:\n(Strg + Rechtsklick)",
		["InvalidWarning"] = "ACHTUNG: Der Autor von ItemSync\n ist nicht f\195\188r eventuelle\n Verbindungsabbr\195\188che verantwortlich!",
		["ForceInvalid"] = "Abfrage erzwingen",
		["ItemForce"] = "Sind Sie sicher, dass dieses Item\nabgefragt werden soll?",
		["ItemForceWait"] = "Abfrage des ung\195\188ltigen Items in 3 Sek. Hinweis: M\195\182glicher Verbindungsabbruch",
		["ItemForceFail"] = "Konnte Item leider nicht validieren.",
		["ItemForceSuccess"] = "Item wurde erfolgreich validiert: ",
		["InvalidForce_Wait"] = "Bitte warten, Item-Abfrage bereits gestartet!",
		--////////////////////////////////

		--////////////////////////////////
		--Search Feature
		["SearchName"]="Namenssuche:",
		["Location"] = "Position:",
		["Rarity"] = "Seltenheit:",
		["Weapon"] = "Waffe:",
		["Level"] = "Level:",
		["TradeSkill"] = "Beruf:",
		["Armor"] = "R\195\188stung:",
		["Shield"] = "Schild:",
		["Resistance"] = "Widerstand:",
		["ArcaneResistance"]="Arkanwiderstand",
		["FireResistance"]="Feuerwiderstand",
		["NatureResistance"]="Naturwiderstand",
		["FrostResistance"]="Frostwiderstand",
		["ShadowResistance"]="Schattenwiderstand",
		--////////////////////////////////
		
		--////////////////////////////////
		--Options
		["MoneyOpt_Header"] = "Tooltip-Anzeigeoptionen",
		["MoneyOpt_1"] = "Zeige Itemverkaufspreis.",
		["MoneyOpt_2"] = "Zeige Itemh\195\164ndlerpreis.",
		["MoneyOpt_3"] = "Zeige Itembild im Tooltip.",
		["ExternalOpt_Header"] = "Externe Optionen",
		["ExternalOpt_1"] = "Zeige Itemz\195\164hlfenster.",
		["ExternalOpt_2"] = "Zeige Minimap-Button.",
		["ExternalOpt_3"] = "Chat-Links und automat. Vervollst\195\164ndigung.",
		["ExternalOpt_4"] = "Erm\195\182gliche Mouseover-Scannen. |c00A2D96F(Evtl. Lags)|r",
		["ExternalOpt_5"] = "Verberge alle Items beim \195\150ffnen von ItemSync.",
		["DatabaseOpt_Header"] = "Datenbank Optionen",
		["DatabaseOpt_1"] = "Nutze EINE Datenbank f\195\188r ALLE Server.",
		["AdditionalOpt_Header"] = "Zus\195\164tzliche Optionen",
		["AdditionalOpt_1"] = "Alle Fenster zur\195\188cksetzen.",
		["AdditionalOpt_2"] = "Datenbank optimieren.",
		["AdditionalOpt_3"] = "Validiere ung\195\188ltige Items.",
		["AdditionalOpt_4"] = "Datenbank l\195\182schen.",
		--////////////////////////////////
		
		--////////////////////////////////
		--Filters
		["RarityOpt_Header"] = "Seltenheit (Qualit\195\164t) weglassen",
		["RarityOpt_0"] = "|cff9d9d9dSchlecht|r",
		["RarityOpt_1"] = "|cffffffffVerbreitet|r",
		["RarityOpt_2"] = "|cff1eff00Selten|r",
		["RarityOpt_3"] = "|cff0070ddRar|r",
		["RarityOpt_4"] = "|cffa335eeEpisch|r",
		["RarityOpt_5"] = "|cffff8000Legend\195\164r|r",
		["Filters_PurgeInvalid"] = "L\195\182sche alle ung\195\188ltigen Items",
		["Filters_PurgeRarity"] = "L\195\182sche Items nach Seltenheit",
		["PurgeInvalid_DialogHeader"] = "L\195\182sche Ung\195\188ltige",
		["PurgeInvalid_DialogWarn"] = "Sind Sie sicher, folgende Items zu l\195\182schen:\n",
		["PurgeInvalid_DialogWarn2"] = "[Ung\195\188ltige Items]",
		["PurgeInvalid_DialogComplete"] = "L\195\182schvorgang fertig: [Ung\195\188ltige Items]",
		["PurgeRarity_DialogHeader"] = "L\195\182sche Seltenheit",
		["PurgeRarity_DialogWarn"] = "Sind Sie sicher, folgende Items zu l\195\182schen:\n",
		["PurgeRarity_DialogComplete"] = "L\195\182schvorgang fertig:",
		
		--////////////////////////////////

		--////////////////////////////////
		--Favorites
		["Fav_CurrentUsr"] = "Derzeitige Auswahl:",
		["Fav_DialogHeader"] = "Favorit hinzuf\195\188gen",
		["Fav_DialogWarn"] = "Dieses Item zu den derzeit ausgew\195\164hlten Charakter-Favoriten hinzuf\195\188gen?",
		["Fav_DialogComplete"] = "Favorit hinzugef\195\188gt zu Charakter:",
		["Fav_Duplicate"] = "Item bereits in Favoriten vorhanden.",
		["Fav_Delete"] = "Anklicken, um Item aus Favoriten zu entfernen.",
		["Fav_PurgeWarning"] = "Sind Sie sicher, dass Sie die Favoriten\ndes folgenden Charakters l\195\182schen wollen?",
		["Fav_PurgeDialogComplete"] = "L\195\182schvorgang fertig:",
		["Fav_DeleteHeader"] = "Favoriten l\195\182schen",
		["Fav_DeleteWarning"] = "Folgendes Item vom Charakter l\195\182schen?",
		["Fav_DeleteComplete"] = "Item wurde erfolgreich aus Favoriten gel\195\182scht.",
		--////////////////////////////////

		--////////////////////////////////
		--ItemID
		["ItemID_Item"] = "Item:",
		["ItemID_Format"] = "Bsp: 12345:0:0:0:0:0:0:0 oder 12345",
		["ItemID_Warn"] = "ACHTUNG: Der Autor von ItemSync\n ist nicht f\195\188r eventuelle\n Verbindungsabbr\195\188che verantwortlich!\n",
		["ItemID_Warn2"] = "BENUTZUNG AUF EIGENE GEFAHR!",
		["ItemID_Invalid"] = "Ung\195\188ltige ItemID!",
		["ItemID_Valid"] = "Bitte warten Sie 3 Sek. f\195\188r Item-Abfrage [",
		["ItemID_ValidYes"] = "Item-Validierung erfolgreich!",
		["ItemID_ValidNo"] = "Item-Validierung fehlgeschlagen!",
		["ItemID_ValidWait"] = "Bitte warten, ItemID-Abfrage bereits gestartet!",
		--////////////////////////////////
		
		--////////////////////////////////
		--Delete Item
		["DeleteItem_Header"] = "L\195\182sche Item",
		["DeleteItem_Warn"] = "Sind Sie sicher, dass Sie dieses Item\naus der Datenbank l\195\182schen wollen?",
		["DeleteItem_DeleteComplete"] = "Item erfolgreich gel\195\182scht.",
		--////////////////////////////////

		--////////////////////////////////
		--QuickBag
		["QuickBag_ShowStack"] = "Stapelmengen zeigen",
		["QuickBag_HideEmpty"] = "Ohne Preis verbergen",
		["QuickBag_SortPrice"] = "Nach Preis",
		["QuickBag_SortRarity"] = "Nach Seltenheit",
		--////////////////////////////////

		--////////////////////////////////
		--MiniMap
		["MiniMap_LeftClick"] = "(Linksklick)",
		["MiniMap_LeftClick1"] = "ItemSync \195\182ffnen",
		["MiniMap_LeftClickDown"] = "(Linksklick halten)",
		["MiniMap_LeftClickDown1"] = "Button verschieben",
		["MiniMap_LeftClickMouseDrag"] = "(Alt+Linksklick halten)",
		["MiniMap_LeftClickMouseDrag1"] = "Button frei verschieben",
		["MiniMap_RightClick"] = "(Rechtsklick)",
		["MiniMap_RightClick1"] = "Men\195\188 anzeigen",
		--////////////////////////////////
		
		--////////////////////////////////
		--One database
		["OneDB_Header"] = "Datenbank vereinigen",
		["OneDB_SplitHeader"] = "Datenbank teilen",
		["OneDB_SureFirst"] = "Sind Sie sicher, dass Sie Ihre\n Datenbanken vereinigen wollen?",
		["OneDB_SureSecond"] = "Sind Sie sicher, dass Sie Ihre\n Datenbank teilen wollen in:",
		["OneDB_Complete"] = "Vorgang fertig!",
		--////////////////////////////////
	

		--////////////////////////////////
		--Optimize
		["Optimize_Header"] = "Optimieren",
		["Optimize_InvalidHeader"] = "Validieren",
		["Optimize_Running"] = "Optimierung...",
		["Optimize_InvalidRunning"] = "Validierung...",
		["Optimize_Complete"] = "Optimierung ist fertig",
		["Optimize_InvalidComplete"] = "Validierung ist fertig",
		["Optimize_Check"] = "Wollen Sie wirklich\nIhre Datenbank optimieren?",
		["Optimize_InvalidCheck"] = "Wollen Sie wirklich\nung\195\188ltige Items validieren?",
		["Optimize_No"] = "Optimierung bereitz gestartet!",
		["Optimize_InvalidRelog"] = "Hinweis: Nicht alle Items werden validiert\nbevor Sie sich nicht neu einloggen.",
		--////////////////////////////////

		--////////////////////////////////
		--Help
		["Help_MainSection"] = 19,
		["Help_MainSection1"] = "|c00A2D96F(LINKSKLICK)|r\n",
		["Help_MainSection2"] = "(Linksklick) = Verlinkt Item im Chat.\n",
		["Help_MainSection3"] = "(Shift)+(Linksklick) = Verlinkt Item im Chat.\n",
		["Help_MainSection4"] = "(Strg)+(Shift)+(Linksklick) = F\195\188gt Item zu Favoriten.\n",
		["Help_MainSection5"] = "(Strg)+(Linksklick) = Item im Vorschaufenster.\n",
		["Help_MainSection6"] = "\n",
		["Help_MainSection7"] = "|c00A2D96F(RECHTSKLICK)|r\n",
		["Help_MainSection8"] = "(Strg)+(Rechtsklick) = Fragt ung\195\188ltige Items ab.\n",
		["Help_MainSection9"] = "(Alt)+(Rechtsklick) = L\195\182scht Item aus Datenbank.\n",
		["Help_MainSection10"] = "\n",
		["Help_MainSection11"] = "ITEMS GESAMT ist die Zahl der Items in der Datenbank.\n",
		["Help_MainSection12"] = "GEZEIGTE ist die Zahl der gerade im Fenster angezeigten Items.\n",
		["Help_MainSection13"] = "Mit AKTUALISIEREN wird die Anzeige der gerade gezeigten Items aufgefrischt.\n",
		["Help_MainSection14"] = "\n",
		["Help_MainSection15"] = "|c00FC5252(ITEM)|r = Ung\195\188ltiges Item.\n",
		["Help_MainSection16"] = "|c00F3EF86(ITEM)|r = Doppeltes Item mit UNTERSCHIEDLICHEN Werten.\n",
		["Help_MainSection17"] = "\n",
		["Help_MainSection18"] = "Items gleichen Namens (aber unterschiedlicher Gruppen) werden als Sub-Items gezeigt.  Vor diesen steht ein Pfeil.\n",
		["Help_MainSection19"] = "\n\n",
		["Help_OptionsSection"] = 32,
		["Help_OptionsSection1"] = "|c00A2D96FCHAT-LINKS|r\n",
		["Help_OptionsSection2"] = "Chat-Links erm\195\182glichen die Verlinkung unvollst\195\164ndiger oder vollst\195\164ndiger Itemnamen. Gro\195\159-/Kleinschreibung ist EGAL.  ",
		["Help_OptionsSection3"] = "Der angegebene Name muss nicht von vorne anfangen; jeder Namensteil reicht f\195\188r eine Verlinkung aus.\n\n",
		["Help_OptionsSection4"] = "Bsp: [*kupf*] verlinkt das Item [Kupfererz]\n",
		["Help_OptionsSection5"] = "Bsp: [*erz*] verlinkt das Item [Kupfererz]\n",
		["Help_OptionsSection6"] = "Bsp: [*schwarms*] verlinkt das Item [Brustplatte des chromatischen Drachenschwarms]\n",
		["Help_OptionsSection7"] = "Bsp: [*chrom*] verlinkt das Item [Brustplatte des chromatischen Drachenschwarms]\n",
		["Help_OptionsSection8"] = "\n\n",
		["Help_OptionsSection9"] = "|c00A2D96FMOUSEOVER-SCANNEN|r\n",
		["Help_OptionsSection10"] = "Sammelt bereits Items w\195\164hrend man auf andere Spieler mit der Maus zeigt.  Hinweis: Blizzard hat die Reichweite daf\195\188r",
		["Help_OptionsSection11"] = " begrenzt.  Auf manchen Rechnern KANN diese Funktion auch Lags (H\195\164nger) verursachen.\n",
		["Help_OptionsSection12"] = "\n",
		["Help_OptionsSection13"] = "|c00A2D96FVERBERGE ITEMS|r\n",
		["Help_OptionsSection14"] = "Verhindert das Laden von Items im Hauptfenster beim \195\150ffnen von ItemSync.  Items werden nur durch Suchen gezeigt.\n",
		["Help_OptionsSection15"] = "\n",
		["Help_OptionsSection16"] = "|c00A2D96FEINE DATENBANK|r\n",
		["Help_OptionsSection17"] = "Hinweis: Benutzung auf eigene Gefahr!  Es wird dabei nur EINE Datenbank f\195\188r ALLE Server genutzt.\n",
		["Help_OptionsSection18"] = "\n",
		["Help_OptionsSection19"] = "|c00A2D96FDATENBANK OPTIMIEREN|r\n",
		["Help_OptionsSection20"] = "Analysiert und aktualisiert jedes Item in der Datenbank.  Dies verbessert die Leistung beim Suchen.\n",
		["Help_OptionsSection21"] = "Nur g\195\188ltige Items werden analysiert.\n",
		["Help_OptionsSection22"] = "\n",
		["Help_OptionsSection23"] = "|c00A2D96FVALIDIERE UNG\195\156LTIGE|r\n",
		["Help_OptionsSection24"] = "HINWEIS: BENUTZUNG AUF EIGENE GEFAHR!\n",
		["Help_OptionsSection25"] = "\n",
		["Help_OptionsSection26"] = "Versucht, ung\195\188ltige Items (durch Abfrage) zu validieren.  Dabei k\195\182nnte die Verbindung abbrechen.  Manche Items werden",
		["Help_OptionsSection27"] = " erst beim n\195\164chsten Login g\195\188ltig.  Nicht alle ung\195\188ltigen Items k\195\182nnen validiert werden.\n",
		["Help_OptionsSection28"] = "\n",
		["Help_OptionsSection29"] = "|c00A2D96FDATENBANK L\195\150SCHEN|r\n",
		["Help_OptionsSection30"] = "ACHTUNG: DIES IST UNWIDERRUFLICH!\n\n",
		["Help_OptionsSection31"] = "L\195\182scht alle Items aus der Datenbank.  Stellt den Itemz\195\164hler zur\195\188ck auf 0.\n",
		["Help_OptionsSection32"] = "\n\n",
		["Help_FilterSection"] = 13,
		["Help_FilterSection1"] = "|c00A2D96FFILTER|r\n",
		["Help_FilterSection2"] = "ItemSync kann unerw\195\188nschte Items nach ihrer Seltenheit (d.h. Qualit\195\164t) weglassen.\n",
		["Help_FilterSection3"] = "\n",
		["Help_FilterSection4"] = "Damit eine Aufnahme in die Datenbank verhindert wird, muss das entsprechende Ankreuzfeld der Seltenheit zum WEGLASSEN markiert werden.\n",
		["Help_FilterSection5"] = "\n",
		["Help_FilterSection6"] = "HINWEIS: Wird ein Kreuzchen bei der jeweiligen Seltenheit/Qualit\195\164t gemacht, wird ItemSync diese Items NICHT aufnehmen!\n",
		["Help_FilterSection7"] = "\n",
		["Help_FilterSection8"] = "Die Voreinstellung von ItemSync ist das Sammeln aller Items ohne Einschr\195\164nkung.\n",
		["Help_FilterSection9"] = "\n",
		["Help_FilterSection10"] = "|c00A2D96FL\195\150SCHEN|r\n",
		["Help_FilterSection11"] = "ACHTUNG: DIES IST UNWIDERRUFLICH!\n\n",
		["Help_FilterSection12"] = "Ein L\195\182schen von Items nach Seltenheit oder ung\195\188ltiger Items wird durch die jeweilige Option durchgef\195\188hrt.\n",
		["Help_FilterSection13"] = "\n\n",
		["Help_FavoritesSection"] = 16,
		["Help_FavoritesSection1"] = "|c00A2D96FFAVORITEN|r\n",
		["Help_FavoritesSection2"] = "Zeigt alle Favoriten an, die man zuvor aufgenommen hat.  Die Favoriten werden zum derzeit ausgew\195\164hlten Charakter hinzugef\195\188gt.\n",
		["Help_FavoritesSection3"] = "\n",
		["Help_FavoritesSection4"] = "|c00A2D96FFAVORITEN HINZUF\195\156GEN|r\n",
		["Help_FavoritesSection5"] = "(Strg)+(Shift)+(Linksklick) auf Items im Hauptfenster von ItemSync, um diese zu den Favoriten hinzuzuf\195\188gen.\n\n",
		["Help_FavoritesSection6"] = "Diese werden in die Liste des Charakters aufgenommen, der DERZEIT im Favoritenfenster ausgew\195\164hlt ist.\n",
		["Help_FavoritesSection7"] = "\n",
		["Help_FavoritesSection8"] = "|c00A2D96FFAVORITEN L\195\150SCHEN|r\n",
		["Help_FavoritesSection9"] = "ACHTUNG: DIES IST UNWIDERRUFLICH!\n\n",
		["Help_FavoritesSection10"] = "Zum L\195\182schen eines Items aus den Favoriten wird der rote Button (Box) daneben angeklickt.\n",
		["Help_FavoritesSection11"] = "\n",
		["Help_FavoritesSection12"] = "|c00A2D96F(LINKSKLICK)|r\n",
		["Help_FavoritesSection13"] = "(Linksklick) = Verlinkt Item im Chat.\n",
		["Help_FavoritesSection14"] = "(Shift)+(Linksklick) = Verlinkt Item im Chat.\n",
		["Help_FavoritesSection15"] = "(Strg)+(Linksklick) = Item im Vorschaufenster.\n",
		["Help_FavoritesSection16"] = "\n\n",
		--////////////////////////////////
		
		--////////////////////////////////
		--ItemCount Frame
		["ItemCount_FrameHeader"] = "ItemSync Itemz\195\164hler",
		["ItemCount_LeftClick"] = "Strg+Linksklick = ItemSync \195\182ffnen",
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
