:::options
:title: Subscribing to events
:description: Subscribing to events
:::

# Subscribing to events
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
Subscribe to any .NET event with Javonet. Event subscription works the same way as listening Java events. The performance of event subscription is extremely high and allows you to interact with .NET code like it was native Java code. When the event occurs, your Java listener callback is called in a separate thread.  

The simplest way to subscribe an event is to use an anonymous Java class.  
  
Assuming we have a custom `{called_name}` with the following class inside:  

:::code 
:called_source: v1/snippets/`{called_technology}`/EventExample.`{called_ext}`
:display: called
:::

The anonymous class should implement special **INEventListener** interface to subscribe to .NET event.

:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_SubscribeToEvent
:display: calling
:::


## Using .NET standard library elements  
  
To create a .NET button and listen for a "Click" event:

:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_SubscribeToEvent
:display: calling
:::

The anonymous class should implement special **INEventListener** interface. Alternatively you can write a separate class as the event listener by extending **NEventListener** and overriding the **eventOccurred** method, or by implementing the ((INEventListener)) interface.  

:::code
:called_source: v1/snippets/`{calling_technology}`/`{called_technology}`/MyEventListener.`{calling_ext}`
:display: called
:::

Usage of your listener class:


:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_SubscribeToEvent2
:display: calling
:::
  
  
[**See Live Example!**](http://lab.javonet.com/e/5)