#!/bin/bash
# License: GPLv3
# Manteiner: Felipe Facundes
# 🖂 playongit@gmail.com
# 﨧 Telegram: @FeFacundes
# 﨧 Telegram Group: https://t.me/winehq_linux
Script_Run=~/.PlayOnGit/scripts/run/"$GN"-run.sh
Custom_Script=`
    zenity \
    --width=600 \
    --height=300 \
    --title='Create your own script, to run your game or other app!' \
    --list --text "(PlayOnGit) Choose the desired base for your script!" \
    --radiolist --column 'Choice' \
    --column 'Base script' \
    TRUE EpicGamesStore \
    FALSE Steam \
    FALSE "Steam and EpicGamesStore" \
    FALSE "Steam, EpicGamesStore and UbisoftConnect" \
    FALSE "Steam, EpicGamesStore and Origin" \
    FALSE UbisoftConnect \
    FALSE Origin \
    FALSE Battle.net \
    FALSE "GOG Galaxy"
`
Get() {
    wget --no-check-certificate --server-response -nc "$@"
}
Get_Base() {
    mkdir -p ~/.PlayOnGit/tmp/
    cd ~/.PlayOnGit/tmp/
    if [ "$Custom_Script" = "EpicGamesStore" ]; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-EpicGamesStore.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-EpicGamesStore.sh
    fi
    if [ "$Custom_Script" = "Steam" ]; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-steam.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-steam.sh
    fi
    if [ "$Custom_Script" = "Steam and EpicGamesStore" ]; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-steam_and_epic.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-steam_and_epic.sh
    fi
    if [ "$Custom_Script" = "Steam, EpicGamesStore and UbisoftConnect" ]; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-Steam_Epic_and_Ubisoft.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-steam_epic_and_ubisoft.sh
    fi
    if [ "$Custom_Script" = "Steam, EpicGamesStore and Origin" ]; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-Steam_Epic_and_Origin.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-steam_epic_and_origin.sh
    fi
    if [ "$Custom_Script" = "UbisoftConnect" ]; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-UbisoftConnect.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-UbisoftConnect.sh
    fi
    if [ "$Custom_Script" = "Origin" ]; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-Origin.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-Origin.sh
    fi
    if [ "$Custom_Script" = "Battle.net" ] ; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-Battlenet.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-Battlenet.sh
    fi
    if [ "$Custom_Script" = "GOG Galaxy" ] ; then
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/base/default-goggalaxy.sh
    Get https://raw.githubusercontent.com/felipefacundes/PS/master/defaults/runs/launcher-default-goggalaxy.sh
    fi
}

Steam_Game_ID() {
    Game_ID=`
    zenity --text="Enter the Steam Game ID.\n\
    Example: 730 is the Counter Strike Global Offensive (CSGO) ID."\
    --entry-text="730" --entry
`
    sed -i "s/1234/$Game_ID/g" launcher-default-stea*.sh
}

Define_Name() {
    Base_Name=`
    zenity --text="Enter the name of the file.\n\
    It may be the name of the game, but no blank spaces.\n\
    Example: ApexLegends" \
    --entry-text="ApexLegends" --entry
`
    Base_Game_Name=`
    zenity --text="Enter the name of the complete game.\n\
    This time, you can have spaces.\nExample: Apex Legends."\
    --entry-text="Apex Legends" --entry
`
    Base_Comment=`
    zenity --text="Enter a comment on the game or app.\n\n\
    Example:\n\
    Apex Legends is a free game of heroes in which legendary competitors fight for glory, fame and fortune at border boundaries."\
    --entry-text="Apex Legends is a free game of heroes ..." --entry
`
    Cust_PNG=`
    zenity \
    --ellipsize \
    --info \
    --text "Choose a <b>PNG</b> image from the game to the Start menu shortcut.\n\
    A board, download the <b>PNG</b> image from the Deviantart site."

    zenity \
    --file-selection \
    --filename="$HOME"/ \
    --text "Choose a PNG image from the game to the Start menu shortcut.\n\
    A board, download the PNG image from the Deviantart site." \
    --title "Choose a PNG image from the\
    game to the Start menu shortcut."
`
    Save_Directory=`
    zenity \
    --ellipsize \
    --info \
    --text "In which <b>directory</b> you want to save the installation script?"

    zenity \
    --file-selection \
    --directory \
    --filename="$HOME"/ \
    --text "In which directory you want to save the installation script?" \
    --title "In which directory you want to save the installation script?"
`
    zenity \
    --ellipsize \
    --info \
    --text "Choose a version of Wine."
    bash <(curl -s https://raw.githubusercontent.com/felipefacundes/PS/master/other_scripts/wine_list.sh)
    if ls ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt > /dev/null 2>&1 ; then
        AWV=`cat launcher-default-*.sh | head -n 17 | grep -i WV= | cut -c 11-99`
        NWV=`cat ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt`
        sed -i "s/$AWV/$NWV/g" *default-*.sh
        rm -f ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    fi

    sed -i "s|Base_Name|$Base_Name|g" *default-*.sh
    sed -i "s|Base Game Name|$Base_Game_Name|g" *default-*.sh
    sed -i "s|Base Comment|$Base_Comment|g" *default-*.sh
    cp -f "$Cust_PNG" "$Save_Directory/$Base_Name".png
    cp -f launcher-default-*.sh "$Save_Directory/$Base_Name"-run.sh
    cp -f default-*.sh "$Save_Directory/$Base_Name".sh
    rm -rf ~/.PlayOnGit/tmp/

    if ls "$Save_Directory/$Base_Name.sh"; then
        zenity --ellipsize --info --text "The file will <b>open</b> for your review."
        xdg-open "$Save_Directory/$Base_Name".sh
        zenity --ellipsize --info --text "To run the file, open the terminal and type:\n\
        <b>bash FileName.sh</b>"
    fi
}

if [ "$Custom_Script" = "EpicGamesStore" ] ; then
    Get_Base
    Define_Name
fi
if [ "$Custom_Script" = "Steam" ] ; then
    Get_Base
    Steam_Game_ID
    Define_Name
fi
if [ "$Custom_Script" = "Steam and EpicGamesStore" ] ; then
    Get_Base
    Steam_Game_ID
    Define_Name
fi
if [ "$Custom_Script" = "Steam, EpicGamesStore and UbisoftConnect" ] ; then
    Get_Base
    Steam_Game_ID
    Define_Name
fi
if [ "$Custom_Script" = "Steam, EpicGamesStore and Origin" ] ; then
    Get_Base
    Steam_Game_ID
    Define_Name
fi
if [ "$Custom_Script" = "UbisoftConnect" ] ; then
    Get_Base
    Define_Name
fi
if [ "$Custom_Script" = "Origin" ] ; then
    Get_Base
    Define_Name
fi
if [ "$Custom_Script" = "Battle.net" ] ; then
    Get_Base
    Define_Name
fi
if [ "$Custom_Script" = "GOG Galaxy" ] ; then
    Get_Base
    Define_Name
fi
