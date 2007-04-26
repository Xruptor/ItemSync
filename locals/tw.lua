-- Id: $Id$
-- Version: r$Revision$

--[[--------------------------------------------------------------------------------
  ItemSync Traditional Chinese Localization 竹笙姬@暴風祭壇

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

	ISL = AceLibrary("AceLocale-2.2"):new("ItemSync")
	ISL:RegisterTranslations("zhTW", function()
	
	    return {
	    	["No"] = "No",
	    	["Yes"] = "Yes",
		["Sell"] = "出售:",
		["Vendor"] = "購買:",
		["NoSellP"] = "無售價資料",
		["ReqSearch1"] = "要求 (.+)",
		["ReqSearch2"] = "等級 (%d+)",
		["ReqSearch3"] = "(.+) %((%d+)%)",
		["Help"] = "[Help]",
		["OfThe"] = "的 ???",
		--OfTheCheck refers to the sub items like  Swash Buckler of the Whale
		["OfTheCheck1"] = "的", --added two because some languages have masculine and feminine names
		["OfTheCheck2"] = "於", --so one can be example: german  OfTheCheck1 = der OfTheCheck2 = des
		["TotalItems"] = "總物件:",
		["TotalShown"] = "總顯示:",
		["TotalInvalid"] = "無效物件總數:",
		["Item"] = "物件:",
		["ItemDeleted"] = "[刪除物件]",
		["Reset"]="重置",
		["Refresh"] = "重新整理",
		["Search"] = "搜尋",
		["Options"] = "選項",
		["Filters"] = "過濾",
		["Favorites"] = "我的最愛",
		["ItemID"] = "ItemID",
		["QuickBag"] = "快捷背包",
		["Unknown"] = "未知",
		["Purge"] = "Purge",
		["OperationComplete"] = "執行完成!",
		["Purge_all_db"] = "請確定是否要\n清除所有物件資料庫? 此動作無法復原!!!",
		["ShowNone"] = "無",
		["DisplayInvalid"] = "顯示無效物件",

		--////////////////////////////////
		--Key Bindings
		["ToggleMain"] = "切換主視窗",
		["ToggleFav"] = "切換我的最愛",
		["ToggleQuick"] = "切換快捷背包",
		["ToggleItemID"] = "切換ItemID視窗",
		--////////////////////////////////
		
		--////////////////////////////////
		--Special Cases
		["Crossbow"] = "弩",
		["Thrown"] = "投擲武器",
		["Gun"] = "槍械",
		["Wand"] = "魔杖",
		"|c00FF0000警告: ItemSync插件作者對於\n 發生斷線現象不負任何責任|r\n|c00A2D96F風險自負!|r";
		--////////////////////////////////

		--////////////////////////////////
		--Invalid Item
		["InvalidItem"] = "無效物件",
		["InvalidForce"] = "這個物件無法取得資料,\n若要強制從伺服器中取得連結,\n請按下(CTRL + 右鍵)",
		["InvalidWarning"] = "警告: ItemSync插件作者對於\n 發生斷線現象不負任何責任.",
		["ForceInvalid"] = "強迫使用無效物件",
		["ItemForce"] = "請確定是否要強制取得下列物件資訊?",
		["ItemForceWait"] = "請稍候 3 秒. 注意: 可能會與伺服器中斷連線!",
		["ItemForceFail"] = "抱歉, 無法取得相關資訊.",
		["ItemForceSuccess"] = "下列物件已成功轉換為有效物件: ",
		["InvalidForce_Wait"] = "請稍候, 系統正在處理中!",
		--////////////////////////////////

		--////////////////////////////////
		--Search Feature
		["SearchName"]="用名稱搜尋:",
		["Location"] = "位置:",
		["Rarity"] = "稀有度:",
		["Weapon"] = "武器:",
		["Level"] = "等級:",
		["TradeSkill"] = "專業技能:",
		["Armor"] = "護甲:",
		["Shield"] = "盾:",
		["Resistance"] = "抗性:",
		["ArcaneResistance"]="祕法抗性",
		["FireResistance"]="火焰抗性",
		["NatureResistance"]="自然抗性",
		["FrostResistance"]="冰霜抗性",
		["ShadowResistance"]="暗影抗性",
		--////////////////////////////////
		
		--////////////////////////////////
		--Options
		["MoneyOpt_Header"] = "工具提示的顯示選項",
		["MoneyOpt_1"] = "顯示物件賣價.",
		["MoneyOpt_2"] = "顯示物件買價.",
		["MoneyOpt_3"] = "顯示物件敘述於工具提示.",
		["ExternalOpt_Header"] = "外部選項",
		["ExternalOpt_1"] = "顯示物件總計框架.",
		["ExternalOpt_2"] = "顯示小地圖圖示按鈕.",
		["ExternalOpt_3"] = "啟用物件連結(Ftech Link).",
		["ExternalOpt_4"] = "啟用滑鼠經過時追蹤. |c00A2D96F(可能會造成延遲)|r",
		["ExternalOpt_5"] = "開啟ItemSync時隱藏所有物件.",
		["DatabaseOpt_Header"] = "資料庫選項",
		["DatabaseOpt_1"] = "跨伺服器使用相同物件資料庫.",
		["AdditionalOpt_Header"] = "額外選項",
		["AdditionalOpt_1"] = "重置所有視窗位置.",
		["AdditionalOpt_2"] = "優化資料庫.",
		["AdditionalOpt_3"] = "將無效物件成為有效.",
		["AdditionalOpt_4"] = "重置物件資料庫.",
		--////////////////////////////////
		
		--////////////////////////////////
		--Filters
		["RarityOpt_Header"] = "依稀有度過濾",
		["RarityOpt_0"] = "|cff9d9d9d粗糙|r",
		["RarityOpt_1"] = "|cffffffff普通|r",
		["RarityOpt_2"] = "|cff1eff00優秀|r",
		["RarityOpt_3"] = "|cff0070dd精良|r",
		["RarityOpt_4"] = "|cffa335ee史詩|r",
		["RarityOpt_5"] = "|cffff8000傳說|r",
		["Filters_PurgeInvalid"] = "清除所有無效物件",
		["Filters_PurgeRarity"] = "清除所有物件-依稀有度",
		["PurgeInvalid_DialogHeader"] = "清除無效物件",
		["PurgeInvalid_DialogWarn"] = "請確定是否要清除:\n",
		["PurgeInvalid_DialogWarn2"] = "[無效物件]",
		["PurgeInvalid_DialogComplete"] = "清除程序完成: [無效物件]",
		["PurgeRarity_DialogHeader"] = "稀有度清除",
		["PurgeRarity_DialogWarn"] = "請確定是否要清除:\n",
		["PurgeRarity_DialogComplete"] = "清除程序完成:",
		
		--////////////////////////////////

		--////////////////////////////////
		--Favorites
		["Fav_CurrentUsr"] = "當前角色:",
		["Fav_DialogHeader"] = "加入至我的最愛",
		["Fav_DialogWarn"] = "是否要將物件加入當前角色_我的最愛?",
		["Fav_DialogComplete"] = "加入至我的最愛:",
		["Fav_Duplicate"] = "物件已保存在我的最愛.",
		["Fav_Delete"] = "點擊物件可從我的最愛中移除.",
		["Fav_PurgeWarning"] = "請確定是否要\n清除下列角色_我的最愛?",
		["Fav_PurgeDialogComplete"] = "我的最愛清除程序完成:",
		["Fav_DeleteHeader"] = "刪除我的最愛",
		["Fav_DeleteWarning"] = "是否刪除下列角色_我的最愛?",
		["Fav_DeleteComplete"] = "物品已經成功於我的最愛中刪除.",
		--////////////////////////////////

		--////////////////////////////////
		--ItemID
		["ItemID_Item"] = "物件:",
		["ItemID_Format"] = "例如: 12345:0:0:0:0:0:0:0 or 12345",
		["ItemID_Warn"] = "警告: ItemSync插件作者對於\n 發生斷線現象不負任何責任!\n",
		["ItemID_Warn2"] = "風險自負!",
		["ItemID_Invalid"] = "無效 ItemID!",
		["ItemID_Valid"] = "請稍候 3 秒_取得有效物件 [",
		["ItemID_ValidYes"] = "已成功轉換為有效物件!",
		["ItemID_ValidNo"] = "無效物件轉換失敗!",
		["ItemID_ValidWait"] = "請稍候, 系統正在處理中!",
		--////////////////////////////////
		
		--////////////////////////////////
		--Delete Item
		["DeleteItem_Header"] = "刪除物件",
		["DeleteItem_Warn"] = "請確定是否要從資料庫中\n刪除下列物件?",
		["DeleteItem_DeleteComplete"] = "物件已刪除成功.",
		--////////////////////////////////

		--////////////////////////////////
		--QuickBag
		["QuickBag_ShowStack"] = "顯示堆疊數",
		["QuickBag_HideEmpty"] = "隱藏空價格",
		["QuickBag_SortPrice"] = "依價格排序",
		["QuickBag_SortRarity"] = "依稀有度排序",
		--////////////////////////////////

		--////////////////////////////////
		--MiniMap
		["MiniMap_LeftClick"] = "(點擊)",
		["MiniMap_LeftClick1"] = "打開ItemSync視窗",
		["MiniMap_LeftClickDown"] = "(左鍵)",
		["MiniMap_LeftClickDown1"] = "移動小地圖圖示",
		["MiniMap_LeftClickMouseDrag"] = "(Alt+左鍵)",
		["MiniMap_LeftClickMouseDrag1"] = "可自由移動圖示位置",
		["MiniMap_RightClick"] = "(右鍵)",
		["MiniMap_RightClick1"] = "叫出選單",
		--////////////////////////////////
		
		--////////////////////////////////
		--One database
		["OneDB_Header"] = "合併資料庫",
		["OneDB_SplitHeader"] = "拆開資料庫",
		["OneDB_SureFirst"] = "請確定是否要合併\n你的資料庫?",
		["OneDB_SureSecond"] = "請確定是否要拆開\n你的資料庫:",
		["OneDB_Complete"] = "資料庫運作完成!",
		--////////////////////////////////
	
		--////////////////////////////////
		--Optimize
		["Optimize_Header"] = "優化",
		["Optimize_InvalidHeader"] = "成為有效物件",
		["Optimize_Running"] = "優化中...",
		["Optimize_InvalidRunning"] = "執行中...",
		["Optimize_Complete"] = "優化運作完成",
		["Optimize_InvalidComplete"] = "有效物件轉換完成",
		["Optimize_Check"] = "請確定是否要\n對資料庫執行優化?",
		["Optimize_InvalidCheck"] = "請確定是否要\n將無效物件轉換為有效物件?",
		["Optimize_No"] = "系統正在處理中!",
		["Optimize_InvalidRelog"] = "注意: 並非所有物件都將成功轉換,\n請重新登入.",
		--////////////////////////////////

		--////////////////////////////////
		--Help
		["Help_MainSection"] = 19,
		["Help_MainSection1"] = "|c00A2D96F(左鍵)|r\n",
		["Help_MainSection2"] = "(左鍵) = 在聊天視窗中取得物件資訊.\n",
		["Help_MainSection3"] = "(Shift)+(左鍵) = 向聊天視窗貼上物件連結.\n",
		["Help_MainSection4"] = "(Control)+(Shift)+(左鍵) = 加入物件至我的最愛.\n",
		["Help_MainSection5"] = "(Control)+(左鍵) = 向物件使用試衣間.\n",
		["Help_MainSection6"] = "\n",
		["Help_MainSection7"] = "|c00A2D96F(右鍵)|r\n",
		["Help_MainSection8"] = "(Control)+(右鍵) = 強制取得物件資訊.\n",
		["Help_MainSection9"] = "(Alt)+(右鍵) = 於資料庫中刪除此物件.\n",
		["Help_MainSection10"] = "\n",
		["Help_MainSection11"] = "全部物件即為保存於資料庫中的總數.\n",
		["Help_MainSection12"] = "當前顯示即為資料庫中的總數.\n",
		["Help_MainSection13"] = "如果你要更新當前視窗顯示, 按下'重新整理'按鈕.\n",
		["Help_MainSection14"] = "\n",
		["Help_MainSection15"] = "|c00FC5252(ITEM)|r = 無效物件.\n",
		["Help_MainSection16"] = "|c00F3EF86(ITEM)|r = 該物件擁有 [不同的] 狀態.\n",
		["Help_MainSection17"] = "\n",
		["Help_MainSection18"] = "物件有相同的名字,但可能適用於不同的職業. 在物件名稱前面會有一個黃色小箭頭.\n\n繁中漢化:竹笙姬@暴風祭壇",
		["Help_MainSection19"] = "\n\n",
		["Help_OptionsSection"] = 32,
		["Help_OptionsSection1"] = "|c00A2D96FFetch Links|r\n",
		["Help_OptionsSection2"] = "Fetch Links可以讓你使用物件的部份名稱來連結物件;或完整名稱.  ",
		["Help_OptionsSection3"] = "你不需使用名稱中的字首. 你可以使用名稱中的任何部份來連結物件.\n\n",
		["Help_OptionsSection4"] = "例如: [*銅*] 可轉換為 [銅礦]\n",
		["Help_OptionsSection5"] = "例如: [*礦*] 可轉換為 [銅礦]\n",
		["Help_OptionsSection6"] = "例如: [*巨龍*] 可轉換為 [多彩巨龍胸甲]\n",
		["Help_OptionsSection7"] = "例如: [*多彩*] 可轉換為 [多彩巨龍胸甲]\n",
		["Help_OptionsSection8"] = "\n\n",
		["Help_OptionsSection9"] = "|c00A2D96F滑鼠追蹤|r\n",
		["Help_OptionsSection10"] = "允許你使用滑鼠經過的方式來搜集物件資訊.  注意: 暴雪公司對於距離有所限制",
		["Help_OptionsSection11"] = ". 此請注意這個功能也許會造成系統延遲.\n",
		["Help_OptionsSection12"] = "\n",
		["Help_OptionsSection13"] = "|c00A2D96F隱藏物件|r\n",
		["Help_OptionsSection14"] = "這項功能將主視窗開啟時的讀取物件動作取消, 只有在你搜尋物件時才會顯示物件資訊.\n",
		["Help_OptionsSection15"] = "\n",
		["Help_OptionsSection16"] = "|c00A2D96F相同資料庫|r\n",
		["Help_OptionsSection17"] = "注意: 風險自負!!! 這項功能將可以讓你跨伺服器使用相同的物件資料庫.\n",
		["Help_OptionsSection18"] = "\n",
		["Help_OptionsSection19"] = "|c00A2D96F優化資料庫|r\n",
		["Help_OptionsSection20"] = "分析資料庫中所有的物件並更新它們. 可以幫助你使用搜尋功能.\n",
		["Help_OptionsSection21"] = "本項功能只針對有效物件.\n",
		["Help_OptionsSection22"] = "\n",
		["Help_OptionsSection23"] = "|c00A2D96F無效物件轉換為有效物件|r\n",
		["Help_OptionsSection24"] = "注意: 風險自負!!!\n",
		["Help_OptionsSection25"] = "\n",
		["Help_OptionsSection26"] = "本項功能提供轉換無效物件為有效物件. 你可能會因此與伺服器中斷連線. 請注意某些物件",
		["Help_OptionsSection27"] = " 將在你重新登入後有效. 並非所有的無效物件都可以這樣做.\n",
		["Help_OptionsSection28"] = "\n",
		["Help_OptionsSection29"] = "|c00A2D96F重置資料庫|r\n",
		["Help_OptionsSection30"] = "注意: 風險自負!!!\n\n",
		["Help_OptionsSection31"] = "這項功能將會刪除物件資料庫中所有物件. 也就是資料庫物件數將歸零.\n",
		["Help_OptionsSection32"] = "\n\n",
		["Help_FilterSection"] = 13,
		["Help_FilterSection1"] = "|c00A2D96F過濾|r\n",
		["Help_FilterSection2"] = "ItemSync可以依照物件稀有度來過濾掉不想看到的物件.\n",
		["Help_FilterSection3"] = "\n",
		["Help_FilterSection4"] = "過濾可以讓物件不會在資料庫中留下記錄, 只要在其對應的選項中把你想要[過濾]的項目打勾.\n",
		["Help_FilterSection5"] = "\n",
		["Help_FilterSection6"] = "注意: 在選項中打勾, 是你設定ItemSync不要記錄其相對應稀有度物件!\n",
		["Help_FilterSection7"] = "\n",
		["Help_FilterSection8"] = "ItemSync預設為記錄所有的物件.\n",
		["Help_FilterSection9"] = "\n",
		["Help_FilterSection10"] = "|c00A2D96F清除|r\n",
		["Help_FilterSection11"] = "注意: 此動作無法復原!!!\n\n",
		["Help_FilterSection12"] = "無論是依稀有度或是無效物件來清除, 請使用相對應的項選.\n",
		["Help_FilterSection13"] = "\n\n",
		["Help_FavoritesSection"] = 16,
		["Help_FavoritesSection1"] = "|c00A2D96F我的最愛|r\n",
		["Help_FavoritesSection2"] = "本項功能可以顯示所有你曾經加入過的物件. 請注意, 在加入之前請先認確選擇的角色.\n",
		["Help_FavoritesSection3"] = "\n",
		["Help_FavoritesSection4"] = "|c00A2D96F加入至我的最愛|r\n",
		["Help_FavoritesSection5"] = "(Control)+(Shift)+(左鍵) 物件將會從ItemSync主視窗加到我的最愛.\n\n",
		["Help_FavoritesSection6"] = "請注意,物件將會被加入到[當前]角色_我的最愛視窗中.\n",
		["Help_FavoritesSection7"] = "\n",
		["Help_FavoritesSection8"] = "|c00A2D96F移除我的最愛|r\n",
		["Help_FavoritesSection9"] = "注意: 此動作無法復原\n\n",
		["Help_FavoritesSection10"] = "按下紅色鈕按可以將物件從清單中移除.\n",
		["Help_FavoritesSection11"] = "\n",
		["Help_FavoritesSection12"] = "|c00A2D96F(左鍵)|r\n",
		["Help_FavoritesSection13"] = "(左鍵) = 在聊天視窗中取得物件資訊.\n",
		["Help_FavoritesSection14"] = "(Shift)+(左鍵) = 向聊天視窗貼上物件連結.\n",
		["Help_FavoritesSection15"] = "(Control)+(左鍵) = 向物件使用試衣間.\n",
		["Help_FavoritesSection16"] = "\n\n",
		--////////////////////////////////
		
		--////////////////////////////////
		--ItemCount Frame
		["ItemCount_FrameHeader"] = "ItemSync物件總計",
		["ItemCount_LeftClick"] = "Control+左鍵 = 打開ItemSync視窗",
		--////////////////////////////////


	    }--end return
	    
	end
	)--end function


if ( GetLocale() == "zhTW" ) then

	--array type
	ISA = {
	
		--////////////////////////////////
		--Weapon Location
		["SORTING"] = {
			["名稱"]=1,
			["稀有度"]=2,
		},
		--////////////////////////////////
	
		--////////////////////////////////
		--Types of Bags
		--This corresponds to the subItemTypes in getiteminfo()
		["BAGS"] = { 
			["附魔包"]=1,
			["工程包"]=1,
			["草藥包"]=1,
			["靈魂碎片背包"]=1,
			["彈藥袋"]=1,
			["箭袋"]=1,
			["寶石背包"]=1,
			
		},
		--////////////////////////////////

		--////////////////////////////////
		--Weapon Location
		["WL"] = { 
			["聖物"]=1,
			["背部"]=2,
			["單手"]=3,
			["雙手"]=4,
			["副手"]=5,
			["手腕"]=6,
			["胸部"]=7,
			["腿部"]=8,
			["腳"]=9,
			["襯衣"]=10,
			["遠程"]=11,
			["主手"]=12,
			["腰部"]=13,
			["頭部"]=14,
			["槍械"]=15,
			["手指"]=16,
			["手套"]=17,
			["肩部"]=18,
			["魔杖"]=19,
			["飾品"]=20,
			["公會徽章"]=21,
			["頸部"]=22,
			["投擲武器"]=23,
			["弩"]=24
		},
		--////////////////////////////////

		--////////////////////////////////
		--Weapon Types
		["WT"] = { 
			["斧"]=1,
			["弓"]=2,
			["匕首"]=3,
			["錘"]=4,
			["法杖"]=5,
			["劍"]=6,
			["槍械"]=7,
			["魔杖"]=8,
			["投擲武器"]=9,
			["長柄武器"]=10,
			["拳套"]=11,
			["弩"]=12
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Tradeskills
		["TS"] = { 
			["煉金術"]=1,
			["鍛造"]=2,
			["烹飪"]=3,
			["附魔"]=4,
			["工程學"]=5,
			["製皮"]=6,
			["裁縫"]=7,
			["珠寶設計"]=8
		},
		--////////////////////////////////

		--////////////////////////////////
		--Armor Types
		["AT"] = { 
			["布甲"]=1,
			["皮甲"]=2,
			["鎖甲"]=3,
			["鎧甲"]=4
		},
		--////////////////////////////////

		--////////////////////////////////
		--Shield Type
		["ST"] = { 
			["圓盾"]=1,
			["盾牌"]=2
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Resistances
		["AR"] = { 
			["祕法抗性"]=1,
			["火焰抗性"]=2,
			["自然抗性"]=3,
			["冰霜抗性"]=4,
			["暗影抗性"]=5
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Rarity
		["RARITY"] = { 
			["粗糙"]=0,
			["普通"]=1,
			["優秀"]=2,
			["精良"]=3,
			["史詩"]=4,
			["傳說"]=5,
			[0]="粗糙",
			[1]="普通",
			[2]="優秀",
			[3]="精良",
			[4]="史詩",
			[5]="傳說"
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