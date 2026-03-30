# Cómo configurar sencillamente un Swagger

## Añadir las dependencias necesarias de maven

En un proyecto de Spring Boot (hecho con la versión _2.6.2_), modificamos el `pom.xml`.

* Bajo las `<properties>`, añadimos (no es necesario, es por limpieza):

```xml
        <springfox-version>3.0.0</springfox-version>
```

* Bajo las `<dependencies>`, añadimos las requeridas:


```xml
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger-ui</artifactId>
    <version>${springfox-version}</version>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>
```

## Configuración de Spring

### Properties

A pesar de seguir la https://www.baeldung.com/swagger-2-documentation-for-spring-rest-api[documentación oficial], añadir estas dependencias provocaba un fallo, https://stackoverflow.com/questions/70036953/springboot-2-6-0-spring-fox-3-failed-to-start-bean-documentationpluginsboot[que se ha solucionado] especificando una configuración; para ello, en el `application.properties`, añadimos:

* `spring.mvc.pathmatch.matching-strategy#ant_path_matcher`

### Entidades

Se necesita el `@Bean` de configuración, siendo el código base:

```java
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
public class SwaggerConfiguration {
    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build();
    }
}
```

## Acceso

Con esto, tenemos la configuración más sencilla. Puede accederse con la url: `http://localhost:8080/swagger-ui/`