--[[--------------------------------------------------------------------------------
  ItemSync Help Core

  Author:  Derkyle
  Website: http://www.manaflux.com
-----------------------------------------------------------------------------------]]

function ItemSync:Show_Help(s)

	if (s == 1) then
	
		local storeText = "";

		for k=1, ISL["Help_MainSection"], 1 do
			storeText = storeText..self.crayon:White(ISL["Help_MainSection"..k]);
		end
	
		ISync_HelpFrameText:SetText(storeText);
		
	elseif (s == 2) then
	
		local storeText = "";

		for k=1, ISL["Help_OptionsSection"], 1 do
			storeText = storeText..self.crayon:White(ISL["Help_OptionsSection"..k]);
		end
	
		ISync_HelpFrameText:SetText(storeText);

	elseif (s == 3) then
	
		local storeText = "";

		for k=1, ISL["Help_FilterSection"], 1 do
			storeText = storeText..self.crayon:White(ISL["Help_FilterSection"..k]);
		end
	
		ISync_HelpFrameText:SetText(storeText);
		
	elseif (s == 4) then
	
		local storeText = "";

		for k=1, ISL["Help_FavoritesSection"], 1 do
			storeText = storeText..self.crayon:White(ISL["Help_FavoritesSection"..k]);
		end
	
		ISync_HelpFrameText:SetText(storeText);

	end
	
	if (ISync_HelpFrame:IsVisible()) then
		ISync_HelpFrame:Hide();
	else
		ISync_HelpFrame:Show();
	end

end