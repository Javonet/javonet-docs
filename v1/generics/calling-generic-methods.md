:::options
:title: Calling generic methods
:description: This section describes how to invoke static methods
:related_articles: working-with-objects/creating-instance-of-generic-object
:keywords: Javonet, Calling Generic Methods, `{called_technology}`, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, NType, Generic Methods, Method Invocation, Static Methods
:::

# Calling generic methods
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/generics/calling-generic-instance-method">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
With Javonet you can very easily invoke any generic instance or static method. To call a generic method, you need to provide types that will be used during the method invocation. Those types can be passed as an instance of NType objects initialized with particular .NET types.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To use generic methods from this class:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GenericMethods
:display: calling
:::
  
- Create an instance of our GenericSample class.
- Using the generic method, initialize the generic method invocation by passing one or many generic types of arguments.
- Invoke your method with a sample argument.  
  
Javonet.getType(typeName) returns an instance of NType object attached to a specific .NET type. The instruction NType myType = Javonet.getType("String") is the Java equivalent of the .NET Type myType = typeof(String).  
  
[**See Live Example!**](http://lab.javonet.com/e/3)
