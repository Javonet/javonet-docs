:::options
:title: Embedding .NET User Controls in Java AWT, Swing or JavaFX
:description: Introduction to Using .NET Back-end and UI Components in Java
:related_articles: embedding-ui-controls/using-backend-and-ui-components
:keywords: Javonet, .NET User Controls, Java AWT, Swing, JavaFX, Embedding, UI Components, `{called_technology}`, `{calling_technology}`, NControlContainer, Event Subscription, Layout Management, Revalidate Method, JVM, CLR, Netcore
:::

# Embedding .NET User Controls in Java AWT, Swing or JavaFX  
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
With Javonet you can very easily embed any .NET WinForms or WPF user control in Java. Embedded control can be placed within any Java layout component like Panels, Borders, Frames etc… in order to present the control side by side within the Java desktop application.  
  
You can easily fully interact with all the features of .NET UI control invoking any methods, retrieving results or subscribing the events and callbacks which will be triggered when user interacts with .NET control.  
  
The control will automatically move and scale with Java window. The user experience is completely seamless and transparent for end-user. Due to the fact that .NET controls are rendered and executed by .NET framework the performance of the control is native like using regular .NET application.  
  
You can see the sample project in action on [this video](https://www.youtube.com/watch?v=L1GY5d8ZbLY)  
  
## Examples  
  
To embed user control in Java UI you need to wrap the control in NControlContainer class and add to your layout:

:::code source="v1/snippets/java/netframework-dll/integrationTests.java" ID="StandardLibrary_EmbedNetUserControl1":::

In order to subscribe any event expose by the control just reference to the control instance NObject class:

:::code source="v1/snippets/java/netframework-dll/integrationTests.java" ID="StandardLibrary_EmbedNetUserControl2":::

Starting 1.4hf34 we have exposed updated revalidate method which allows you to refresh the control layout after programmatic changes of layout or control size

:::code source="v1/snippets/java/netframework-dll/integrationTests.java" ID="StandardLibrary_EmbedNetUserControl3":::