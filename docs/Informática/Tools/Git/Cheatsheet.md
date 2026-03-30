# Snippets de git

## ARCHIVOS

* Mergear un archivo de una rama a otra

> ```git checkout rama_origen archivo```

* Revertir ficheros a un commit anterior

> ```git checkout``` ***commit*** ```--``` ***fichero1*** ***[fichero2  ... ]***

## REMOTES

* Renombar un remote

> ```git remote rename nombre_viejo nombre_nuevo```

## RAMAS

* **VER** todas las ramas del repo

> ```git branch -a```

* **BAJAR** todas las ramas del repo

> ```git pull --all```

* Borrar rama **LOCAL**

> ```git branch -d/-D rama```
> ```-D``` ***es más forzosa que*** ```-d```

* Borrar rama **REMOTA**

> ```git push origin --delete rama```

* Clonar **SÓLO UNA RAMA**

> ```git clone <url> --branch <branch> --single-branch [<folder>]```

## COMMANDOS

### DIFF

* Mostrar en el diff sólo los cambios

> Versión larga: `git diff --unified=0`
> Versión corta: `git diff -U0`
> Meterlo en la configuración *(global)*: `git config _(--global)_ diff.context 0`

* Ver los cambios que se van a meter a el commit

`git diff --staged`

(Alternativas en 1.)

### COMMIT

* Comitear sólo parte de un fichero

Hay que usar los parches:

`git add -p _fichero_` (la opción larga es `--patch`)

Esto nos irá sacando los `chunks` que podemos marcar, entre otras opciones, para *meter en el commit* (`_y_`), o para *no meter en el commit* (`_n_`).

### STASH

* Stashear sólo ciertas cosas del staging area

```git stash push -m welcome_cart app/views/cart/welcome.thtml```

## GITIGNORE

* Meter una excepción en el .gitignore

Si queremos añadir una excepción a una regla genérica, se puede preceder con un `!` y se respetará.

Ejemplo: tengo una carpeta que quiero ignorar todo, pero quiero dejar un readme.txt en git:

```txt
[...]
resources/*
!resources/readme.txt
[...]
```

## LINKS

### AUTENTICACIÓN Y CREDENTIALES

[git-asks-for-username-every-time-i-push](https://stackoverflow.com/questions/11403407/git-asks-for-username-every-time-i-push)

[creating-a-personal-access-token-for-cmd](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)

[linux-ugly-password-ui-instead-of-cmd](https://gist.github.com/joseluisq/d0e66c5f718250c90075)

### REFERENCIAS

1. [diff de unstaged](https://www.shellhacks.com/git-diff-staged-unstaged-files/)
