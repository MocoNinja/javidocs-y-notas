# Errores comunes en Linux y sus soluciones

## Gráficos

### El **puto** Java tiene pobre performance gráfica en Linux

* Añadir el siguiente argumento a la ***JVM***:
> ```-Dsun.java2d.opengl=true```

## Impresoras

### En gnome 3.X y derivados, sale una notificación todo el puto rato al hacer login de que "la impresora está lista"

- En `/etc/cups/cups-browsed.conf`
- Cambiar `BrowseRemoteProtocols CUPS dnssd` -> `BrowseRemoteProtocols none`
- Reiniciar el servicio con: `service cups restart`

## Aplicaciones

### Tilix

#### No deja setear el height al 100% con la app

- `gsettings set com.gexperts.Tilix.Settings quake-height-percent 100`