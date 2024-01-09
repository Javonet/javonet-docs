:::options
:title: Using nested types
:description: Using nested types
:keywords: Javonet, Nested Types, `{called_technology}`, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, Class Definition, Struct Definition, Type Argument, Field Type, Property Type, Generic Arguments
:::

# Using nested types
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
Nested types are the classes defined within other class or struct. Javonet is able to create the instance of nested type, pass nested type as Type argument, set nested type to field or property and use nested types as generic arguments for methods and classes.  
  
More about nested types you can read in MSDN documentation: [Nested Types](http://msdn.microsoft.com/en-us/library/ms173120.aspx)  
  
Assuming we have a custom `{called_name}` with the following classes inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

And

:::code 
:called_source: v1/snippets/`{called_technology}`/Container.`{called_ext}`
:display: called
:::

To reference nested type with full namespace the name of the nested class should be prefixed with namespace, name of parent class and "+" sign. For example the "Nested" class defined above could be access using following path "TestNamespace.Container+Nested". Following examples show how to initialize and work with nested types using full namespace.  
  
:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_UseNestedTypes
:display: calling
:::
  
  
[**See Live Example!**](http://lab.javonet.com/e/18)
