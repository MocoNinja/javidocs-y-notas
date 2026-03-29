# Chuletilla de herramientas relacionadas con la criptografía

## Apache Utils

Esto nos permite generar contraseñas, aunque hay que tener en cuenta que está pensando para generar las entradas del tipo: ***`USER:PASSWORDENCRIPTADA`***

### Setup

Estas utils están en los siquientes paquetes de utilidades

#### Debian / Ubuntu

* apache2-utils: `sudo apt install -y apache2-utils`

### Uso

#### Quiero obtener el digest bcrypt para mi contraseña ***`password`***

* Uso el comando: `htpasswd -nbBC 10 USER password`
* Obtengo la salida: `USER:$2y$10$VBCOmmawBEjwBG4uXoWr1u4OlIed8MsOxqaVW.yQL73TMMMBY/bWi`
* Me quedo con la contraseña: `$2y$10$VBCOmmawBEjwBG4uXoWr1u4OlIed8MsOxqaVW.yQL73TMMMBY/bWi`

## Spring CLI Tools

Esto es multiplataforma y permite hashear una contraseña con BCRYPT, que es lo que usa Spring Security.

### Uso

#### Quiero obtener el digest bcrypt para mi contraseña ***`password`***

* Uso el comando: `spring.cmd encodepassword Passw0rd_S3gura`
* Obtengo la salida: `{bcrypt}$2a$10$LuZDIfEdgZTMWoORbg8RZeWkQM1npu0nv4VSjm25owifXqgD8AGiG`
