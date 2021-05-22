#!/bin/bash
#This is all setup stuff to make sure its all ready
#Command is located in /usr/bin/"Retropie Store"
#VERSION 0.514 BETA
sudo echo "Version .514 BETA"

sudo apt --fix-broken install
if ! [ -x "$(command -v whiptail)" ]; then
  echo "Just installing Dependancies" 
  sudo apt-get install whiptail -y
fi

if ! [ -x "$(command -v nordvpn)" ]; then
  echo "Just installing Dependancies" 
  sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh) -y
fi

if ! [ -x "$(command -v unzip)" ]; then
  echo "Just installing Dependancies" 
  sudo apt-get install unzip -y
fi

cleanup () {
  cd /usr/bin/'Retropie Store'
  sudo rm -r temp
}

# Basic Stuff

Download_All_Roms () {
    ADVSEL=$(whiptail --title "Download All Roms" --menu "Choose an option" 25 78 16 \
        "1" "Download in backround" \
        "2" "Download here" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
        Download_All_Roms
        ;;
        2)
        Download_Selected_Systems
		
        ;;
    esac
}
Download_Selected_Systems () {
    ADVSEL=$(whiptail --title "Decide What Systems You Want" --menu "Choose an option" 25 78 16 \
	"1" "Download All Selected" \
        "2" "Nintendo Entertainment System" \
        "3" "Super Nintendo Entertainemnt System" \
        "4" "Gameboy" \
        "5" "Gameboy Color" \
        "6" "Gameboy Advanced" \
        "7" "Nintendo 64" \
        "8" "Nintendo Ds" \
        "9" "Nintendo Virtual Boy" \
        "10" "Megadrive Games" \
        "11" "Sega Saturn" \
        "12" "Sega Dreamcast" \
        "13" "Playstation 1" \
        "14" "Playstation Portable" \
        "15" "3do (1993) " \
	"16" "Nintendo DSI" \
	"17" "Intellivision" \
	"18" "Philips CD-i" \
	"19" "Amiga" \
	"20" "Apple 2 Computers" \
	"21" "Atari 2600" \
	"22" "Atarti 5200" \
	"23" "Atari 7800" \
	"24" "Atari Lynx" \
	"25" "Commodore 64" \
	"26" "Coleco" \
	"27" "Famicon Disk System" \
	"28" "Game And Watch" \
	"29" "GameGear" \
	"30" "Löve" \
	"31" "Macintosh" \
	"32" "MSX" \
	"33" "Neo Geo Pocket Color" \
	"34" "Oric" \
	"35" "SameCoupe" \
	"36" "SG-1000" \
	"37" "Wonderswan" \
	"38" "Wonderswan Color" \
	"39" "ScummVM" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            if (whiptail --title "Are You Sure?" --yes-button "Download" --yesno "Yes Will Download, No Will Bring You Back To The Menu." 10 60) then
	    cd /usr/bin/'Retropie Store'/temp
    sudo wget -r -H -nc -np -nH --cut-dirs=1 -e robots=off -l1 -i ./itemlist.txt -B 'http://archive.org/download/'
    for i in {1..100}; do
   echo $i
   sleep 0.1
done | whiptail --gauge "Extracting Files ..." 10 50 0
cd /usr/bin/'Retropie Store'/temp/gb_20201207/'Complete Rom Sets'
    sudo unzip '*.zip'
    sudo rm -r *.zip
    sudo cp -a /usr/bin/'Retropie Store'/temp/gb_20201207/'Complete Rom Sets'/* /home/pi/RetroPie/roms/
    whiptail --title "Your Downloads Are Done" --msgbox "Please restart emulation station to see the games." 8 45
    cd /usr/bin/'Retropie Store'
    mainmenu
else
    Download_Selected_Systems
fi   
        ;;
        2)
	cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/snes.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        3)
	cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gb.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        4)
	cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gbc.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        5)
	cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gba.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        6)
	    cd /usr/bin/'Retropie Store'/temp
		echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/n64.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        7)
	cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/nds.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        8)
	cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/virtualboy.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        9)
	cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/megadrive.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        10)
	cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/games/saturn.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        11)
	    cd /usr/bin/'Retropie Store'/temp
            Download_Selected_Systems
        ;;
        12)
	    cd /usr/bin/'Retropie Store'/temp
		echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/psx.zip"  >> itemlist.txt
            Download_Selected_Systems
        ;;
        13)
	    cd /usr/bin/'Retropie Store'/temp
		echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/psp.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        14)
	exit
        ;;
    esac
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
  whiptail --title "About the RetroPie Store" --msgbox "Hello (づ｡◕‿‿◕｡)づ This store is to help get new roms for RetroPie and automatically install them" 8 78
}

Update () {
  echo "Update"
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
    exit
fi

#replace this with auto update soon
cd /usr/bin
sudo mkdir  -p "Retropie Store"
cd /usr/bin/'Retropie Store'
sudo rm -r *
sudo wget https://raw.githubusercontent.com/oldangrysheep/Retropie-Store/main/store.sh
sudo chmod +x store.sh

#Menu
mainmenu () {
    ADVSEL=$(whiptail --title "RetroPie Rom Settings" --menu "Choose an option" 25 78 16 \
        "1" "Download All Roms (Not recomended unless you have 5T+ Space)" \
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
		whiptail --title "Internet Connection Not Availible" --msgbox "Not Availble Yet" 8 78
		mainmenu
        ;;
        2)
       	sudo mkdir -p /usr/bin/'Retropie Store'/temp
	cd /usr/bin/'Retropie Store'/temp
	Download_Selected_Systems
		whiptail --title "Internet Connection Not Availible" --msgbox "Not Availble Yet" 8 78
		mainmenu
        ;;
        3)
        Download_Specific_Games
		whiptail --title "Internet Connection Not Availible" --msgbox "Not Availble Yet" 8 78
		mainmenu
        ;;
        4) 
        Media
		whiptail --title "Internet Connection Not Availible" --msgbox "Not Availble Yet" 8 78
		mainmenu
        ;;
        5) 
        Settings
		whiptail --title "Internet Connection Not Availible" --msgbox "Not Availble Yet" 8 78
		mainmenu
	;;
       	6)
        Save_Data
		whiptail --title "Internet Connection Not Availible" --msgbox "Not Availble Yet" 8 78
		mainmenu
        ;;
        7) 
        About
        ;;
      	8)
        Update
		
      	;;
        9)
        exit
        ;;
    esac
}
mainmenu
cleanup

