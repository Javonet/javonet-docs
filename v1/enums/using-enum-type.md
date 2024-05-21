:::options
:title: Using enum type
:description: Learn how to use .NET enums in your Java project with Javonet.
:keywords: Javonet, .NET Enums, Java, `{called_technology}`, `{calling_name}`, NEnum, Method Argument, JVM, CLR, Netcore, Windows, Linux, MacOS
:::

# Using enum type
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/enums/using-enum-type">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
To use .NET enums in your Java project, javonet API provides special NEnum type. 
Using this class you can keep the reference of particular enum value, get/set the enum value, pass the enum value as method argument or compare enum values.  

To initialize reference to .NET enum type you can use the NEnum(String enumTypeName, String enumValue) constructor. As first argument you must provide enum type name with or without namespace. 
When namespace is not provided Javonet will automatically lookup the enum type in all loaded assemblies, if there is only one type with provided name it will be used. 
In second argument selected enum value should be provided.  
  
Assuming we have a custom `{called_name}` with the following enum inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/SampleEnum.`{called_ext}`
:display: called
:::


Enum usage:
  
:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_UseEnumType
:display: calling
:::

How to pass enum as method argument:  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To use enum as method argument:  
  
:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_UseEnumTypeAsArgument
:display: calling
:::
  
  
[**See Live Example!**](http://lab.javonet.com/e/14)

