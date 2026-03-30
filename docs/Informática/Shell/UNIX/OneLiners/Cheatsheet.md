# Chuletilla de one liners

## Sustituir carácteres

Buscar todos los ficheros en `.` que contengan `á` y cambiarlo por `a`:

`files=$(grep -rl "á" .) && echo $files | xargs sed -i 's/á/a/g'`
