# Explicacón de los *virtual environments* en Python

## Introducción

Un *virtual environment* es una forma que tiene Python para poder mantener todas las librerías y dependencias de una aplicación de Python en las versiones requeridas de forma aislada al resto del entorno de Python para que no interfieran con otras aplicaciones.

## Funcionamiento

Los entornos virtuales contienen su propio binario de Python (la versión sera la misma que la del binario utilizado para crear el entorno) y las librerías. Por ello, cuando se crear un entorno virtual, se hace en un **directorio** del sistema.

A continuación se ilustra la secuencias de comandos para crear una carpeta y un entorno virtual, bajo Windows 10:

```shell

PS E:\Code\Python\TutoEjemplos\Django> ls
PS E:\Code\Python\TutoEjemplos\Django> mkdir venv_django_tutorial


    Directorio: E:\Code\Python\TutoEjemplos\Django


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----       07/10/2018     18:10                venv_django_tutorial


PS E:\Code\Python\TutoEjemplos\Django> cd .\venv_django_tutorial\
PS E:\Code\Python\TutoEjemplos\Django\venv_django_tutorial> python.exe -V
Python 3.7.0
PS E:\Code\Python\TutoEjemplos\Django\venv_django_tutorial> python -m venv .
PS E:\Code\Python\TutoEjemplos\Django\venv_django_tutorial> dir


    Directorio: E:\Code\Python\TutoEjemplos\Django\venv_django_tutorial


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----       07/10/2018     18:10                Include
d-----       07/10/2018     18:10                Lib
d-----       07/10/2018     18:10                Scripts
-a----       07/10/2018     18:10            121 pyvenv.cfg


PS E:\Code\Python\TutoEjemplos\Django\venv_django_tutorial>

```

Notar que esto requiere del paquete ```virtualenv```, que en este caso ha sido instalado previamente con ```pip```.

Para trabajar con el entorno actual, se debe activar el entorno. Hay un script para esto, teniendo que ejecutar simplemente el comando: ```./Scripts/activate```.
De la misma manera, para dejar de usar  el entorno se utiliza el comando: ```deactivate``` (**NOTAR que NO está en la carpeta anterior**).

## Links

* [Más info y wrapper](https://docs.python-guide.org/dev/virtualenvs/)