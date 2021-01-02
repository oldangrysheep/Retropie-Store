#!/bin/bash


Version=0.1
echo "$version"
#This is all setup stuff to make sure its all ready
if ! [ -x "$(command -v whiptail)" ]; then
  echo "Just installing Dependancies" 
  sudo apt-get install whiptail -y
  sudo reboot now
fi

if ! [ -x "$(command -v nordvpn)" ]; then
  echo "Just installing Dependancies" 
  sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
  sudo reboot now
fi

if ! [ -x "$(command -v unzip)" ]; then
  echo "Just installing Dependancies" 
  sudo apt-get install unzip -y
  sudo reboot now
fi

# Here We Go! 

Download_All_Roms () {
   echo "Download All Roms"
}

Download_Selected_Systems () {
  echo "Download Selected Systems"
}
  
Download_Specific_Games () {
    echo "Specific Games"
}

Media () { 
  echo "media"
}

Settings () {
  echo "settings"
}

Save_Data () {
  echo "save stuff"
}

About () {
  echo "stuff"
}

#HERE THE FIRST MENU FUNCTIONS END
#SELECTED SYSTEMS MENU
#DOWNLOADS GO INTO /VAR/TMP

Download_All () {
  exit
}

Download_Backround () {
  exit
}

NES () {
  exit
}

SNES () { 
  exit 
}

GB () { 
  exit
 }
 
 GBC () { 
  exit
}

GBA () {
  exit
}

N64 () { 
  exit
}

NDS () {
  exit
}

VIRTUALBOY () {
  exit
}

MEGADRIVE () {
  exit
}

SATURN () {
  exit 
}

DREAMCAST () {
  exit
}

PSX () {
  exit
}

PSP () { 
  exit
}

3DO () {
  exit
}

INTELEVISION () {
  exit
}

AMIGA () {
  exit
}

APPLE2 () {
  exit
}

ATARI2600 () {
  exit
}

ATARI5200 () {
  exit
}

ATARI7800 () {
  exit
}

ATARILYNX () {
  exit
}

C64 () {
  exit
}

COLECO () {
  exit
}

FDS () {
  exit
}

GAMEANDWATCH () {
  exit
}

GAMEGEAR () {
  exit
}

LOVE () {
  exit 
}

MAC () {
  exit
}

MOTO () {
  exit
}

MSX () {
  exit
}

NDSI () {
  exit
}

NGPC () {
  exit
}

ORIC () {
  exit
}

SAMECOUPE () {
  exit
}
SG1000 () {
  exit
}

TRS80 () {
  exit
}

VECTREX () {
  exit
}

VIDEOPAC () {
  exit
}

WONDERSWAN () {
  exit
}

WONDERSWANCOLOR () {
  exit
}

X68000 () {
  exit
}

ZMACHINE () {
  exit
}

#Specific Games Menu
#This is where you can select what games you want (i can copy paste the stuff before and replace when i need to


NES () {
  exit
}

SNES () { 
  exit 
}

GB () { 
  exit 
 }
 
 GBC () { 
  exit
}

GBA () {
  exit
}

N64 () { 
  exit
}

NDS () {
  exit
}

VIRTUALBOY () {
  exit
}

MEGADRIVE () {
  exit
}

SATURN () {
  exit 
}

DREAMCAST () {
  exit
}

PSX () {
  exit
}

PSP () { 
  exit
}

3DO () {
  exit
}

INTELEVISION () {
  exit
}

AMIGA () {
  exit
}

APPLE2 () {
  exit
}

ATARI2600 () {
  exit
}

ATARI5200 () {
  exit
}

ATARI7800 () {
  exit
}

ATARILYNX () {
  exit
}

C64 () {
  exit
}

COLECO () {
  exit
}

FDS () {
  exit
}

GAMEANDWATCH () {
  exit
}

GAMEGEAR () {
  exit
}

LOVE () {
  exit 
}

MAC () {
  exit
}

MOTO () {
  exit
}

MSX () {
  exit
}

NDSI () {
  exit
}

NGPC () {
  exit
}

ORIC () {
  exit
}

SAMECOUPE () {
  exit
}
SG1000 () {
  exit
}

TRS80 () {
  exit
}

VECTREX () {
  exit
}

VIDEOPAC () {
  exit
}

WONDERSWAN () {
  exit
}

WONDERSWANCOLOR () {
  exit
}

X68000 () {
  exit
}

ZMACHINE () {
  exit
}

#this is where i do the media stuff

Stream () {
  exit
}

Download () {
  exit
}

#I know this it isnt fully done yet so oopsie
#Settings

Nordvpn_Login () {
  exit
}

Nordvpn_Connect () {
  exit
}

Nordvpn_Disconnect () {
  exit
}

SetDownloadLocation () {
  exit
}

#Sava Data Stuff

Backup_all () {
  exit
}

Restore_All () {
  exit
}

#About

About () {
  exit
}


#Setup
#load loading screen with this sudo apt-get -y install fbi


wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo "Online"
else
    whiptail --title "Internet Connection Not Availible" --msgbox "You appear to be offline. Please connect to wifi and try again." 8 78
fi

#Menu

function advancedMenu {
    ADVSEL=$(whiptail --title "RetroPie Rom Settings" --menu "Choose an option" 15 60 4 \
        "1" "Download All Roms (Not Recomended 100+ Gigabytes)" \
        "2" "Select Roms and Download" \
        "3" "Download Specfic Games" \
        "4" "Media Library" \
        "5" "Settings" \
        "6" "Save Data" \
        "7" "About" \
  	"8" "Update" \
        "9" "exit" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
        exit
        ;;
        2)
        exit
        ;;
        3)
        exit
        ;;
        4) 
        exit
        ;;
        5) 
        exit
	;;
       	6)
        exit
        ;;
        7) 
        exit
        ;;
      	8)
        exit
      	;;
        9)
        exit
        ;;
        
    esac
}
advancedMenu

exit

   
