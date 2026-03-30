# Cheatsheet JPA / SpringData / etc etc etc

## Me da problemas hacer una onetomany porque soy gilipollas

* Asumamos que tenemos unas entidades `AccountEntity` y `PaymentEntity` con las mierdas típicas
* Además de las mierdas típicas, el payment tiene la id foránea de la cuenta (`account_id`)
* Entonces queremos que el Payment tenga la cuenta correspondiente y para que quede wapens, que la cuenta tenga un `Set` de entidades
* Queremos que esto sea Lazy y que no pete con `Jackson`, `Lombok` y demás

Entonces:

- Ponemos el siguiente código en la `PaymentEntity` para referenciar a la clave foránea
```java
[...]
    @JoinColumn(name = "account_id")
    @ManyToOne
    private AccountEntity accountEntity;
[...]
```
- Ponemos el siguietne código en la `AccountEntity` para cogernos la info
```java
[...]
    @OneToMany(mappedBy = "accountEntity", fetch = FetchType.LAZY)
    @JsonIgnore
    @ToString.Exclude
    private Set<PaymentEntity> paymentEntitySet;
[...]
```

> Donde es importante recalcar el @JsonIgnore, porque si no, por defecto Jackson lo quiere y no puede ser Lazy