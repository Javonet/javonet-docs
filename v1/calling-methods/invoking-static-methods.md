:::options
:title: Invoking static method
:description: This section describes how to invoke static methods
:related_articles: calling-methods/create-instance-and-calling-instance-methods, getting-started/fluent-interface
:::

# Invoking Static Methods
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/`{calling_technology}`/`{called_technology}`/calling-methods/invoking-static-method">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
To invoke the static method, first get the particular type and call invoke providing method arguments.  

Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To invoke static method from this class:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeStaticMethod
:display: calling
:::

The invoke method allows you to call any static or method with or without arguments. Value-type arguments are automatically translated to appropriate types, and you can also pass referenced arguments. If method has no arguments you just call it using **Invoke("methodName")**. If called method expects arguments you can pass them as arguments to Invoke method.  
  
Any calls to .NET or Java objects using Javonet can be shortened and simplified using Javonet Fluent interface.  
  
[**See Live Example!**](http://lab.javonet.com/e/1)