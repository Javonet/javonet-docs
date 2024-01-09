:::options
:title: Disposing of objects
:description: Learn how to manage memory and dispose of objects in Javonet.
:related_articles: disposing-and-garbage-collection/batching-gc-with-delaygccontext
:keywords: Javonet, Disposing of Objects, Garbage Collection, Memory Management, `{called_technology}`, `{calling_technology}`, IDisposable, NObject, Dispose Method, JVM, CLR, Netcore, Windows, Linux, MacOS
:::

# Disposing of objects  
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
You can integrate the Java garbage collector with your .NET objects using Javonet. When you create an .NET object and store it in a Java variable, it will be handled in .NET process as long as your variable lives in the Java memory.  
  
When Java collects the NObject object, this event is passed to .NET, and the corresponding .NET object is disposed and collected. If the .NET object implements the IDisposable interface, then the appropriate disposal procedure is followed.  
  
You can also force object disposal by calling the "Dispose" method on the "NObject" object. Javonet exposes the dedicated "Dispose" method for closing all objects and releasing .NET memory. This method should be called only at the end of your Java application.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To see how destructor fro .NET works:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_DisposeObject
:display: calling
:::
  
  
[**See Live Example!**](http://lab.javonet.com/e/8)