# Apuntes de SSH

## Cómo tener los hosts configurados en un fichero

* Tenemos que tener en el directorio `~/.ssh` (permisos: `700`), un fichero llamado `config` (permisos: `600`)
* En este fichero podemos tener varios *`host`*, con su configuración.

Ejemplo de fichero:

```bash
Host raspberrypi.local
	HostName raspberrypi.local
	User javier
	IdentityFile "/path/to/pi.pem"
Host github.com
	HostName github.com
	IdentityFile "/path/to/gitlab.pem"
Host gitlab.com
	HostName gitlab.com
	IdentityFile "/path/to/gitlab.pem"
```

Esto me permite:

* Hacer ssh raspberrypi.local (y nada más, ni especificar usuario, ni puerto, ni path de la clave ni nada)
* De la misma forma, sftp raspberrypi.local funka **igual**
* Hacer push a los repos de gitlab y github sin configurar nada a nivel de git
