-- Id: $Id: kr.lua 72 2008-04-22 15:05:09Z next96 $
-- Version: r$Revision: 72 $

--[[--------------------------------------------------------------------------------
  ItemSync Korean Localization

  Author:  Derkyle
  Website: http://www.manaflux.com

  Korean Translation by Zeno(precia@paran.com)
-----------------------------------------------------------------------------------]]

	ISL = AceLibrary("AceLocale-2.2"):new("ItemSync")
	ISL:RegisterTranslations("koKR", function()
	
	    return {
	    	["No"] = "아니오",
	    	["Yes"] = "예",
		["Sell"] = "판매 가격 ",
		["Vendor"] = "상점 가격 ",
		["NoSellP"] = "팔 수 없음",
		["ReqSearch1"] = "요구 사항: (.+)",
		["ReqSearch2"] = "레벨 (%d+)",
		["ReqSearch3"] = "(.+) %((%d+)%)",
		["Help"] = "[도움말]",
		["OfThe"] = "(~의)",
		--OfTheCheck refers to the sub items like  Swash Buckler of the Whale
		["OfTheCheck1"] = "of the", --added two because some languages have masculine and feminine names
		["OfTheCheck2"] = "of the", --so one can be example: german  OfTheCheck1 = der OfTheCheck2 = des
		["TotalItems"] = "수집된 아이템:",
		["TotalShown"] = "나열된 아이템: ",
		["TotalInvalid"] = "잘못된 아이템: ",
		["Item"] = "아이템:",
		["ItemDeleted"] = "[아이템이 삭제됨]",
		["Reset"]="리셋",
		["Refresh"] = "갱신",
		["Search"] = "검색",
		["Options"] = "설정",
		["Filters"] = "필터",
		["Favorites"] = "즐겨찾기",
		["ItemID"] = "아이템 ID",
		["QuickBag"] = "QuickBag",
		["Unknown"] = "알 수 없음",
		["Purge"] = "삭제",
		["OperationComplete"] = "성공적으로 수행되었습니다!",
		["Purge_all_db"] = "정말로 모든 데이터베이스를\n삭제하시겠습니까? 돌이킬 수 없습니다!",
		["ShowNone"] = "None",
		["DisplayInvalid"] = "Display Invalid",

		--////////////////////////////////
		--Key Bindings
		["ToggleMain"] = "메인 메뉴 열기/닫기",
		["ToggleFav"] = "즐겨찾기 메뉴 열기/닫기",
		["ToggleQuick"] = "QuickBag 메뉴 열기/닫기",
		["ToggleItemID"] = "아이템 ID 메뉴 열기/닫기",
		--////////////////////////////////
		
		--////////////////////////////////
		--Special Cases
		["Crossbow"] = "석궁",
		["Thrown"] = "투척 무기",
		["Gun"] = "총",
		["Wand"] = "마법봉",
		"|c00FF0000경고: 접속이 끊어지는 현상에 대해 \nItemSync의 제작자는 어떠한 책임도 지지 않습니다!|r\n|c00A2D96F사용시에 주의해 주십시오!|r";
		--////////////////////////////////

		--////////////////////////////////
		--Invalid Item
		["InvalidItem"] = "잘못된 아이템",
		["InvalidForce"] = "이 아이템은 캐쉬에서\n발견되지 않았습니다.\n강제로 이 아이템을 확인하려면\n(컨트롤 + 오른쪽 클릭)",
		["InvalidWarning"] = "경고: 접속이 끊어지는 현상에 대해 \nItemSync의 제작자는 어떠한 책임도 지지 않습니다!",
		["ForceInvalid"] = "오류 아이템 확인",
		["ItemForce"] = "정말로 다음 아이템을\n강제로 확인하시겠습니까?",
		["ItemForceWait"] = "3초 내에 아이템의 확인이 이루어집니다. 주의: 접속이 끊길 수도 있습니다!",
		["ItemForceFail"] = "아이템의 확인에 실패했습니다.",
		["ItemForceSuccess"] = "이하의 아이템들이 성공적으로 확인되었습니다: ",
		["InvalidForce_Wait"] = "오류 아이템 확인 작업이 이미 수행 중입니다!",
		--////////////////////////////////

		--////////////////////////////////
		--Search Feature
		["SearchName"]="이름으로 검색:",
		["Location"] = "위치:",
		["Rarity"] = "등급:",
		["Weapon"] = "무기:",
		["Level"] = "레벨:",
		["TradeSkill"] = "전문 기술:",
		["Armor"] = "방어구:",
		["Shield"] = "방패:",
		["Resistance"] = "저항:",
		["ArcaneResistance"]="비전 저항력",
		["FireResistance"]="화염 저항력",
		["NatureResistance"]="자연 저항력",
		["FrostResistance"]="냉기 저항력",
		["ShadowResistance"]="암흑 저항력",
		--////////////////////////////////
		
		--////////////////////////////////
		--Options
		["MoneyOpt_Header"] = "툴팁 표시 설정",
		["MoneyOpt_1"] = "아이템의 판매 가격을 표시합니다.",
		["MoneyOpt_2"] = "아이템의 상점 가격을 표시합니다.",
		["MoneyOpt_3"] = "아이템의 텍스쳐를 툴팁에 표시합니다.",
		["ExternalOpt_Header"] = "그외 설정",
		["ExternalOpt_1"] = "아이템 갯수 프레임을 표시합니다.",
		["ExternalOpt_2"] = "미니맵에 버튼을 표시합니다.",
		["ExternalOpt_3"] = "자동 완성 기능을 사용합니다.",
		["ExternalOpt_4"] = "마우스오버로 살펴보기. |c00A2D96F(지연 현상이 나타날 수 있음)|r",
		["ExternalOpt_5"] = "ItemSync 실행시 모든 아이템을 숨깁니다.",
		["DatabaseOpt_Header"] = "데이터베이스 설정",
		["DatabaseOpt_1"] = "서버에 관계없이 같은 데이터베이스를 사용합니다.",
		["AdditionalOpt_Header"] = "부가 설정",
		["AdditionalOpt_1"] = "모든 창 초기화",
		["AdditionalOpt_2"] = "데이터베이스 최적화",
		["AdditionalOpt_3"] = "오류 아이템 확인",
		["AdditionalOpt_4"] = "아이템 데이터베이스 삭제",
		--////////////////////////////////
		
		--////////////////////////////////
		--Filters
		["RarityOpt_Header"] = "등급에 따른 필터",
		["RarityOpt_0"] = "|cff9d9d9d하급|r",
		["RarityOpt_1"] = "|cffffffff일반|r",
		["RarityOpt_2"] = "|cff1eff00고급|r",
		["RarityOpt_3"] = "|cff0070dd희귀|r",
		["RarityOpt_4"] = "|cffa335ee영웅|r",
		["RarityOpt_5"] = "|cffff8000전설|r",
		["Filters_PurgeInvalid"] = "오류 아이템 모두 삭제",
		["Filters_PurgeRarity"] = "등급에 따른 아이템 삭제",
		["PurgeInvalid_DialogHeader"] = "오류 아이템 삭제",
		["PurgeInvalid_DialogWarn"] = "정말로 모두 삭제하시겠습니까?:\n",
		["PurgeInvalid_DialogWarn2"] = "[오류 아이템]",
		["PurgeInvalid_DialogComplete"] = "삭제가 완료되었습니다: [오류 아이템]",
		["PurgeRarity_DialogHeader"] = "등급에 따른 삭제",
		["PurgeRarity_DialogWarn"] = "정말로 삭제하시겠습니까?:\n",
		["PurgeRarity_DialogComplete"] = "삭제가 완료되었습니다:",
		
		--////////////////////////////////

		--////////////////////////////////
		--Favorites
		["Fav_CurrentUsr"] = "현재 선택된 플레이어:",
		["Fav_DialogHeader"] = "즐겨찾기 추가",
		["Fav_DialogWarn"] = "이 아이템을 즐겨찾기에 추가하시겠습니까?",
		["Fav_DialogComplete"] = "즐겨찾기에 등록됨:",
		["Fav_Duplicate"] = "이 아이템은 이미 즐겨찾기에 등록되어 있습니다.",
		["Fav_Delete"] = "클릭하면 즐겨찾기에서 아이템을 삭제합니다.",
		["Fav_PurgeWarning"] = "정말로 이 아이템을\n 다음 플레이어의 즐겨찾기에서 삭제하시겠습니까?",
		["Fav_PurgeDialogComplete"] = "즐겨찾기의 처리가 성공적으로 완료되었습니다.",
		["Fav_DeleteHeader"] = "즐겨찾기 삭제",
		["Fav_DeleteWarning"] = "이 아이템을 다음 플레이어의 즐겨찾기에서 삭제하시겠습니까?",
		["Fav_DeleteComplete"] = "아이템이 성공적으로 삭제되었습니다.",
		--////////////////////////////////

		--////////////////////////////////
		--ItemID
		["ItemID_Item"] = "아이템:",
		["ItemID_Format"] = "예제: 12345:0:0:0:0:0:0:0 또는 12345",
		["ItemID_Warn"] = "경고: 접속이 끊어지는 현상에 대해 \nItemSync의 제작자는 어떠한\n책임도 지지 않습니다!\n",
		["ItemID_Warn2"] = "사용시에 주의해 주십시오!",
		["ItemID_Invalid"] = "아이템 ID가 잘못되었습니다!",
		["ItemID_Valid"] = "아이템 확인 중이오니 3초만 기다려 주세요! [",
		["ItemID_ValidYes"] = "아이템 확인 성공!",
		["ItemID_ValidNo"] = "아이템 확인 실패!",
		["ItemID_ValidWait"] = "아이템 확인 중이오니 잠시만 기다려 주세요!",
		--////////////////////////////////
		
		--////////////////////////////////
		--Delete Item
		["DeleteItem_Header"] = "아이템 삭제",
		["DeleteItem_Warn"] = "정말로 이 아이템을\n데이터베이스에서 삭제하시겠습니까?",
		["DeleteItem_DeleteComplete"] = "아이템이 성공적으로 삭제되었습니다.",
		--////////////////////////////////

		--////////////////////////////////
		--QuickBag
		["QuickBag_ShowStack"] = "총 갯수 표시",
		["QuickBag_HideEmpty"] = "팔 수 없음 숨김",
		["QuickBag_SortPrice"] = "가격 순 정렬",
		["QuickBag_SortRarity"] = "등급 순 정렬",
		--////////////////////////////////

		--////////////////////////////////
		--MiniMap
		["MiniMap_LeftClick"] = "(클릭)",
		["MiniMap_LeftClick1"] = "ItemSync 토글",
		["MiniMap_LeftClickDown"] = "(왼쪽 클릭)",
		["MiniMap_LeftClickDown1"] = "미니맵 이동",
		["MiniMap_LeftClickMouseDrag"] = "(Alt+왼쪽 클릭)",
		["MiniMap_LeftClickMouseDrag1"] = "미니맵 자유 이동",
		["MiniMap_RightClick"] = "(오른쪽 클릭)",
		["MiniMap_RightClick1"] = "메뉴 표시",
		--////////////////////////////////
		
		--////////////////////////////////
		--One database
		["OneDB_Header"] = "데이터베이스 병합",
		["OneDB_SplitHeader"] = "데이터베이스 분리",
		["OneDB_SureFirst"] = "정말로 당신의 데이터베이스를\n하나로 합치겠습니까?",
		["OneDB_SureSecond"] = "정말로 당신의 데이터베이스를\n분리하시겠습니까?:",
		["OneDB_Complete"] = "데이터베이스의 처리가 완료되었습니다!",
		--////////////////////////////////
	
		--////////////////////////////////
		--Optimize
		["Optimize_Header"] = "최적화",
		["Optimize_InvalidHeader"] = "확인",
		["Optimize_Running"] = "최적화 중",
		["Optimize_InvalidRunning"] = "확인 중",
		["Optimize_Complete"] = "최적화가 완료되었습니다.",
		["Optimize_InvalidComplete"] = "확인이 완료되었습니다.",
		["Optimize_Check"] = "정말로 데이터베이스를\n최적화 시키겠습니까?",
		["Optimize_InvalidCheck"] = "정말로 오류 아이템을\n강제로 확인하겠습니까?",
		["Optimize_No"] = "이미 최적화가 실행 중입니다!",
		["Optimize_InvalidRelog"] = "주의: 몇몇 아이템은 다음 로그인까지\n 확인되지 않을 수도 있습니다.",
		--////////////////////////////////

		--////////////////////////////////
		--Help
		["Help_MainSection"] = 19,
		["Help_MainSection1"] = "|c00A2D96F(왼쪽 클릭)|r\n",
		["Help_MainSection2"] = "(왼쪽 클릭) = 채팅창에 아이템 링크.\n",
		["Help_MainSection3"] = "(쉬프트)+(왼쪽 클릭) = 채팅창에 아이템 링크.\n",
		["Help_MainSection4"] = "(컨트롤)+(쉬프트)+(왼쪽 클릭) = 즐겨찾기에 추가.\n",
		["Help_MainSection5"] = "(컨트롤)+(왼쪽 클릭) = 아이템 착용 모습 살펴보기.\n",
		["Help_MainSection6"] = "\n",
		["Help_MainSection7"] = "|c00A2D96F(오른쪽 클릭)|r\n",
		["Help_MainSection8"] = "(컨트롤)+(오른쪽 클릭) = 강제로 오류 아이템 확인.\n",
		["Help_MainSection9"] = "(알트)+(오른쪽 클릭) = 아이템을 DB에서 삭제.\n",
		["Help_MainSection10"] = "\n",
		["Help_MainSection11"] = "수집된 아이템은 데이터베이스에 수집된 아이템의 총 갯수를 나타냅니다.\n",
		["Help_MainSection12"] = "나열된 아이템은 현재 메인 화면에 나열된 아이템의 총 갯수를 나타냅니다.\n",
		["Help_MainSection13"] = "만약 현재 나열된 아이템을 갱신하고 싶다면 '갱신' 버튼을 누르시기 바랍니다.\n",
		["Help_MainSection14"] = "\n",
		["Help_MainSection15"] = "|c00FC5252(ITEM)|r = 오류 아이템\n",
		["Help_MainSection16"] = "|c00F3EF86(ITEM)|r = [다른 능력]을 지닌 중복 아이템\n",
		["Help_MainSection17"] = "\n",
		["Help_MainSection18"] = "같은 이름을 가졌지만 서로 다른 효과를 가진 아이템들은 앞에 화살표가 붙어서 나타납니다.\n",
		["Help_MainSection19"] = "\n\n",
		["Help_OptionsSection"] = 32,
		["Help_OptionsSection1"] = "|c00A2D96F자동 완성 기능|r\n",
		["Help_OptionsSection2"] = "자동 완성 기능은 채팅창으로 아이템 이름의 일부만 입력해도 자동으로 링크가 되는 기능입니다. 대소문자의 구별은 필요없습니다.\n",
		["Help_OptionsSection3"] = "반드시 이름의 앞부분을 입력할 필요는 없습니다. 이름의 어느 부분을 입력해도 링크가 가능합니다.\n\n",
		["Help_OptionsSection4"] = "예제: [*copp*] 라고 입력하면 다음 아이템이 링크될 것입니다: [Copper Ore]\n",
		["Help_OptionsSection5"] = "예제: [*ore*] 라고 입력하면 다음 아이템이 링크될 것입니다: [Copper Ore]\n",
		["Help_OptionsSection6"] = "예제: [*flight*] 라고 입력하면 다음 아이템이 링크될 것입니다: [Breastplate of the Chromatic Flight]\n",
		["Help_OptionsSection7"] = "예제: [*chrom*] 라고 입력하면 다음 아이템이 링크될 것입니다: [Breastplate of the Chromatic Flight]\n",
		["Help_OptionsSection8"] = "\n\n",
		["Help_OptionsSection9"] = "|c00A2D96F마우스오버로 살펴보기|r\n",
		["Help_OptionsSection10"] = "이 기능은 단지 마우스를 플레이어 위에 가져다 대는 것 만으로 아이템의 수집을 가능케 합니다.\n",
		["Help_OptionsSection11"] = "단, 블리자드는 이 기능에 대해 일정 거리로 제한을 걸어 두었습니다. 또한 이 기능은 몇몇의 컴퓨터에서 약간의 지연을 유발할 수 있습니다.\n",
		["Help_OptionsSection12"] = "\n",
		["Help_OptionsSection13"] = "|c00A2D96F아이템 숨기기|r\n",
		["Help_OptionsSection14"] = "이 기능은 ItemSync가 처음 실행될 때 아이템들이 로드되는 것을 막아줍니다. 오직 검색으로만 아이템들을 찾아볼 수 있습니다.\n",
		["Help_OptionsSection15"] = "\n",
		["Help_OptionsSection16"] = "|c00A2D96F동일한 데이터베이스|r\n",
		["Help_OptionsSection17"] = "주의: 이 기능은 오작동을 유발할 수 있습니다. 이 기능은 모든 서버에 걸쳐서 동일한 아이템 데이터베이스를 사용하게 합니다.\n",
		["Help_OptionsSection18"] = "\n",
		["Help_OptionsSection19"] = "|c00A2D96F데이터베이스 최적화|r\n",
		["Help_OptionsSection20"] = "이 기능은 데이터베이스 내의 모든 아이템들을 분석하고 갱신합니다. 검색에서 성능 향상을 기대할 수 있습니다.\n",
		["Help_OptionsSection21"] = "단, 오로지 유효한 아이템만 가능합니다.\n",
		["Help_OptionsSection22"] = "\n",
		["Help_OptionsSection23"] = "|c00A2D96F오류 아이템 확인|r\n",
		["Help_OptionsSection24"] = "주의: 이 기능은 오작동을 유발할 수 있습니다!\n",
		["Help_OptionsSection25"] = "\n",
		["Help_OptionsSection26"] = "이 기능은 오류 아이템을 강제로 확인시켜 줍니다. 접속이 끊어지는 현상이 발생할 수도 있습니다.\n",
		["Help_OptionsSection27"] = "몇몇 아이템은 다음 로그인까지 확인되지 않을 수도 있습니다. 또한 모든 오류 아이템이 확인되어지는 것은 아닙니다.\n",
		["Help_OptionsSection28"] = "\n",
		["Help_OptionsSection29"] = "|c00A2D96F데이터베이스 삭제|r\n",
		["Help_OptionsSection30"] = "주의: 이 기능은 돌이킬 수 없습니다!\n\n",
		["Help_OptionsSection31"] = "이 기능은 당신의 데이터베이스의 모든 아이템을 삭제합니다. 데이터베이스는 완전히 초기화됩니다.\n",
		["Help_OptionsSection32"] = "\n\n",
		["Help_FilterSection"] = 13,
		["Help_FilterSection1"] = "|c00A2D96F필터링|r\n",
		["Help_FilterSection2"] = "ItemSync는 등급에 의해 원하지 않는 아이템을 필터링할 수 있는 기능이 있습니다.\n",
		["Help_FilterSection3"] = "\n",
		["Help_FilterSection4"] = "데이터베이스 내의 아이템을 등급에 의해 필터링하고자 한다면, [표시하지 않고자] 하는 등급의 [체크박스]에 체크해 두시면 됩니다.\n",
		["Help_FilterSection5"] = "\n",
		["Help_FilterSection6"] = "주의: 등급이 표시된 체크박스에 체크해 두면, ItemSync는 그 등급의 아이템을 '표시하지 않는다'는 것을 기억하십시오!\n",
		["Help_FilterSection7"] = "\n",
		["Help_FilterSection8"] = "ItemSync의 기본 설정은 모든 등급의 아이템을 표시합니다.\n",
		["Help_FilterSection9"] = "\n",
		["Help_FilterSection10"] = "|c00A2D96F삭제|r\n",
		["Help_FilterSection11"] = "주의: 이 기능은 돌이킬 수 없습니다!!!\n\n",
		["Help_FilterSection12"] = "오류 아이템이나 등급에 의해 분류된 아이템을 삭제하고 싶으면, 이 항목에 제공된 기능들을 사용하십시오.\n",
		["Help_FilterSection13"] = "\n\n",
		["Help_FavoritesSection"] = 16,
		["Help_FavoritesSection1"] = "|c00A2D96F즐겨찾기|r\n",
		["Help_FavoritesSection2"] = "이 기능은 당신이 찾아낸 아이템들을 별도로 표시해 줍니다. 즐겨찾기에 추가할 때에 원하는 유저를 선택하는 것을 기억하십시오.\n",
		["Help_FavoritesSection3"] = "\n",
		["Help_FavoritesSection4"] = "|c00A2D96F즐겨찾기에 추가|r\n",
		["Help_FavoritesSection5"] = "(컨트롤)+(쉬프트)+(왼쪽 클릭) 메인 화면의 아이템을 즐겨찾기에 추가시킵니다.\n\n",
		["Help_FavoritesSection6"] = "아이템이 즐겨찾기 항목에서 [현재] 선택되어진 유저에게 추가될 것입니다.\n",
		["Help_FavoritesSection7"] = "\n",
		["Help_FavoritesSection8"] = "|c00A2D96F즐겨찾기에서 삭제|r\n",
		["Help_FavoritesSection9"] = "주의: 이 기능은 돌이킬 수 없습니다!\n\n",
		["Help_FavoritesSection10"] = "즐겨찾기에서 아이템을 삭제하려면 아이템 왼쪽에 있는 빨간 버튼을 누르십시오.\n",
		["Help_FavoritesSection11"] = "\n",
		["Help_FavoritesSection12"] = "|c00A2D96F(왼쪽 클릭)|r\n",
		["Help_FavoritesSection13"] = "(왼쪽 클릭) = 채팅창에 아이템 링크.\n",
		["Help_FavoritesSection14"] = "(쉬프트)+(왼쪽 클릭) = 채팅창에 아이템 링크.\n",
		["Help_FavoritesSection15"] = "(컨트롤)+(왼쪽 클릭) = 아이템 착용 모습 살펴보기.\n",
		["Help_FavoritesSection16"] = "\n\n",
		--////////////////////////////////
		
		--////////////////////////////////
		--ItemCount Frame
		["ItemCount_FrameHeader"] = "ItemSync 아이템 갯수 프레임",
		["ItemCount_LeftClick"] = "컨트롤+왼쪽 클릭 = ItemSync 열기/닫기",
		--////////////////////////////////
		
		--////////////////////////////////
		--Binding
	    	["Toggle Main Frame"] = "메인창 토글",
	    	["Toggle Favorites Frame"] = "즐겨찾기창 토글",
	    	["Toggle ItemID Frame"] = "아이템ID창 토글",
	    	["Toggle QuickBag Frame"] = "빠른가방창 토글",
		--////////////////////////////////

		--////////////////////////////////
		--Options Menu
	    	["Debug"] = "디버그",
	    	["Turns display of debugging text on and off."] = "디버깅 메세지를 키거나 끕니다.",
	    	["Show"] = "표시",
	    	["Open the ItemSync window."] = "ItemSync창을 엽니다.",
	    	["Itemid"] = "아이템ID",
	    	["Open the ItemID window."] = "아이템ID창을 엽니다.",
	    	["Quickbag"] = "빠른가방",
	    	["Open the QuickBag window."] = "빠른가방창을 엽니다.",
	    	["Favorites"] = "즐겨찾기",
	    	["Open the Favorites window."] = "즐겨찾기창을 엽니다.",
	    	["Search"] = "검색",
		["Do a search for an item by keywords."] = "키워드로 아이템을 검색합니다.",
	    	["<partial item name>"] = "<아이템의 부분적인 이름>",
	    	["Reset Window"] = "창 초기화",
	    	["Resets all ItemSync windows."] = "모든 ItemSync 창을 초기화 합니다.",
		--////////////////////////////////

	    }--end return
	    
	end
	)--end function


