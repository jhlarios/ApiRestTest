Instrucciones de instalacion:

Crear una nueva de base de datos en Sql Server 12.0 llamada "ElaniinTest"
Utilizar el script llamado Database.sql y correrlo dentro de la base de datos recien creada
Descargar el archivo del proyecto ApiRestElaniin desde el enlace Github
Abrir el proyecto ApiRestElaniin en Visual Studio (preferible version 2019)
Dentro del proyecto cambiar en el appsetting.json en el apartado de ConnectionStrings la cadena de conexion del DefaultConnection para que apunte a la base de datos "ElaniinTest" que instalo los pasos anteriores
Corra el proyecto desde el visual studio o publiquelo a un Servidor IIS compatible
Para probar reemplazar los principios de las urls (https://host:port/) de las Urls del los servicios por la url del host que vaya a utilizar en su servidor
