#!/bin/bash
#This is all setup stuff to make sure its all ready
#Command is located in /usr/bin/"Retropie Store"
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
  exit
}

# Here We Go! 

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
    ADVSEL=$(whiptail --title "Decide What Systems You Want" --menu "Choose an option" 15 60 4 \
        "1" "Nintendo Entertainment System" \
        "2" "Super Nintendo Entertainemnt System" \
        "3" "Gameboy" \
        "4" "Gameboy Color" \
        "5" "Gameboy Advanced" \
        "6" "Nintendo 64" \
        "7" "Nintendo Ds" \
        "8" "Nintendo Virtual Boy" \
        "9" "Megadrive Games" \
        "10" "Sega Saturn" \
        "11" "Sega Dreamcast" \
        "12" "Playstation 1" \
        "13" "Playstation Portable" \
        "14" "Download All Selected" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/nes.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        2)
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/snes.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        3)
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gb.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        4)
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gbc.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        5)
            echo "https://archive.org/download/gb_20201207/games/gba.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        6)
            exit
        ;;
        7)
            echo "https://archive.org/download/gb_20201207/games/nds.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        8)
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/virtualboy.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        9)
            echo "https://archive.org/download/gb_20201207/games/megadrive.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        10)
            echo "https://archive.org/download/gb_20201207/games/saturn.zip" >> itemlist.txt
            sudo sh ./decide.sh
        ;;
        11)
            exit
        ;;
        12)
            exit
        ;;
        13)
            exit
        ;;
        14)
            if (whiptail --title "Are You Sure?" --yes-button "Download" --yesno "Yes Will Download, No Will Bring You Back To The Menu." 10 60) then
    sudo wget -r -H -nc -np -nH --cut-dirs=1 -e robots=off -l1 -i ./itemlist.txt -B 'http://archive.org/download/'
    cd /usr/bin/RomDownloader/Temp/gb_20201207/games
    for i in {1..100}; do
   echo $i
   sleep 0.1
done | whiptail --gauge "Extracting Files ..." 10 50 0
    sudo unzip '*.zip'
    sudo rm -r *.zip
    sudo cp -a /usr/bin/RomDownloader/Temp/gb_20201207/games/* cd /home/pi/RetroPie/roms/
    whiptail --title "Your Downloads Are Done" --msgbox "Please restart emulation station to see the games." 8 45
    cd /usr/bin/RomDownloader/Temp
else
    sudo sh ./decide.sh
fi
            
            
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
  echo "stuff"
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
		whiptail --title "Internet Connection Not Availible" --msgbox "Not Availble Yet" 8 78
		mainmenu
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

