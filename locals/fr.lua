--[[--------------------------------------------------------------------------------
  ItemSync French Localization

  Author:  Derkyle
  Website: http://www.manaflux.com
  
  French Translation By The Following:
 	 lefou - (ui.worldofwar.net)
 	 
-----------------------------------------------------------------------------------]]

	-- é: C3 A9  - \195\169
	-- ê: C3 AA  - \195\170
	-- à: C3 A0  - \195\160
	-- î: C3 AE  - \195\174
	-- è: C3 A8  - \195\168
	-- ë: C3 AB  - \195\171
	-- ô: C3 B4  - \195\180
	-- û: C3 BB  - \195\187
	-- â: C3 A2  - \195\162
	-- ç: C3 A7  - \185\167
	--
	-- ': E2 80 99  - \226\128\153

	ISL = AceLibrary("AceLocale-2.2"):new("ItemSync")
	ISL:RegisterTranslations("frFR", function()
	
	    return {
	    	["No"] = "Non",
	    	["Yes"] = "Oui",
		["Sell"] = "Vendu pour ",
		["Vendor"] = "Vendeur pour ",
		["NoSellP"] = "Pas de Prix de Vente",
		["ReqSearch1"] = "Requis (.+)",
		["ReqSearch2"] = "Niveau (%d+)",
		["ReqSearch3"] = "(.+) %((%d+)%)",
		["Help"] = "[Aide]",
		["OfThe"] = "du/de la ???",
		--OfTheCheck refers to the sub items like  Swash Buckler of the Whale
		["OfTheCheck1"] = "du", --added two because some languages have masculine and feminine names
		["OfTheCheck2"] = "de la", --so one can be example: german  OfTheCheck1 = der OfTheCheck2 = des
		["TotalItems"] = "Total des objets:",
		["TotalShown"] = "Total vu:",
		["TotalInvalid"] = "Total Invalid:",
		["Item"] = "Objet:",
		["ItemDeleted"] = "[Objet Supprim\195\169]",
		["Reset"]="RaZ",
		["Refresh"] = "Rafraichir",
		["Search"] = "Recherche",
		["Options"] = "Options",
		["Filters"] = "Filtres",
		["Favorites"] = "Favoris",
		["ItemID"] = "ItemID",
		["QuickBag"] = "QuickBag",
		["Unknown"] = "Inconnu",
		["Purge"] = "Purger",
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
		["ToggleItemSyncFubar"] = "Click to toggle ItemSync.",
		--////////////////////////////////
		
		--////////////////////////////////
		--Special Cases
		["Crossbow"] = "Arbal\195\168te",
		["Thrown"] = "Armes de jet",
		["Gun"] = "Armes \195\160 feu",
		["Wand"] = "Baguette",
		"|c00FF0000WARNING: Le cr\195\169ateur d'ItemSync n'est pas\n responsable des d\195\169sconnections qui\n peuvent survenir!|r\n|c00A2D96FUTILISEZ A VOS RISQUES!|r";
		--////////////////////////////////

		--////////////////////////////////
		--Invalid Item
		["InvalidItem"] = "Objets Invalide",
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
		["SearchName"]="Recherche par nom:",
		["Location"] = "Emplacement:",
		["Rarity"] = "Raret\195\169:",
		["Weapon"] = "Arme:",
		["Level"] = "Niveau:",
		["TradeSkill"] = "Tradeskill:",
		["Armor"] = "Armure:",
		["Shield"] = "Bouclier:",
		["Resistance"] = "R\195\169sistance:",
		["ArcaneResistance"]="R\195\169sistance aux Arcanes",
		["FireResistance"]="R\195\169sistance au Feu",
		["NatureResistance"]="R\195\169sistance \195\160 la Nature",
		["FrostResistance"]="R\195\169sistance au Givre",
		["ShadowResistance"]="R\195\169sistance \195\160 l'Ombre",
		--////////////////////////////////
		
		--////////////////////////////////
		--Options
		["MoneyOpt_Header"] = "Option d'affichage dans les bulles",
		["MoneyOpt_1"] = "Affiche le prix de vente dans les bulles.",
		["MoneyOpt_2"] = "Affiche le prix du vendeur dans les bulles.",
		["MoneyOpt_3"] = "Affiche l'icone des objets dans les bulles.",
		["ExternalOpt_Header"] = "Options Externes",
		["ExternalOpt_1"] = "Affiche le d\195\169nombrement des objets.",
		["ExternalOpt_2"] = "Affiche le bouton sur la minimap.",
		["ExternalOpt_3"] = "Enable the use of Fetch Links.",
		["ExternalOpt_4"] = "Activé l'inspection MouseOver. |c00A2D96F(Peux causser du lag)|r",
		["ExternalOpt_5"] = "Hide all items when opening ItemSync.",
		["DatabaseOpt_Header"] = "Options de la base de donn\195\169",
		["DatabaseOpt_1"] = "Utiliser la même base de donn\195\169 pour tous les serveurs.",
		["AdditionalOpt_Header"] = "Options additionelle",
		["AdditionalOpt_1"] = "Reset all windows.",
		["AdditionalOpt_2"] = "Optimiser la base de donn\195\169.",
		["AdditionalOpt_3"] = "Valider les objets invalide.",
		["AdditionalOpt_4"] = "Reset item database.",
		--////////////////////////////////
		
		--////////////////////////////////
		--Filters
		["RarityOpt_Header"] = "Filtre par Rarit\195\169",
		["RarityOpt_0"] = "|cff9d9d9dPauvre|r",
		["RarityOpt_1"] = "|cffffffffCourant|r",
		["RarityOpt_2"] = "|cff1eff00Inabituel|r",
		["RarityOpt_3"] = "|cff0070ddRare|r",
		["RarityOpt_4"] = "|cffa335eeEpique|r",
		["RarityOpt_5"] = "|cffff8000L\195\169gendaire|r",
		["Filters_PurgeInvalid"] = "Purger tous les objets invalide",
		["Filters_PurgeRarity"] = "Purger tous les objets par raret\195\169",
		["PurgeInvalid_DialogHeader"] = "Purger les Invalide",
		["PurgeInvalid_DialogWarn"] = "Etes-vous sur de vouloir tous PURGER:\n",
		["PurgeInvalid_DialogWarn2"] = "[Objets invalide]",
		["PurgeInvalid_DialogComplete"] = "Processus de Purge termin\195\169: [OBJETS INVALIDE]",
		["PurgeRarity_DialogHeader"] = "Purge Raret\195\169",
		["PurgeRarity_DialogWarn"] = "Etes-vous sur de vouloir tous PURGER:\n",
		["PurgeRarity_DialogComplete"] = "Processus de Purge termin\195\169:",
		
		--////////////////////////////////

		--////////////////////////////////
		--Favorites
		["Fav_CurrentUsr"] = "Current Selection:",
		["Fav_DialogHeader"] = "Ajouter aux Favoris",
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
		["ItemID_Item"] = "Objet:",
		["ItemID_Format"] = "Exemple: 12345:0:0:0:0:0:0:0 or 12345",
		["ItemID_Warn"] = "WARNING: The creator of ItemSync is not\n responsible for any disconnections that\n may occur!\n",
		["ItemID_Warn2"] = "USE AT YOUR OWN RISK!",
		["ItemID_Invalid"] = "ItemID Invalide!",
		["ItemID_Valid"] = "Attendez 3 seconds pour la validation de l'objet [",
		["ItemID_ValidYes"] = "Validation r\195\169ussi!",
		["ItemID_ValidNo"] = "Validation \195\169chou\195\169!",
		["ItemID_ValidWait"] = "Please wait ItemID validation already in progress!",
		--////////////////////////////////
		
		--////////////////////////////////
		--Delete Item
		["DeleteItem_Header"] = "Supprimer l'Objets",
		["DeleteItem_Warn"] = "Etes-vous sur de vouloir supprimer\nl'objet suivant de la BDD?",
		["DeleteItem_DeleteComplete"] = "Suppresion de l'objet r\195\169ussi.",
		--////////////////////////////////

		--////////////////////////////////
		--QuickBag
		["QuickBag_ShowStack"] = "Show Stacked Total",
		["QuickBag_HideEmpty"] = "Hide Empty Prices",
		["QuickBag_SortPrice"] = "Trier par Prix",
		["QuickBag_SortRarity"] = "Trier par Raret\195\169",
		--////////////////////////////////

		--////////////////////////////////
		--MiniMap
		["MiniMap_LeftClick"] = "Left-Click = Toggle ItemSync",
		["MiniMap_RightClick"] = "Right-Click = Rotate Minimap Button",
		["MiniMap_Float1"] = "Control+Shift+Right-Click = Floating Minimap Button",
		["MiniMap_Float2"] = "Alt+Shift+Right-Click = Floating Minimap Button",
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
		
		
		
	    }--end return
	    
	end
	)--end function


