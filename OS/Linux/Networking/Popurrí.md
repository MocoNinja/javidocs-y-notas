# Popurrí de cosicas

## Centos no tiene network por default

If interface ```x``` does not get up by default:

* Edit ***```/etc/sysconfig/network-scripts/ifcfg-$IFNAME```***
* Set ***```ONBOOT``` to ```true```

## No me funciona el wifi por culpa del rtl8723be

1. Quitar el módulo wifi
> ```sudo modprobe -r rtl8723be```
2. Crear la configuración en un archivo de texto
> ```echo "options rtl8723be ant_sel=1" | sudo tee /etc/modprobe.d/rtl8723be.conf```
3. Arrancar el módulo wifi con la configuración no chunga
> ```sudo modprobe rtl8723be ant_sel=1```