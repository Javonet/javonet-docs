:::options
:title: Creating instance and calling instance methods
:description: This section describes how to invoke instance methods
:related_articles: calling-methods/invoking-static-methods, getting-started/fluent-interface
:keywords: Javonet, Instance Creation, Instance Methods, `{calling_name}`, `{called_technology}`, Integration, Reflection, Value-Type Conversion, Reference-Type Conversion, NObject, JObject, Fluent Interface
:::

# Creating instance and calling instance methods
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/`{calling_technology}`/`{called_technology}`/calling-methods/creating-instance-and-calling-instance-methods">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
Javonet lets you create instances of any type from `{called_name}`.

Assuming we have a custom `{called_name}` with the following class inside

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To create instance and invoke instance method from this class:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_CreateInstanceAndInvokeMethod
:display: calling
:::

Javonet calls are very similar to regular .NET or Java calls, with a little bit of reflection style. Value-type results are automatically converted into `{called_name}` types so you can safely assign them to `{called_name}` variables. Reference-type results must be assigned to NObject\JObject variable.   
  
Any calls to .NET or Java objects using Javonet can be shortened and simplified using Javonet Fluent interface.  
  
[**See Live Example!**](http://lab.javonet.com/e/1)