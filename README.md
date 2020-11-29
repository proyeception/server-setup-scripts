# server-setup-scripts

scripts varios de configuracion de entorno de servidores para el proyecto de Proyeception

## Arraque

El propósito de estos scripts es automatizar y estandarizar acciones a tomar en caso de agregar nuevos o reconfigurar servidores a la solución. Para mayor documentación sobre el estado actual, revisar la carpeta oficial del proyecto

### Prerrequisitos

Actualmente los scripts están hechos y probados para sistemas operativos Linux 20.04. Para versiones anteriores el funcionamiento es el mismo, pero debe antes ejecutarse el comando `dos2unix` sobre los scripts.

para poder correr los scripts se deben completar los archivos de configuración dentro de la carpeta resources con los datos solicitados. El detalle de esto se encuentra en el manual de instalación de Proyectate

### Scripts

* appserver - Instala todo el software necesario para correr las aplicaciones de medusa y pitonisio. Adicionalmente les genera un unit file y las compila
* dbserver - Instala MongoDB
* webserver - Instala todo el software necesario para correr la aplicación de benito. Adicionalmente la compila y le genera un unit file
* local-install - En caso que no se desee correr la aplicación de manera distribuida, este script corre todos los scripts antes mencionados

Para correr el script deseado se usa el comando:
```
sudo bash <<script>>
```
