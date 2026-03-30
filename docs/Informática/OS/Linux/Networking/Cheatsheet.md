# Cheatsheet aspectos de red en Linux

## Configuraciones

### Deshabilitar IPv6

* Editar el fichero ```/etc/sysctl.conf```

* Añadir las siguientes líneas al final de este:

```shell
# IPv6
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```
* Reiniciar la configuración:

```sudo sysctl -p```

### Cambiar DNSs

* Editar el fichero ```/etc/resolvconf/resolv.conf.d/head```
* Ejecutar el comando ```sudo resolvconf -u```


## Comandos

### Mirar puertos libres y busy en Linux

> ```sudo netstat -antu```

### Mirar puertos libres y busy en Linux **(con su proceso)**

> ```sudo netstat -antup```

### Ver tu IP

> ```dig @resolver1.opendns.com ANY myip.opendns.com +short```