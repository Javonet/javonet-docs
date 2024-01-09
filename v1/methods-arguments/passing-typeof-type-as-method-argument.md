:::options
:title: Passing typeof(Type) as method argument
:description: Passing typeof(Type) as method argument
:related_articles: methods-arguments/passing-reference-type-arguments, methods-arguments/passing-arguments-by-reference-with-ref-keyword, methods-arguments/passing-arguments-by-reference-with-out-keyword, methods-arguments/calling-overloaded-method-passing-null-argument
:keywords: Javonet, Typeof Type, `{called_technology}`, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, Method Arguments, NType, GetType, Method Invocation, Type Argument
:::

# Passing typeof(Type) as method argument 
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
If target .NET methods expects "Type" as argument, which is being called in .NET using Method(typeof(Some_Type)) syntax, you can call such method with NType object as argument.  

Javonet introduces "NType" class to store .NET Type. To retrieve the instance of particular .NET type as counterpart of typeof(String) you should use Javonet.getType("String") method. The "getType(String typeName)" method is static method on Javonet class which accepts in first argument the name of .NET type and returns the instance of NType class connected to the Type object of provided type. Type name argument might contain either type name or type name with full namespace. If there is only one type with selected name in loaded assemblies then Javonet will lookup the namespace automatically otherwise full namespace should be provided or exception will be thrown.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::


To use method which expects type as argument:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_PassTypeAsMethodArgument
:display: calling
:::
  
  
[**See Live Example!**](http://lab.javonet.com/e/16)