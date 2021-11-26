CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"
CLGAMEMODESUBMENU.title = "submenu_addons_sc_revamp_title"

function CLGAMEMODESUBMENU:Populate(parent)
    local form = vgui.CreateTTT2Form(parent, "header_addons_sc_revamp")

    form:MakeHelp({
        label = "help_sc_revamp_msgs"
    })

    form:MakeCheckBox({
        label = "label_sc_revamp_mstack",
        serverConvar = "ttt2_sc_use_mstack_msgs"
    })

    form:MakeCheckBox({
        label = "label_sc_revamp_epop",
        serverConvar = "ttt2_sc_use_epop_msgs"
    })

    form:MakeHelp({
        label = "help_sc_revamp_announce"
    })

    form:MakeCheckBox({
        label = "label_sc_revamp_anon_announce",
        serverConvar = "ttt2_sc_anon_announcement"
    })

    form:MakeHelp({
        label = "help_sc_revamp_counts"
    })

    form:MakeCheckBox({
        label = "label_sc_revamp_pcount",
        serverConvar = "ttt2_sc_personal_count"
    })

    form:MakeCheckBox({
        label = "label_sc_revamp_mcount",
        serverConvar = "ttt2_sc_map_count"
    })

    form:MakeHelp({
        label = "help_sc_revamp_sounds"
    })

    form:MakeCheckBox({
        label = "label_sc_revamp_ply_sounds",
        serverConvar = "ttt2_sc_play_sound"
    })
end