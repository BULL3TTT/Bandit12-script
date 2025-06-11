#!/bin/bash
#colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
#varible

echo -e "${greenColour}\nEsta es tu direccion IP privada: ${endColour}${turquoiseColour}$(ip a | grep eth0 | tail -n1 | awk '{print$2}' | awk '{print$1}' FS="/")${endColour}\n"

echo -e "${redColour}Mi primer Script en bash${endColour}\n"

echo -e "${purpleColour}Tambien esta es tu IP privada${endColour}${yellowColour}:${endColour} ${blueColour}$(ifconfig | grep inet | awk 'NR==1' | awk '{print$2}')${endColour}"
