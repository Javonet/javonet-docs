:::options
:title: Get/Set values for instance fields and properties
:description: Get/Set values for instance fields and properties
:related_articles: fields-and-properties/get-set-values-for-static-fields-and-properties, getting-started/fluent-interface
:keywords: Javonet, Get/Set Values, Instance Fields, Instance Properties, `{called_technology}`, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, NObject, JObject, Field Manipulation, Property Manipulation
:::

# Get/Set Values for Static Fields and Properties
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/`{calling_technology}`/`{called_technology}`/fields-and-properties/getting-and-setting-values-for-static-fields-and-properties">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
## Custom `{called_name}`

With Javonet you can easily get or set a value for any static field or property from a class or structure from `{called_name}` by calling the "get(fieldOrPropertyName)" or "set(fieldOrPropertyName, newValue)" method on reference to .NET/Java type. Conversely, foreign instance types can be stored in `{calling_name}` variables using the dedicated Java type called NType.  
  
As with the methods, value-typed results are automatically translated into `{calling_name}` types and reference results are returned as NObject\JObject objects.  
  
Assuming we have a custom `{called_name}` with the following class inside:  

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To set and get static field from this class:  

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GetSetStaticField
:display: calling
:::

## Standard `{called_name}`
  
To get static field from the standard `{called_name}`:
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_GetStaticField
:display: calling
:::

  
[**See Live Example!**](http://lab.javonet.com/e/2)