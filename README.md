Script Bash: Resolución del Nivel 12 de OverTheWire Bandit

Este script en Bash automatiza la resolución del nivel 12 del wargame OverTheWire Bandit, donde la contraseña está oculta en un archivo data.txt que contiene un volcado hexadecimal de un archivo comprimido repetidamente. El script descompone este proceso de forma automatizada y eficiente.


🔧 Requisitos

    7-Zip instalado en el sistema

    moreutils instalado para utilizar el comando sponge

    

📁 Instalación

  Clona este repositorio en tu máquina local:

    git clone https://github.com/BULL3TTT/Bandit12-script.git



Asegúrate de que el script sea ejecutable:

    chmod +x decompress.sh



Ejecuta el script:

    ./decompress.sh

🧪 Funcionamiento

El script realiza las siguientes acciones:

  -Reversión del volcado hexadecimal: Utiliza xxd -r para revertir el volcado hexadecimal del archivo data.txt a su formato binario original.

  -Renombrado del archivo: Cambia el nombre del archivo revertido a hex.gz para prepararlo para la descompresión.

  -Extracción recursiva: Utiliza 7z l para listar los contenidos del archivo comprimido y 7z x para extraer el siguiente archivo comprimido en la cadena, repitiendo este      proceso hasta llegar al archivo final que contiene la contraseña.

  -Recuperación de la contraseña: Una vez extraído el archivo final, lee su contenido y extrae la última palabra, que se asume es la contraseña.

  -Limpieza: Elimina archivos temporales con extensión .bin y los archivos data2 y data6 generados durante el proceso de extracción.

  -Salida: Muestra la contraseña recuperada en la terminal y la guarda en un archivo de texto llamado Banditpasswd.
