:::options
:title:  Introduction to Using .NET Back-end and UI Components in Java
:description: Introduction to Using .NET Back-end and UI Components in Java
:related_articles: getting-started/installing-javonet, getting-started/activating-javonet, getting-started/adding-references-to-libraries, getting-started/xml-configuration-file
:::

# Using .NET Back-end and UI Components in Java

##  Introduction to Using .NET Back-end and UI Components in Java

Using back-end and/or UI .NET components in Java can be as easy as working with regular pure Java components. With Javonet you can take any existing .NET component in form of DLL libraries and just use them directly within any Java console, service, web, EJB or desktop project. Javonet framework is based on native integration so the performance of using any component is almost the same as working with single technology.  
  
There are no limits on the operations that you can invoke on the .NET control therefore without any sacrifice you can use any critical and best components from .NET world in Java application. This can be CAD modelling control, bar code detection algorithm, OCR algorithm, speech recognition component, specific data formats parser and many more.  
  
This guide is an introduction for developers interested in using any existing third-party .NET back-end and UI components from Java  
  
## Introduction to Javonet

Javonet is a framework that allows to utilize the native integration technology in the most simple and efficient way to get most out of its benefits. The native integration is the concept of loading two different managed runtimes within single operating system process (i.e. CLR and JVM) and creating native binding between them to allow cross-platform communication.  
  
The idea of re-using any .NET modules in Java and any Java module in .NET is not only great way to save a lot of time, get access to more tools and resources, increase the application scope of particular pieces but also a great way to save costs on third-party components and remove the barriers of technology you choose for your project regardless of modules you need to utilize.  
  
As each module is loaded and executed by its own runtime the performance and reliability is guaranteed by design. The direct binding between the calls on Java methods to the .NET code provides native performance which in combination with encapsulation within single OS process make it transparent for end-user providing the same experience like single-technology application does.  
  
## How Javonet works
  
Javonet consists of multiple modules:  
  
- **Javonet API** -  set of classes for Java developers which simplify and allow any operations on any .NET object from Java code. The standard API is generic and flexible to be used with any object. You can use the .NET APIs as they are by creating instances of .NET objects in Java, calling .NET methods, setting or getting properties and even subscribing to .NET events.For UI components Javonet API exposes the dedicated NControlContainer class which allows to easily put any .NET user control within Java AWT, Swing or JavaFX interface and interact with it like with any other Java component. The control will automatically adjust to the Java layout and will live within the Java window.  
Javonet API is prepared to allow easy creation of strongly-typed interfaces for particular .NET classes or entire .NET libraries. This kind of interfaces replicate the methods signatures from .NET and provide completely pure Java experience for all other developers using these objects. From development and end-user perspective it is unnoticeable that anything is process by other runtime.  

- **Core Engine** - internal infrastructure which takes care of initializing .NET CLR runtime within Java process and creating native bounds between Java operations on .NET objects to .NET methods, properties, events or classes. Core modules take care also of on-the-fly data-types conversions, objects lifecycle management or threads synchronization. 
  
- **CLR Module** - this module is responsible of coordinating the .NET execution of operations performed on Java side and keeping the .NET environment in sync with your Java application.  
  
Using Javonet API you can do everything what you normally would do with the classes provided in third-party component. You can use static types, created instances of objects, work with these objects, pass and retrieve data or embed them in the Java UI if these are UI elements. It means that now you can treat anything created in .NET as modules available for your Java project.  
  