# Quick JavaScript OneLiners

## Poner un *string* en los campos *null* de un *objeto*

```javascript
function nullToString(v) {
    return JSON.parse(JSON.stringify(v).split(":null").join(":\"null\""));
}
```

[Discusión](https://stackoverflow.com/questions/26017137/how-to-replace-all-null-values-in-javascript-object-with-null-string)
