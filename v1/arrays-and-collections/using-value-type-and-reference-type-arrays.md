:::options
:title: Using Value-Type and Reference-Type Arrays
:description: Using Value-Type and Reference-Type Arrays
:related_articles: arrays-and-collections/working-with-arrays, arrays-and-collections/working-with-collections
:keywords: value-type arrays, reference-type arrays, using arrays, array operations, instance arrays, static arrays, mixed arrays, `{calling_technology}`, `{called_technology}`
:::
  
# Using Value-Type and Reference-Type Arrays  
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/`{calling_technology}`/`{called_technology}`/arrays-and-collections/arrays">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
With Javonet, you can use any value-type or reference-type arrays. Arrays can be retrieved from field or property values, returned as method invocation results, or passed as arguments or set to fields and properties. All array operations can be performed both on instance and static elements.  
  
Using arrays is very simple. Value-typed arrays are translated into regular arrays of corresponding `{calling_name}` types. Reference-typed arrays are represented as array of NObject/JObject objects.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/ArrayTestClass.`{called_ext}`
:display: called
:::

To use method from this class in `{calling_name}`:  

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Arrays_ValueTypeAndReferenceType
:display: calling
::: 

## Java  
  
Starting with version 1.4hf34 you can also retrieve a mixed arrays of value and reference types. In such case you will received on Java side an Object[] which will consist of NObject items and Java value types like (float, double, int, etc..).  
  
[**See Live Example!**](http://lab.javonet.com/e/4)