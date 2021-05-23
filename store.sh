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
	"2" "Exit To Main Menu" \
	"3" "Nintendo Entertainment System" \
        "4" "Super Nintendo Entertainemnt System" \
        "5" "Gameboy" \
        "6" "Gameboy Color" \
        "7" "Gameboy Advanced" \
        "8" "Nintendo 64" \
        "9" "Nintendo Ds" \
        "10" "Nintendo Virtual Boy" \
        "11" "Megadrive Games" \
        "12" "Sega Saturn" \
        "13" "Sega Dreamcast" \
        "14" "Playstation 1" \
        "15" "Playstation Portable" \
        "16" "3do (1993) " \
	"17" "Nintendo DSI" \
	"18" "Intellivision" \
	"19" "Philips CD-i" \
	"20" "Amiga" \
	"21" "Apple 2 Computers" \
	"22" "Atari 2600" \
	"23" "Atarti 5200" \
	"24" "Atari 7800" \
	"25" "Atari Lynx" \
	"26" "Commodore 64" \
	"27" "Coleco" \
	"28" "Famicon Disk System" \
	"29" "Game And Watch" \
	"30" "GameGear" \
	"31" "Löve" \
	"32" "Macintosh" \
	"33" "MSX" \
	"34" "Neo Geo Pocket Color" \
	"35" "Oric" \
	"36" "SameCoupe" \
	"37" "SG-1000" \
	"38" "Wonderswan" \
	"39" "Wonderswan Color" \
	"40 " "ScummVM" 3>&1 1>&2 2>&3)
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
	mainmenu
        ;;
        3)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/nes.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        4)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/snes.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        5)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gb.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        6)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gbc.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        7)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gba.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        8)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/n64.zip.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        9)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/nds.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        10)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/virtualboy.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        11)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/megadrive.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
        12)
	    cd /usr/bin/'Retropie Store'/temp
            echo "lol saturn isnt done yet"
            Download_Selected_Systems
        ;;
        13)
	    cd /usr/bin/'Retropie Store'/temp
            echo "uh oh dreamcast aint done yet :o"
            Download_Selected_Systems
        ;;
        14)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/psx.zip" >> itemlist.txt
            Download_Selected_Systems
        ;;
	15)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/psp.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	16)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/3do.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	17)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/ndsi.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	18)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/Intellivision.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	19)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/Philips%20CD-i.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	20)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/amiga.zip.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	21)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/apple2.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	22)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/atari2600.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	23)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/atari5200.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	24)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/atari7800.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	25)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/atarilynx.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	26)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/c64.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	27)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/coleco.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	28)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/fds.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	29)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gameandwatch.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	30)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/gamegear.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	31)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/love.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	32)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/macintosh.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	33)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/msx.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	34)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/ngpc.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	35) 
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/oric.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	36)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/samecoupe.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	37)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/sg-1000.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	38)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/wonderswan.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	39)
	    cd /usr/bin/'Retropie Store'/temp
            echo "https://archive.org/download/gb_20201207/Complete%20Rom%20Sets/wonderswancolor.zip" >> itemlist.txt
            Download_Selected_Systems
	;;
	40)
	    cd /usr/bin/'Retropie Store'/temp
            echo "lol scummvm not here yet"
            Download_Selected_Systems
	;;
    esac
}
  
Download_Specific_Games () {
   ADVSEL=$(whiptail --title "Select The System You Want To Select The Games From" --menu "Choose an option" 15 60 4 \
        "1" "Download All Selected" \
        "2" "Download Selected In Backround" \
        "3" "Nintendo Entertainment System" \
        "4" "Super Nintendo Entertainemnt System" \
        "5" "Gameboy" \
        "6" "Gameboy Color" \
        "7" "Gameboy Advanced" \
        "8" "Nintendo 64" \
        "9" "Nintendo Ds" \
        "10" "Nintendo Virtual Boy" \
        "11" "Megadrive Games" \
        "12" "Sega Saturn" \
        "13" "Sega Dreamcast" \
        "14" "Playstation 1" \
        "15" "Playstation Portable" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/Download%20The%20Items%20You%20Selected.sh
            sudo chmod +x "Download The Items You Selected.sh"
            sudo sh "Download The Items You Selected.sh"
            whiptail --title "Downloads Complete" --msgbox "Click Exit On The Main Menu Then Restart Emulation Station In Order To See Roms" 8 78
            sudo sh downloader.sh
        ;;
        2)
            whiptail --title "Downloads Started" --msgbox "You will now be redirected towards the start menu. To check on the download, select Downloads on the main menu. Dont start this command more than once." 8 78
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/Download%20In%20Backround.sh
            sudo chmod +x "Download In Backround.sh"
            exit
            sudo sh "Download In Backround.sh"
            sudo sh downloader.sh
        ;;
        3)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/nes.sh
            sudo bash ./nes.sh
            sudo rm -r nes.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        4)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/snes.sh
            sudo bash ./snes.sh
            sudo rm -r snes.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        5)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/gb.sh
            sudo bash ./gb.sh
            sudo rm -r gb.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        6)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/gbc.sh
            sudo bash ./gbc.sh
            sudo rm -r gbc.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        7)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/gba.sh
            sudo bash ./gba.sh
            sudo rm -r gba.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        8)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/nes.sh
            sudo bash ./n64.sh
            sudo rm -r nes.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        9)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/nds.sh
            sudo bash ./nds.sh
            sudo rm -r nds.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        10)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/virtualboy.sh
            sudo bash ./virtualboy.sh
            sudo rm -r virtualboy.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        11)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/megadrive.sh
            sudo bash ./megadrive.sh
            sudo rm -r megadrive.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        12)

            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/saturn.sh
            sudo bash ./saturn.sh
            sudo rm -r saturn.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        13)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/dreamcast.sh
            sudo bash ./dreamcast.sh
            sudo rm -r dreamcast.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
        14)
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/psx.sh
            sudo bash ./psx.sh
            sudo rm -r psx.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;  
        15) 
            sudo wget https://raw.githubusercontent.com/oldangrysheep/raspidownloads/main/gui/gameselection/psp.sh
            sudo bash ./psp.sh
            sudo rm -r psp.sh
            cd /usr/bin/RomDownloader/Temp
            sudo sh gamelist.sh
        ;;
    esac
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
        whiptail --title "About the RetroPie Store" --msgbox "Hello (づ｡◕‿‿◕｡)づ This store is to help get new roms for RetroPie and automatically install them" 8 78
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
cleanup