if ( GetLocale() == "koKR" ) then

	--array type
	ISA = {
	
		--////////////////////////////////
		--Weapon Location
		["SORTING"] = {
			["이름"]=1,
			["등급"]=2,
		},
		--////////////////////////////////
	
		--////////////////////////////////
		--Types of Bags
		--This corresponds to the subItemTypes in getiteminfo()
		["BAGS"] = { 
			["마법부여 가방"]=1,
			["기계공학 가방"]=1,
			["약초 가방"]=1,
			["영혼의 가방"]=1,
			["탄환 주머니"]=1,
			["화살통"]=1,
			["보석 가방"]=1,
			
		},
		--////////////////////////////////

		--////////////////////////////////
		--Weapon Location
		["WL"] = { 
			["보조장비"]=1,
			["등"]=2,
			["한손 장비"]=3,
			["양손 장비"]=4,
			["보조장비"]=5,
			["손목"]=6,
			["가슴"]=7,
			["다리"]=8,
			["발"]=9,
			["속옷"]=10,
			["원거리 장비"]=11,
			["주장비"]=12,
			["허리"]=13,
			["머리"]=14,
			["총"]=15,
			["손가락"]=16,
			["손"]=17,
			["어깨"]=18,
			["마법봉"]=19,
			["장신구"]=20,
			["겉옷"]=21,
			["목"]=22,
			["투척 무기"]=23,
			["석궁"]=24
		},
		--////////////////////////////////

		--////////////////////////////////
		--Weapon Types
		["WT"] = { 
			["도끼"]=1,
			["활"]=2,
			["단검"]=3,
			["둔기"]=4,
			["지팡이"]=5,
			["도검"]=6,
			["총"]=7,
			["마법봉"]=8,
			["투척 무기"]=9,
			["장창류"]=10,
			["장착 무기"]=11,
			["석궁"]=12
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Tradeskills
		["TS"] = { 
			["연금술"]=1,
			["대장기술"]=2,
			["요리"]=3,
			["마법부여"]=4,
			["기계공학"]=5,
			["가죽세공"]=6,
			["재봉"]=7,
			["보석세공"]=8
		},
		--////////////////////////////////

		--////////////////////////////////
		--Armor Types
		["AT"] = { 
			["천"]=1,
			["가죽"]=2,
			["사슬"]=3,
			["판금"]=4
		},
		--////////////////////////////////

		--////////////////////////////////
		--Shield Type
		["ST"] = { 
			["버클러"]=1,
			["방패"]=2
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Resistances
		["AR"] = { 
			["비전 저항력"]=1,
			["화염 저항력"]=2,
			["자연 저항력"]=3,
			["냉기 저항력"]=4,
			["암흑 저항력"]=5
		},
		--////////////////////////////////
		
		--////////////////////////////////
		--Armor Rarity
		["RARITY"] = { 
			["하급"]=0,
			["보통"]=1,
			["고급"]=2,
			["희귀"]=3,
			["영웅"]=4,
			["전설"]=5,
			[0]="하급",
			[1]="보통",
			[2]="고급",
			[3]="희귀",
			[4]="영웅",
			[5]="전설"
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
