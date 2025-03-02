#!/bin/bash
#                                                             ,        ,
#                                                            ,        ,
#made by  vituwc                                            /(        )`                                  
#script basico, apenas para testar meus conhecimentos       \ \___   / |                                  
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

RESET='\033[0m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'

instalacao="${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Instalação iniciada. Isso pode demorar um pouco. (^_^)${RESET}"
instalacao_concluida="${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Instalação concluída com sucesso! Voltando ao menu inicial...(^.^)${RESET}"

file="/etc/apt/sources.list"

# verifica se o script esta sendo executado como root ($.$)($.$)($.$)($.$)sudoooooooooooooooo
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${BLUE}[ ${YELLOW}! ${BLUE}]${RED} Esse programa deve ser executado como root!${RESET}"
    exit 1
fi
# essa aqui limpa e editao sources.list. [o_o]
# Tem que melhorar isso pq meu deus  (".")
editar_sources_list() {
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "${BLUE}[ ${YELLOW} 1! ${BLUE}]${RED} Esse programa deve ser executado como root!${RESET}"
        exit 1
    fi

    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Limpando o arquivo /etc/apt/sources.list...${RESET}"
    sudo truncate -s 0 /etc/apt/sources.list

    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Adicionando repositório do Kali Linux ao sources.list...${RESET}"
    echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list > /dev/null

    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Atualizando os pacotes...${RESET}"
    sudo apt-get update -q

    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Repositório do Kali adicionado e pacotes atualizados com sucesso!${RESET}"
}
# essa funcao verifica se as dependencias necessarias entao instaladas (^_^)
verifica_dependencias() {
    dependencias=("apt" "curl" "wget" "git")  

    for pacote in "${dependencias[@]}"; do
        if ! command -v "$pacote" &>/dev/null; then
            echo -e "${RED}[${YELLOW}! ${RED}] Pacote $pacote não encontrado. Instalando...${RESET}"
            sudo apt install -y "$pacote"
        else
            echo -e "${GREEN}[${YELLOW}+ ${GREEN}] Pacote $pacote já está instalado.${RESET}"
        fi
    done
}

# pretendo mudar a cor do banner. ficou mt ruimmmm
# vou fazer um efeito fade azul. mas to com preguiça agora xD
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

    echo -e "
    [1] Conjuntos de ferramentas do Kali
    [2] Personalização
    [3] Configurar sistema para português
    [4] Sair
    "

    echo -e "${GREEN}[${YELLOW} + ${GREEN}] Selecione a sua escolha abaixo: "
    read escolha
}

menu_ferramentas()
{
    clear
    echo -e "
[1] Kali Linux Padrao
[2] Kali Linux All Tools
[3] Kali Linux Penetration Testing Tools
[4] Kali Linux Wireless Tools
[5] Kali Linux Web Tools
[6] Kali Linux Forensics Tools
[M] Menu
"
    echo -n "${GREEN}[${YELLOW} + ${GREEN}] Selecione os conjuntos de ferramentas que deseja baixar: "
    read escolha2

    case $escolha2 in
        1) sudo apt install kali-linux-default ;;
        2) sudo apt install kali-linux-everything ;;
        3) sudo apt install kali-tools-vulnerability ;;
        4) sudo apt install kali-tools-wireless ;;
        5) sudo apt install kali-tools-web ;;
        6) sudo apt install kali-tools-forensics ;;
        M|m) echo "Voltando ao menu principal..." ;;
        *) echo -e "${BLUE}[ ${YELLOW} ! ${BLUE}]${RED} Opção inválida!${RESET}" ;;
    esac
}

menu_personalizacao()
{
    clear
    echo -n "${GREEN}[${YELLOW} + ${GREEN}] Selecione a opção desejada: "
    echo "${RED}[${YELLOW} ! ${RED}] Caso não saiba o que são DEs: https://wiki.archlinux.org/title/Desktop_environment"

    echo -e "
DESKTOP ENVIRONMENTS (DEs)     Terminais
[1] Kali Desktop Core          [5] Kitty
[2] XFCE (Padrão do Kali)      [6] Terminator
[3] GNOME                      [7] Konsole
[4] KDE                        [M] Menu
"

    read -r escolha3
    case $escolha3 in
        1) sudo apt install kali-desktop-core ;;
        2) sudo apt install kali-desktop-xfce ;;
        3) sudo apt install kali-desktop-gnome ;;
        4) sudo apt install kali-desktop-kde ;;
        5) sudo apt install kitty ;;
        6) sudo apt install terminator ;;
        7) sudo apt install konsole ;;
        M|m) echo "${GREEN}[${YELLOW}+ ${GREEN}] Voltando ao menu principal..." ;;
        *) echo -e "${BLUE}[ ${YELLOW}! ${BLUE}]${RED} Opção inválida!${RESET}" ;;
    esac
}

idioma_sistema()
{
    clear
    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Configurando o sistema para português...${RESET}"

    echo "${GREEN}[${YELLOW} + ${GREEN}] Configurando o idioma para pt_BR.UTF-8..."
    sudo locale-gen pt_BR.UTF-8
    sudo update-locale LANG=pt_BR.UTF-8 LC_ALL=pt_BR.UTF-8
    
    echo "${GREEN}[${YELLOW} + ${GREEN}] Definindo o teclado para ABNT2..."
    sudo localectl set-x11-keymap br abnt2
    
    echo "${GREEN}[${YELLOW} + ${GREEN}] Definindo o fuso horário para Brasília..."
    sudo timedatectl set-timezone America/Sao_Paulo
    
    echo "${GREEN}[${YELLOW} + ${GREEN}] Definindo a localidade do sistema..."
    sudo localectl set-locale LANG=pt_BR.UTF-8
    
    sudo dpkg-reconfigure --frontend noninteractive locales
    
    echo -e "${BLUE}[${YELLOW} + ${BLUE}]${GREEN} Configuração concluída! Reinicie o sistema para aplicar as mudanças.${RESET}"
}

    editar_sources_list
    verifica_dependencias


# menu principal(obvio)
# pretendo adicionar mais coisas... ou nao kk :^)


while true; do
    menu_principal
    case $escolha in
        1) menu_ferramentas ;;
        2) menu_personalizacao ;;
        3) idioma_sistema ;;
        4) clear; echo "Saindo..."; exit 0 ;;
        *) echo -e "${BLUE}[ ${YELLOW} ! ${BLUE}]${RED} Opção inválida!${RESET}" ;;
    esac    

    echo -e "${BLUE}[ ${YELLOW} ? ${BLUE}]${GREEN} Deseja voltar ao menu? (S/N)${RESET}"
    read -r voltar
    if [[ ! "$voltar" =~ ^[Ss]$ ]]; then
        break
    fi
done