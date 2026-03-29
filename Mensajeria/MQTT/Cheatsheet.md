# Cheatsheet MQTT

## Cómo saber dónde está publicando algo (es decir, tenemos mensajes pero de qué topic?)

Podemos subscribirnos a todos los topics en modo debug, lo que nos permitirá ver el nombre del topic cuando se le haga un `PUBLISH`.

* Para conectarnos a todos los _topics_: `-t "#"`
* Para conectarnos en modo _debug_: `-d`

Esto resulta en el comando:
> `mosquitto_sub -t "#" -d`

Ejemplo de salida:

----

```text
Client mosq-uW9v45UfjAT77bCqYM received PUBLISH (d0, q0, r0, m0, 'acc/accelerometer/z', ... (3 bytes))
143
Client mosq-uW9v45UfjAT77bCqYM received PUBLISH (d0, q0, r0, m0, 'acc/accelerometer/x', ... (3 bytes))
957
Client mosq-uW9v45UfjAT77bCqYM received PUBLISH (d0, q0, r0, m0, 'acc/accelerometer/y', ... (3 bytes))
133
Client mosq-uW9v45UfjAT77bCqYM received PUBLISH (d0, q0, r0, m0, 'acc/accelerometer/z', ... (3 bytes))
144
Client mosq-uW9v45UfjAT77bCqYM received PUBLISH (d0, q0, r0, m0, 'acc/accelerometer/x', ... (3 bytes))
956
```

----
