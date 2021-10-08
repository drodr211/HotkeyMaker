SendMode Input
datalist= Black|Silver|Gray|White|Maroon|Red|Purple|Fuchsia|Green|Lime|Olive|Yellow|Navy|Blue|Teal|Aqua

Gui, Add, Tab3,, General|Theme
Gui 1:Add, Text, ,Select your modifier key.
Gui, Add, DropDownList, vModifier, LCtrl|LAlt|LWin|RCtrl|RAlt|RWin
Gui 1:Add, Text, ,Type in your key here.
Gui 1:Add, Edit, vKey
Gui 1:Add, Text, ,Type your message here.
Gui 1:Add, Edit, vMessage w335, Message
Gui 1:Add, Button, default, Save
Gui 1:Show 
Gui, Tab, 2
Gui 1:Add, Text, ,Choose a color or input you own custom Hex color code (no Hashtag)
Gui, Add, ComboBox, vColor, %Datalist%
Gui 1:Add, Button, default, Apply

Msgbox, All changable options, messages, keys, and themes won't save when you close the application. Minimizing is ok.
Return


ButtonSave:
Gui, Submit , NoHide
KeyName := GetKeyName(key)
KeyModifier := GetKeyName(Modifier)
Msgbox When you press %Modifier% + %KeyName%,  "%Message%" will be typed.
Hotkey, %KeyModifier% & %KeyName%, mySub
return



ButtonApply:
Gui, Submit , NoHide
Gui, Color, %Color%
Msgbox Theme changed to %Color%
return


mySub:
Send %Message%
SendInput {Enter}
return

GuiClose:
ExitApp
