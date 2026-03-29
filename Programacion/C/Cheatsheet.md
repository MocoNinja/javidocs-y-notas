# Chuleta y referencias rápidas mientras aprendo (bien) C

## Referencias Rápidas

* Números aleatorios
>[Post SO: Interesante por explicar rango [1] y seguridad](https://stackoverflow.com/questions/822323/how-to-generate-a-random-int-in-c)

## Chuletas

### Números aleatorios

* Iniciar una semilla: ```srand(time(NULL));```
* [1] Generar un entero entre *0 y n*: ```int r = rand() % n + 1;```
