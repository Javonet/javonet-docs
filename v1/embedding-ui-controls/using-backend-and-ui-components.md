:::options
:title: Embedding .NET User Controls in Java AWT, Swing or JavaFX
:description: Introduction to Using .NET Back-end and UI Components in Java
:related_articles: embedding-ui-controls/using-backend-and-ui-components
:keywords: Javonet, .NET User Controls, Java AWT, Swing, JavaFX, Embedding, UI Components, `{called_technology}`, `{calling_name}`, NControlContainer, Event Subscription, Layout Management, Revalidate Method, JVM, CLR, Netcore
:::

# Using .NET Back-end and UI Components in Java  
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
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
  
**Javonet API** -  set of classes for Java developers which simplify and allow any operations on any .NET object from Java code. The standard API is generic and flexible to be used with any object. You can use the .NET APIs as they are by creating instances of .NET objects in Java, calling .NET methods, setting or getting properties and even subscribing to .NET events.For UI components Javonet API exposes the dedicated NControlContainer class which allows to easily put any .NET user control within Java AWT, Swing or JavaFX interface and interact with it like with any other Java component. The control will automatically adjust to the Java layout and will live within the Java window.  
Javonet API is prepared to allow easy creation of strongly-typed interfaces for particular .NET classes or entire .NET libraries. This kind of interfaces replicate the methods signatures from .NET and provide completely pure Java experience for all other developers using these objects. From development and end-user perspective it is unnoticeable that anything is process by other runtime.  
  
**Core Engine** - internal infrastructure which takes care of initializing .NET CLR runtime within Java process and creating native bounds between Java operations on .NET objects to .NET methods, properties, events or classes. Core modules take care also of on-the-fly data-types conversions, objects lifecycle management or threads synchronization. 
  
**CLR Module** - this module is responsible of coordinating the .NET execution of operations performed on Java side and keeping the .NET environment in sync with your Java application.  
  
Using Javonet API you can do everything what you normally would do with the classes provided in third-party component. You can use static types, created instances of objects, work with these objects, pass and retrieve data or embed them in the Java UI if these are UI elements. It means that now you can treat anything created in .NET as modules available for your Java project.  
  
## Partners and Samples

Everyday you can find more .NET back-end and UI component vendors who officially open their products for Java markets through Javonet. For some vendors you need to use Javonet on your own to access their products whereas others might already provide ready to use Java JAR packages which encapsulate their .NET code-base, Javonet and strongly-typed interfaces inside.  
  
 **Dragon Medical speech solutions for Clinicians**  
Dragon Medical solutions accurately translate the doctor’s voice into a rich, detailed clinical narrative that feeds directly into the EHR. Now the Dragon Speech Recognition controls are available for Java desktop applications. The solution is provided natively by the Nuance Company, for more details check [https://www.nuance.com](https://www.nuance.com)
  
**Eyeshot Ultimate 10**  
Eyeshot is a CAD control based on the Microsoft .NET Framework. It allows developers to add CAD functionalities to WinForms and WPF applications in a snap. Eyeshot provides tools for building geometry from scratch, for analyzing it with finite element method and to generate toolpaths on it. Geometry can also be imported or exported using CAD exchange file formats. Now devDept Eyeshot package is available for Java AWT, Swing and JavaFX applications. [http://devdept.com/](http://devdept.com/)  

[Check live sample](https://www.javonet.com/java-devs/samples/using-devdept-net-winforms-eyeshot-cad-ui-components-java-awt/)  
  
**New-Doors Medical UI Components**  
New-Doors is providing customized solutions for medical applications, dedicated dictation UI component is now available for Java Swing applications. For more details contact New-Doors at [http://www.new-doors.net/](http://www.new-doors.net/)