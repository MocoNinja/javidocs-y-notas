# Chuletilla de manipulación del DOM con *Vanilla* JavaScript

## Eliminar todos los elementos de cierta etiqueta

```js
  document.querySelectorAll("li").forEach(element => {
    element.parentNode.removeChild(element);
  });
```

> Donde se borrarán todos los elementos de una lista