if ( GetLocale() == "frFR" ) then

	--array type
	ISA = {
	
		--////////////////////////////////
		--Weapon Location
		["SORTING"] = {
			["Nom"]=1,
			["Raret\195\169"]=2,
		},
		--////////////////////////////////
	
		--////////////////////////////////
		--Types of Bags
		--This corresponds to the subItemTypes in getiteminfo()
		["BAGS"] = { 
			["Sac d'enchanteur"]=1,
			["Boite \195\170 Outils"]=1,
			["Sac d'herbes"]=1,
			["Sac d'\195\162me"]=1,
			["Giberne"]=1,
			["Carquois"]=1,
			["Gem Bag"]=1,
			
		},
		--////////////////////////////////

		--////////////////////////////////
		--Weapon Location
		["WL"] = { 
			["Tenu(e) en main gauche"]=1,
			["Dos"]=2,
			["A une main"]=3,
			["Deux mains"]=4,
			["Main gauche"]=5,
			["Poignets"]=6,
			["Torse"]=7,
			["Jambes"]=8,
			["Pieds"]=9,
			["Chemise"]=10,
			["A distance"]=11,
			["Main droite"]=12,
			["Taille"]=13,
			["T\195\170te"]=14,
			["Armes \195\160 feu"]=15,
			["Doigt"]=16,
			["Mains"]=17,
			["Epaule"]=18,
			["Baguette"]=19,
			["Bijou"]=20,
			["Tabard"]=21,
			["Cou"]=22,
			["Armes de jet"]=23,
			["Arbal\195\168te"]=24
		},
		--////////////////////////////////

		--////////////////////////////////
		--Weapon Types
		["WT"] = { 
			["Hache"]=1,
			["Arc"]=2,
			["Dague"]=3,
			["Masse"]=4,
			["Baton"]=5,
			["Ep\195\169"]=6,
			["Armes \195\160 feu"]=7,
			["Baguette"]=8,
			["Armes de jet"]=9,
			["Armes d'hast"]=10,
			["Arme de pugilat"]=11,
			["Arbal\195\168te"]=12
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Tradeskills
		["TS"] = { 
			["Alchimie"]=1,
			["Forge"]=2,
			["Cuisine"]=3,
			["Enchantement"]=4,
			["Ing\195\169nierie"]=5,
			["Travail du cuir"]=6,
			["Couture"]=7,
			["Joaillerie"]=8
		},
		--////////////////////////////////

		--////////////////////////////////
		--Armor Types
		["AT"] = { 
			["Tissu"]=1,
			["Cuir"]=2,
			["Mailles"]=3,
			["Plaques"]=4
		},
		--////////////////////////////////

		--////////////////////////////////
		--Shield Type
		["ST"] = { 
			["Targe"]=1,
			["Bouclier"]=2
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Resistances
		["AR"] = { 
			["R\195\169sistance aux Arcanes"]=1,
			["R\195\169sistance au Feu"]=2,
			["R\195\169sistance \195\160 la Nature"]=3,
			["R\195\169sistance au Givre"]=4,
			["R\195\169sistance \195\160 l'Ombre"]=5
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Rarity
		["RARITY"] = { 
			["Pauvre"]=0,
			["Courant"]=1,
			["Inhabituel"]=2,
			["Rare"]=3,
			["Epique"]=4,
			["L\195\169gendaire"]=5,
			[0]="Pauvre",
			[1]="Courant",
			[2]="Inhabituel",
			[3]="Rare",
			[4]="Epique",
			[5]="L\195\169gendaire"
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
