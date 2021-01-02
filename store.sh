#!/bin/sh

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

#Setup


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
        "9" "Exit" 3>&1 1>&2 2>&3)
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

   
