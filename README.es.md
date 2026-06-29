# Generación proactiva de PICs en Smalltalk

Este repositorio reúne el trabajo realizado para mi tesis de Licenciatura en Ciencias de la Computación en la Universidad de Buenos Aires. Incluye la implementación, los experimentos y el informe sobre generación proactiva de **Polymorphic Inline Caches** (PICs) en Smalltalk utilizando información de tipos recolectada por LiveTyping.

## Resumen

Los lenguajes orientados a objetos dinámicamente tipados, como Smalltalk, resuelven los envíos de mensajes en tiempo de ejecución a partir de la clase concreta del receptor. Este modelo favorece la flexibilidad y la evolución dinámica de los programas, pero introduce un costo de rendimiento asociado al despacho dinámico. Las máquinas virtuales modernas mitigan este costo mediante compilación Just-In-Time, Inline Caches (ICs) y Polymorphic Inline Caches (PICs). Sin embargo, estas cachés se construyen de forma reactiva en tiempo de ejecución lo cual también tiene un costo.

Esta tesis explora un enfoque proactivo para la generación de ICs y PICs usando información de tipos recolectada por LiveTyping. En lugar de usar las PICs como fuente de información dinámica de tipos, se propone invertir el flujo: aprovechar los tipos previamente observados por LiveTyping para anticipar su generación en tiempo de compilación, en vez de depender únicamente de que la VM las construya durante la ejecución.

Para ello, se implementa soporte en la OpenSmalltalk VM mediante una primitiva que permite generar e instalar explícitamente ICs y PICs en sitios de envío seleccionados. A nivel de imagen, esta primitiva se integra con Cuis University y LiveTyping mediante un mecanismo que analiza métodos compilados y se concentra, en esta implementación, en envíos cuyo receptor proviene de una variable de instancia. A partir de la información de tipos recolectada, el mecanismo determina las clases receptoras y los métodos destino, y solicita a la VM la generación e instalación de la caché correspondiente.

La evaluación experimental se realiza mediante microbenchmarks que varían la cantidad de sitios de envío, clases receptoras y el número de iteraciones ejecutadas. Los resultados muestran que la generación proactiva de PICs puede reducir el costo inicial del despacho dinámico, especialmente en ejecuciones cortas y en métodos con múltiples sitios de envío, introduciendo un trade-off en términos de código generado y uso de espacio en la zona de código de la VM.

Palabras clave: PIC, IC, OpenSmalltalk VM, LiveTyping, Smalltalk, JIT.

## Contenido del repositorio

- `stouts/cuis/`: implementación y benchmarks correspondientes a Cuis.
- `stouts/osvm/`: cambios realizados sobre OpenSmalltalk VM.
- `cuis/`: imagen, máquinas virtuales y scripts utilizados para ejecutar los experimentos.
- `report/report.pdf`: informe completo de la tesis.

## Informe

El informe completo, **"Compilación de PICs en Smalltalk a partir de LiveTyping"**, está disponible en [`report/report.pdf`](report/report.pdf).
