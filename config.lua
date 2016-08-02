

local ConfigFrame = CreateFrame("Frame", "ConfigFrame", UIParent, "BasicFrameTemplateWithInset");
ConfigFrame:SetSize(300, 200); --width, height
ConfigFrame:SetPoint("TOP", UIParent, "CENTER", 0, 300); --point, relativeFrame, relativePoint, xOffset, yOffset

--Child frames and regions:

--Config Title:
ConfigFrame.title = ConfigFrame:CreateFontString(nil, "OVERLAY");
ConfigFrame.title:SetFontObject("GameFontNormalSmall");
ConfigFrame.title:SetPoint("LEFT", ConfigFrame.TitleBg, "LEFT", 5, 0);
ConfigFrame.title:SetText("GratzATron5000 Config");

--Config name before gratz Check Button
ConfigFrame.checkbtn1 = CreateFrame("CheckButton", nil, ConfigFrame, "UICheckButtonTemplate");
ConfigFrame.checkbtn1:SetPoint("TOPLEFT", ConfigFrame.title, "BOTTOMLEFT", 12, -10);
ConfigFrame.checkbtn1.text:SetText("Set name before Gratz?");

--[[ConfigFrame.label1 = CreateFrame("MessageFrame", "label1", ConfigFrame);
ConfigFrame.label1:CreateFontString(nil, "OVERLAY", "GameFontNormal")
ConfigFrame.label1:SetPoint("LEFT")
ConfigFrame.label1:SetText("Enter Name")]]

ConfigFrame.EditBox = CreateFrame("EditBox", nil, ConfigFrame);--, "ChatFrameEditBoxTemplate"
ConfigFrame.EditBox:SetPoint("TOPLEFT", ConfigFrame.checkbtn1, "BOTTOMLEFT", 10, -10);
ConfigFrame.EditBox:SetHeight(25);
ConfigFrame.EditBox:SetWidth(125);
ConfigFrame.EditBox:SetMaxLetters(20);
ConfigFrame.EditBox:SetFontObject("GameFontHighlight");
ConfigFrame.EditBox:SetBackdrop( {
  bgFile = "Interface/COMMON/Common-CheckBox-Background",
  --edgeFile = "Interface/CHATFRAME/UI-ChatInputBorder", tile = false, tileSize = 0, edgeSize = 0,
  insets = { left = -5, right = 0, top = 0, bottom = -6 }
});
--Config Save Button
ConfigFrame.SaveButton = CreateFrame("Button", "SaveButton", ConfigFrame, "GameMenuButtonTemplate");
ConfigFrame.SaveButton:SetPoint("TOP", ConfigFrame.EditBox, "LEFT", 35, -20);
ConfigFrame.SaveButton:SetSize(75, 35);
ConfigFrame.SaveButton:SetText("Save");
ConfigFrame.SaveButton:SetNormalFontObject("GameFontNormalSmall");
ConfigFrame.SaveButton:SetHighlightFontObject("GameFontHighlightLarge");
--ConfigFrame.SaveButton:SetScript("OnClick", function (self, button, down)
--  GratzSayLvlOne();
--end);
