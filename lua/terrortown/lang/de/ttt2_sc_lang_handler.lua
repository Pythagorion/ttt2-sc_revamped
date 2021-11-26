local L = LANG.GetLanguageTableReference("de")

//show that one died
L["ttt2_sc_show_no_name"] = "Jemand hat sich selber umgenietet! Herzlichen Glückwunsch!"
L["ttt2_sc_show_a_name"] = "{deadply} hat sich selber umgenietet! Herzlichen Glückwunsch!"

//print statics
L["ttt2_sc_show_all"] = "Deren persönliche Statistik sind {pcount} Suizide \n\nDie Gesamtstatistik dieser Map sind {mapcount} Suizide"
L["ttt2_sc_show_persn"] = "Deren persönliche Statistik sind {pcount} Suizide"
L["ttt2_sc_show_map"] = "Die Gesamtstatistik dieser Map sind {mapcount} Suizide"

//F1 Menu labels - and msg options
L["submenu_addons_sc_revamp_title"] = "Suizid-Zähler"
L["header_addons_sc_revamp"] = "Allgemeine Einstellungen"

L["help_sc_revamp_msgs"] = "Die folgenden beiden ConVars steuern, wie die Meldungen des Zählers angezeigt werden sollen. MSTACK-Meldungen sind die Popups, die in der oberen rechten Ecke angezeigt werden. \n\nEPOPs sind die Meldungen in der Mitte des Bildschirms."
L["label_sc_revamp_mstack"] = "Zeige Zähler durch MSTACK-Meldungen an"
L["label_sc_revamp_epop"] = "Zeige Zähler durch EPOPs an"

//announcement option
L["help_sc_revamp_announce"] = "Wenn dieser Wert auf 'true' steht, werden keine Namen angezeigt. Alles geschieht anonym."
L["label_sc_revamp_anon_announce"] = "Alle Informationen auf Anonymität setzen"

//counter settings
L["help_sc_revamp_counts"] = "Der Zähler zählt zwei verschiedene Arten von Statistiken. Die persönlichen Statistiken sind die Tode eines jeden Spielers und werden für jeden Spieler einzeln gezählt. Die Kartenstatistiken sind die Gesamtstatistiken aller Spieler bis zum nächsten Kartenwechsel."
L["label_sc_revamp_pcount"] = "Zeige die persönlichen Statistiken an"
L["label_sc_revamp_mcount"] = "Zeige die Gesamtstatistiken bis zum nächsten Kartenwechsel an"

//sound setting
L["help_sc_revamp_sounds"] = "Wenn dieser Wert auf 'true' steht, wird jedes Mal ein zufälliger 'Game over'-Sound abgespielt, wenn jemand Selbstmord begeht."
L["label_sc_revamp_ply_sounds"] = "Startet einen zufälligen Sound, wenn ein Spieler sich selbst tötet"