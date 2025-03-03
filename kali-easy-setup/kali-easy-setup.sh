#!/bin/bash
#                                                             ,        ,
#                                                            ,        ,
#made by vituwc                                             /(        )`                                  
#basic script, just to test my knowledge                    \ \___   / |                                  
#https://github.com/vituwc                                 /- _  `-/  '                                  
#It's not about being good. It's about being good enough. (/\/ \ \   /\                                  
#                                                        / /   | `    \                                
#                                                        O O   ) /    |                                 
#                                                        `-^--'`<     '                                
#                                                        (_.)  _  )   /                                   
#                                                        `.___/`    /                                     
#                                                          `-----' /                                      
#                                                <----.     __ / __ \                                     
#                                                <----|====O)))==) \)====                                 
#                                                <----'    `--' `.__,\                                    
#                                                            |        |                                  
#                                                            \       /                                   
#                                                        ______( (_  / \______                            
#                                                    ,'  ,-----'   |        \                          
#                                                    `--{__________)        \/ 

RESET='\033[0m'  # Reset color formatting
RED='\033[1;31m'  # Red color
GREEN='\033[1;32m'  # Green color
YELLOW='\033[1;33m'  # Yellow color
BLUE='\033[1;34m'  # Blue color

# Installation status messages
instalacao="${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Installation started. This may take a while. (^_^)${RESET}"
instalacao_concluida="${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Installation completed successfully! Returning to the main menu...(^.^)${RESET}"

file="/etc/apt/sources.list"

# Check if the script is being executed as root (root privileges are required)
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${BLUE}[ ${YELLOW}! ${BLUE}]${RED} This program must be run as root!${RESET}"
    exit 1
fi

# Function to edit and clean the sources.list file
editar_sources_list() {
    # Check again if the script is run as root
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "${BLUE}[ ${YELLOW} 1! ${BLUE}]${RED} This program must be run as root!${RESET}"
        exit 1
    fi

    # Clear the /etc/apt/sources.list file
    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Cleaning the /etc/apt/sources.list file...${RESET}"
    sudo truncate -s 0 /etc/apt/sources.list

    # Add Kali Linux repository to the sources.list file
    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Adding Kali Linux repository to the sources.list...${RESET}"
    echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list > /dev/null

    # Update packages from the added repository
    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Updating packages...${RESET}"
    sudo apt-get update -q

    # Confirm repository added and packages updated
    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Kali repository added and packages updated successfully!${RESET}"
}

# Function to check and install necessary dependencies (if not installed)
verifica_dependencias() {
    # List of required packages
    dependencias=("apt" "curl" "wget" "git")  

    # Loop through each dependency and check if it is installed
    for pacote in "${dependencias[@]}"; do
        if ! command -v "$pacote" &>/dev/null; then
            # If not installed, install the package
            echo -e "${RED}[${YELLOW}! ${RED}] Package $pacote not found. Installing...${RESET}"
            sudo apt install -y "$pacote"
        else
            # If already installed, confirm
            echo -e "${GREEN}[${YELLOW}+ ${GREEN}] Package $pacote is already installed.${RESET}"
        fi
    done
}

# Main menu function
menu_principal()
{
    clear
    echo -e "${BLUE}
    ██╗  ██╗ █████╗ ██╗     ██╗███╗   ███╗ █████╗ ████████╗███████╗
    ██║ ██╔╝██╔══██╗██║     ██║████╗ ████║██╔══██╗╚══██╔══╝██╔════╝
    █████╔╝ ███████║██║     ██║██╔████╔██║███████║   ██║   █████╗  
    ██╔═██╗ ██╔══██║██║     ██║██║╚██╔╝██║██╔══██║   ██║   ██╔══╝  
    ██║  ██╗██║  ██║███████╗██║██║ ╚═╝ ██║██║  ██║   ██║   ███████╗
    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
                                                                ${RESET}"

    # List options in the main menu
    echo -e "
    [1] Kali Tools Sets
    [2] Customization
    [3] Configure system for Portuguese
    [4] Exit
    "

    # Prompt user for their choice
    echo -e "${GREEN}[${YELLOW} + ${GREEN}] Select your choice below: "
    read escolha
}

# Menu for selecting Kali Linux tools
menu_ferramentas()
{
    clear
    echo -e "
[1] Kali Linux Default Tools
[2] Kali Linux All Tools
[3] Kali Linux Penetration Testing Tools
[4] Kali Linux Wireless Tools
[5] Kali Linux Web Tools
[6] Kali Linux Forensics Tools
[M] Menu
"
    echo -n "${GREEN}[${YELLOW} + ${GREEN}] Select the tools you want to download: "
    read escolha2

    # Execute installation based on user's choice
    case $escolha2 in
        1) sudo apt install kali-linux-default ;;
        2) sudo apt install kali-linux-everything ;;
        3) sudo apt install kali-tools-vulnerability ;;
        4) sudo apt install kali-tools-wireless ;;
        5) sudo apt install kali-tools-web ;;
        6) sudo apt install kali-tools-forensics ;;
        M|m) echo "Returning to the main menu..." ;;
        *) echo -e "${BLUE}[ ${YELLOW} ! ${BLUE}]${RED} Invalid option!${RESET}" ;;
    esac
}

# Customization menu for selecting Desktop Environments and Terminals
menu_personalizacao()
{
    clear
    echo -n "${GREEN}[${YELLOW} + ${GREEN}] Select the desired option: "
    echo "${RED}[${YELLOW} ! ${RED}] If you don't know what DEs are: https://wiki.archlinux.org/title/Desktop_environment"

    echo -e "
DESKTOP ENVIRONMENTS (DEs)     Terminals
[1] Kali Desktop Core          [5] Kitty
[2] XFCE (Kali default)        [6] Terminator
[3] GNOME                      [7] Konsole
[4] KDE                        [M] Menu
"

    read -r escolha3
    # Install the selected desktop environment or terminal
    case $escolha3 in
        1) sudo apt install kali-desktop-core ;;
        2) sudo apt install kali-desktop-xfce ;;
        3) sudo apt install kali-desktop-gnome ;;
        4) sudo apt install kali-desktop-kde ;;
        5) sudo apt install kitty ;;
        6) sudo apt install terminator ;;
        7) sudo apt install konsole ;;
        M|m) echo "${GREEN}[${YELLOW}+ ${GREEN}] Returning to the main menu..." ;;
        *) echo -e "${BLUE}[ ${YELLOW}! ${BLUE}]${RED} Invalid option!${RESET}" ;;
    esac
}

# Function to configure system language and settings for Portuguese
idioma_sistema()
{
    clear
    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Configuring the system for Portuguese...${RESET}"

    # Set language to Portuguese (pt_BR.UTF-8)
    echo "${GREEN}[${YELLOW} + ${GREEN}] Setting language to pt_BR.UTF-8..."
    sudo locale-gen pt_BR.UTF-8
    sudo update-locale LANG=pt_BR.UTF-8 LC_ALL=pt_BR.UTF-8
    
    # Set keyboard layout to ABNT2 (Brazilian layout)
    echo "${GREEN}[${YELLOW} + ${GREEN}] Setting keyboard layout to ABNT2..."
    sudo localectl set-x11-keymap br abnt2
    
    # Set timezone to São Paulo (Brazil)
    echo "${GREEN}[${YELLOW} + ${GREEN}] Setting timezone to São Paulo..."
    sudo timedatectl set-timezone America/Sao_Paulo
