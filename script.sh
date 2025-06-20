#!/bin/bash

#Colours by S4vitar repo
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

echo -e "${greenColour}Descomprimiendo archivo data.txt...${endColour}\n\n"

#Lectura de archivo hex, reversion del hex con xxd -r y sobre escritura del output en el mismo archivo
$(cat data.txt | xxd -r | sponge data.txt)

#Cambiamos el nombre para descomprimir 
$(mv data.txt hex.gz)

#Listado de archivo comprimido con 7z , tomamos las ultimas 3 lineas del output y la primer linea del comando anterior, ademas 
#nos quedamos con el ultimo argumento que es el nombre del archivo que debemos descomprimir 
arch1=$(7z l hex.gz | tail -3 | head -1 | awk '{print$NF}')

#Descomprimimos el archivo 
$(7z x hex.gz &> /dev/null)

#Repetimos el mismo procedimiento varias veces hasta obtener la contraseña
arch2=$(7z l $arch1 | tail -3 | head -1 | awk '{print$NF}')
$(7z x $arch1 &> /dev/null)
arch3=$(7z l $arch2 | tail -3 | head -1 | awk '{print$NF}')
$(7z x $arch2 &> /dev/null)
arch4=$(7z l $arch3 | tail -3 | head -1 | awk '{print$NF}')
$(7z x $arch3 &> /dev/null)
arch5=$(7z l $arch4 | tail -3 | head -1 | awk '{print$NF}')
$(7z x $arch4 &> /dev/null)
arch6=$(7z l $arch5 | tail -3 | head -1 | awk '{print$NF}')
$(7z x $arch5 &> /dev/null)
arch7=$(7z l $arch6 | tail -3 | head -1 | awk '{print$NF}')
$(7z x $arch6 &> /dev/null)
arch8=$(7z l $arch7 | tail -3 | head -1 | awk '{print$NF}')
$(7z x $arch7 &> /dev/null)

#Cambiamos el nombre del archivo
$(mv $arch8 Banditpasswd)

#Leemos el archivo renombrado y nos quedamos con el ultimo argumento 
FINAL=$(cat Banditpasswd | awk '{print$NF}')

#Eliminamos los archivos con terminacion .bin y los archivos data2 y data6 
$(rm *.bin data2 data6)

#Imprimos la cotraseña
echo -e "\n${greenColour}La contraseña para Bandit13 es:${endColour} ${blueColour}$FINAL${endColour} \n\n"
echo -e "${greenColour}Tambien puedes encontrarla en el Archivo:${endColour} ${blueColour}Banditpassw${endColour}\n\n\n"

#Mentorias by D4ZC
echo -e "${turquoiseColour}Script by GriZzly${endColour}"
