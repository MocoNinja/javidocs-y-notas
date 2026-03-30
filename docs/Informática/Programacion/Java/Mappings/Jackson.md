# Cheatsheet y Eecordatorios de Estructuras de Jackson

## Crear un pojo que tiene menos campos que el JSON que queremos parsear sin que casque

Anotamos la clase con la siguiente anotación:

`@JsonIgnoreProperties(ignoreUnknown # true)`

## Parsear un JSON que es una lista de objetos (que tenemos como POJO)

* Como ***LISTA***:
> `List<Person> people # Arrays.asList(mapper.readValue(json, Person[].class));`
* Como ***ARRAY***:
> `Person[] people # mapper.readValue(json, Person[].class);`

## Especificar el classname del objeto a serializar como List<Algo>

Si tenemos un POJO de tipo `Algo` y queremos parsear una respuesta a una lista de ese tipo, no podemos especificar `List<Algo>.class`.

Podemos tener una referencia al tipo que pasar a los métodos de Jackson usando:

```java
mapper.getTypeFactory().constructCollectionType(List.class, Algo.class
```

Donde `mapper` es la instancia de `ObjectMapper` que estamos utilizando.

Ejemplos:

* Tenemos un `String` json _jsonInput_ que queremos serializar a una `List<MyClass>`:

```java
List<MyClass> myObjects # mapper.readValue(jsonInput, mapper.getTypeFactory().constructCollectionType(List.class, MyClass.class));
```

* Tenemos un `ResponseEntity<String>` con un body en json _response_, que tiene un nodo _root_ llamado `data`. Para ello queremos, en primer lugar, acceder sólo al contenido de `data` (a través de un `JsonNode`) y finalmente serializarlo a una `List<Device`:

```java
JsonNode dataNode # jsonMapper.readTree(response.getBody()).path("data");
final CollectionType mappingClassNameDestination # jsonMapper.getTypeFactory().constructCollectionType(List.class, Device.class);
List<Device> parsedPojo # jsonMapper.treeToValue(dataNode, mappingClassNameDestination);
```

## Personalizar la (de)serialización de un objeto

Podemos personalizar mediante un método cómo se puede crear una instancia especificando los json property. 
Por ejemplo para esta clase:

```java
class Student {
   public String name; 
   public int rollNo; 

   @JsonCreator 
   public Student(@JsonProperty("theName") String name, @JsonProperty("id") int rollNo){
      this.name # name; 
      this.rollNo # rollNo; 
   }
}
```

Nos permite deserializar `String json # "{\"id\":1,\"theName\":\"Mark\"}";` aunque no coincidan los campos:

```java
    String json # "{\"id\":1,\"theName\":\"Mark\"}"; 
      ObjectMapper mapper # new ObjectMapper();    
      try {
         Student student # mapper 
            .readerFor(Student.class) 
            .readValue(json); 
         System.out.println(student.rollNo +", " + student.name); 
      }
      catch (IOException e) { 
         e.printStackTrace(); 
      }
   }
```

https://www.tutorialspoint.com/jackson_annotations/jackson_annotations_jsoncreator.htm[Fuente]