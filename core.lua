print("GratzATron5000 v1.0 is now loaded");
print("Type /gat5 help for a list of commands");

SLASH_gat1 = "/gat5"
SlashCmdList["gat"] = function(msg, editbox)
  if msg == 'help' then
    print('/gat5 show will open the GratzATron5000 window');
    print('/gat5 config will open the options window');
  elseif msg == 'show' then
  GratzFrame:Show();
    --print('test for /gat5 show');
  elseif msg == 'config' then
    ConfigFrame:Show();
    --print('test for /gat5 config');
  else
    print("I'm sorry, that is not a proper command for the GratzATron5000");
  end
end

function MainFrame_OnVarLoad(this)
    this:ClearAllAnchors();
    if not MainFrame_X or not MainFrame_Y then
        this:SetAnchor("CENTER", "CENTER", "UIParent", 0, 0);
	else
	   local scale = GetUIScale();
	   this:SetAnchor("TOPLEFT", "TOPLEFT", "UIParent", MainFrame_X / scale, MainFrame_Y / scale);
    end
end

function MainFrame_MoveEnd()
    MainFrame:StopMovingOrSizing();
    MainFrame_X, MainFrame_Y = MainFrame:GetPos();
end

function superGratz()
SendChatMessage("(Drew): " .. lvlThree[math.random(0,table.getn(lvlThree))], "guild" );
end

function bigGratz()
SendChatMessage("(Drew): " .. lvlTwo[math.random(0,table.getn(lvlTwo))], "guild" );
end

function gratz()
SendChatMessage("(Drew): " .. lvlOne[math.random(0,table.getn(lvlOne))], "guild" );
end


local MainFrame = CreateFrame("Frame", "GratzFrame", UIParent, "BasicFrameTemplateWithInset");
MainFrame:SetSize(120, 140); --width, height
MainFrame:SetPoint("TOP", UIParent, "CENTER", 0, 300); --point, relativeFrame, relativePoint, xOffset, yOffset
MainFrame:EnableMouse(true)
MainFrame:SetMovable(true);
MainFrame:RegisterForDrag("LeftButton")
MainFrame:SetScript("OnDragStart",MainFrame.StartMoving)
MainFrame:SetScript("OnDragStop",function(self)
 self:StopMovingOrSizing()
 settings.XPos = self:GetLeft()
 settings.YPos = self:GetBottom()
end)

MainFrame:SetScript("OnEvent",function(self,event,...)
 if event=="PLAYER_LOGIN" then
 MyAddonPerSettings = GratzATron5000PerSettings or {} -- create table if one doesn't exist
 settings = GratzATron5000PerSettings -- assign settings declared above
 if settings.XPos then
 MainFrame:ClearAllPoints()
 MainFrame:SetPoint("BOTTOMLEFT",settings.XPos,settings.YPos)
 end
 end
end)

--Child frames and regions:

--UI Title:
MainFrame.title = MainFrame:CreateFontString(nil, "OVERLAY");
MainFrame.title:SetFontObject("GameFontNormalSmall");
MainFrame.title:SetPoint("LEFT", MainFrame.TitleBg, "LEFT", 5, 0);
MainFrame.title:SetText("GratzATron5000");

--UI Super Gratz button:
MainFrame.SuperGratz = CreateFrame("Button", "SuperGratz", MainFrame, "GameMenuButtonTemplate");
MainFrame.SuperGratz:SetPoint("BOTTOM", MainFrame, "TOP", 0, -62);
MainFrame.SuperGratz:SetSize(100, 35);
MainFrame.SuperGratz:SetText("Super Gratz");
MainFrame.SuperGratz:SetNormalFontObject("GameFontNormalSmall");
MainFrame.SuperGratz:SetHighlightFontObject("GameFontHighlightMedium");
MainFrame.SuperGratz:SetScript("OnClick", function (self, button, down)
  superGratz();
end);


--UI Big Gratz Button
MainFrame.bigGratz = CreateFrame("Button", nil, MainFrame, "GameMenuButtonTemplate");
MainFrame.bigGratz:SetPoint("TOP", MainFrame.SuperGratz, "BOTTOM", 0, 0);
MainFrame.bigGratz:SetSize(100, 35);
MainFrame.bigGratz:SetText("Big Gratz");
MainFrame.bigGratz:SetNormalFontObject("GameFontNormalSmall");
MainFrame.bigGratz:SetHighlightFontObject("GameFontHighlightLarge");
MainFrame.bigGratz:SetScript("OnClick", function (self, button, down)
  bigGratz();
end);

--UI Gratz Button
MainFrame.gratz = CreateFrame("Button", nil, MainFrame, "GameMenuButtonTemplate");
MainFrame.gratz:SetPoint("TOP", MainFrame.bigGratz, "BOTTOM", 0, 0);
MainFrame.gratz:SetSize(100, 35);
MainFrame.gratz:SetText("Gratz");
MainFrame.gratz:SetNormalFontObject("GameFontNormalSmall");
MainFrame.gratz:SetHighlightFontObject("GameFontHighlightLarge");
MainFrame.gratz:SetScript("OnClick", function (self, button, down)
  gratz();
end);
ConfigFrame:Hide(); --Hidding the Config Frame until needed
