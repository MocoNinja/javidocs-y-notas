# Cosas de aprender Desarrollo Java

## Topics Aprender / Investigar

### Camel

#### Direct

 * [componente](https://camel.apac he.org/components/latest/direct-component.html)

#### Rutas

##### [Métricas](https://camel.apache.org/components/latest/metrics-component.html)

##### [to vs toD](https://camel.apache.org/manual/latest/faq/how-to-use-a-dynamic-uri-in-to.html)

el toD permite enrutar de forma dinánmica por el contenido del **Exchange**

#### wireTap

2.5.5 del libro de camel in action; te permite copiar un mensaje y mandar esta copia a otro destino además de al especificado en la ruta

#### split

te permite partir un mensaje en acachos, mediante el criterio que le especifiques

### Desarrollo

#### Formatos / Mapeos / Serialización
  
##### JAXB

 * Marshall / Unmarshall

##### Jackson

 * Es el que tiene los *ObjectMapper*

##### org.json

Es el que tiene los JSONObject

### Spring

#### Rest

##### ResponseEntity, ResponseBody, etc


* [RequestBody: permite que una http request se deserialize a objecto java](https://www.baeldung.com/spring-request-response-body)
* [ResponseEntity: abstracción de Spring para coger el http y tener todo más sencillo](https://www.baeldung.com/spring-response-entity)

##### ProducerTemplate

 * Parece que es [Camel](https://camel.apache.org/manual/latest/producertemplate.html)

#### Scope

 * [esto](https://www.boraji.com/spring-singleton-scope-example-using-scope-annotation) y [esto](https://www.baeldung.com/spring-bean-scopes)

#### Bean
 
 * [Un objeto de java, pero que es manejado por Spring (para el autowired y demás, entiendo)](https://www.baeldung.com/spring-bean)

## Cosas Observadas

* Usar ```BigDecimal``` en vez de ```Float``` / ```Double```
* Meter en main: ```TimeZone.setDefault(TimeZone.getTimeZone("Europe/Madrid"));```