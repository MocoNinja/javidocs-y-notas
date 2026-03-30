# Referencia rápida de aspectos relativos al montaje en Linux

## Cheatsheet

### Montar un dispositivo

Montar */device*, de formato de *deviceFileFormat*, en */device*, con permisos *filePermissons* y perteneciendo al grupo *ownerGroupID* y al usuario *ownerID*
> ```mount -t deviceFileFormat -o umask=filePermissions,gid=ownerGroupID,uid=ownerID /device /mountpoint```

### Arreglar haber montado / en modo *readonly*

> ```mount / -o remount,rw```

## Tips NTFS

Editar el fstab para tener la línea:

>UUID={{UUID}} {{DESTINO}}  ntfs-3g defaults,nls=utf8,umask=000,dmask=027,fmask=137,uid=1000,gid=1000,windows_names 0 0

Donde `{{UUID}}` se obtiene mediante el comando `sudo blkid /dev/sdb1` (o el disco correspondiente) y `{{DESTINO}}` es la ruta donde se quiere montar (/mnt/e en mi caso)

Para l33t bash skillz:

```bash
sudo sed -i "s/{{UUID}}/$(sudo blkid /dev/sdb1 | cut -d"=" -f3 | cut -d" " -f 1 | tr -d "\"")/g" /etc/fstab
sudo sed -i "s#{{DESTINO}}#/mnt/e#g" /etc/fstab
```