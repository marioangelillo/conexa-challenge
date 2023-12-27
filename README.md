# conexa-challenge

Imágenes de la aplicación.

<img width="327" alt="image" src="https://github.com/marioangelillo/conexa-challenge/assets/74382519/e4551b2e-26bc-4d60-b11e-908a02cd7bdc">
<img width="327" alt="image" src="https://github.com/marioangelillo/conexa-challenge/assets/74382519/6b470366-0440-4d66-92b8-33ff27abd532">
<img width="327" alt="image" src="https://github.com/marioangelillo/conexa-challenge/assets/74382519/1f3d3ce6-bac7-4e5c-a19e-50fadd76e554">
<img width="327" alt="image" src="https://github.com/marioangelillo/conexa-challenge/assets/74382519/b95d384d-275c-4cda-8d4a-66bf8220093a">

Estructura de las carpetas del proyecto

<img width="300" alt="image" src="https://github.com/marioangelillo/conexa-challenge/assets/74382519/cfa43dc4-16a5-4182-9f10-0ad9e06091b1">

Para el desarrollo de esta aplicación se tuvo en cuenta las siguientes consideraciones.

Patron de arquitectura: Opté por el patron de arquitectura Viper, si bien no es el patron de arquitectura mas sencillo, ofrece un gran desacoplamiento entre los distintos componentes de cada módulo. Esto no solo nos ofrece de que nuestra app pueda crecer de una forma prolija y ordenada, sino también la facilidad a la hora de realizar pruebas.

Buenas prácticas: 
- Fácil interpretación y lectura del proyecto
- Unit testing
- Patrón de Arquitectura
- Desacoplamiento de la capa de Presentación y capa de Infraestructura
- Facilidad a la hora de hacer refactor en el código

Librerias externas: únicamente se utilizó la libreria Alamofire por su facilidad al realizar peticiones HTTP. A pesar de que considero mejor utilizar código nativo de Swift con este próposito, debido a los tiempos de desarrollo y el tipo de proyecto, consideré que esta opción era la mejor.

Unit Testing: El proyecto cuenta con un target especifico para los unit test. En el mismo no se utilizaron librerias, todo está realizado con librerias propias de Swift, utilizando mucho la programación orientada a protocolos y los mocks para burlar algunos componentes a la hora de testear.

Posibles mejoras:
 - Agregar inyección de depencias para facilitar el manejo del proyecto y los tests
 - Llegar a un coverage del 80%
 - Llamar a los servicios a través de un repositorio, asi tendriamos la opción de generar otros tipos de repositorio dentro de la app, como por ejemplo un MockRepository para realizar pruebas locales.
