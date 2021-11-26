local L = LANG.GetLanguageTableReference("en")

//show that one died
L["ttt2_sc_show_no_name"] = "Someone whacked themselves! Congratulations!"
L["ttt2_sc_show_a_name"] = "{deadply} whacked themselves! Congratulations!"

//print statics
L["ttt2_sc_show_all"] = "Their personal statics are {pcount} suicides \n\nThe overall statics for this map are {mapcount} suicides"
L["ttt2_sc_show_persn"] = "Their personal statics are {pcount} suicides"
L["ttt2_sc_show_map"] = "The overall statics for this map are {mapcount} suicides"

//F1 Menu labels - and msg options
L["submenu_addons_sc_revamp_title"] = "Suicide-Counter"
L["header_addons_sc_revamp"] = "General Settings"

L["help_sc_revamp_msgs"] = "The following two convars control how the counter's messages shall be displayed. MSTACK messages are the popups, that are displayed in the top right corner. \n\nEPOPs are the messages in the center of the screen."
L["label_sc_revamp_mstack"] = "Display the counter through MSTACK messages"
L["label_sc_revamp_epop"] = "Display the counter through EPOPs"

//announcement option
L["help_sc_revamp_announce"] = "If it's set on 'true', there will be no names displayed. Everything happens anonymous."
L["label_sc_revamp_anon_announce"] = "Set all intel to anonymity"

//counter settings
L["help_sc_revamp_counts"] = "The Counter counts two different kinds of statics. The personal statics are the deaths of each player and is counted for every player separately. The map statics are the overall stats of all players until the next map switch."
L["label_sc_revamp_pcount"] = "Display the personal stats"
L["label_sc_revamp_mcount"] = "Display the overall stats until map switch"

//sound setting
L["help_sc_revamp_sounds"] = "If it's set on 'true', there is a random 'Game over'-sound played, everytime someone does a suicide."
L["label_sc_revamp_ply_sounds"] = "Start a random sound, when a player kills themselves"