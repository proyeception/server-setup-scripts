# server-setup-scripts

scritps varios de configuracion de entorno de servidores para el proyecto de Proyeception

## Arraque

El propósito de estos scripts es automatizar y estandarizar acciones a tomar en caso de agregar nuevos o reconfigurar servidores a la solución. Para mayor documentación sobre el estado actual, revisar la carpeta oficial del proyecto

### Prerrequisitos

Actualmente el único prerrequisito es que el Sistema Operativo sea edición RHEL

### Scripts

* appserversetup - Instala todo el software necesario para correr el backend o frontend de la solución
* mongoserver-setup - Instala MongoDB y crea los usuarios predefinidos del la solución en este
* users_setup - Agrega usuarios al servidor y les da permisos para poder acceder a la instancia mediante SSH

Se debe correr el script deseado con el comando:
```
sudo bash <<script>>
```
