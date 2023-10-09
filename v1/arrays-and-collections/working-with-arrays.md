:::options
:title: Working with arrays
:description: Working with arrays
:related_articles: arrays-and-collections/using-value-type-and-reference-type-arrays, arrays-and-collections/working-with-collections
:::
  
# Working with arrays  

<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a href="/guides/v2/arrays-and-collections/arrays">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>

Data structures are one of the essential aspects of every piece of software that has ever been written. Any
application, from simple command line util to scalable enterprise systems, constantly process various
information, that very often require specific grouping and access strategies. This aspect is addressed by
arrays and more advanced collection types available both in Java and .NET environments. By using the
Javonet framework, users gain ability to easily and effectively work with data structures originating
from the other platform.  
  
I'll be working with the following pseudo-service class, which main purpose is to produce and consume various array-typed objects.

:::code 
:called_source: v1/snippets/`{called_technology}`/ArrayService.`{called_ext}`
:display: called
:::
  
## Retrieving and handling array from `{called_name}`  
  
Javonet framework allows for simple retrieval of arrays of objects, as presented in the
following examples. Such objects are treated as usual `{calling_name}` arrays, therefore all the standard `{calling_name}` programming techniques apply. Although examples present objects' retrieval in result to method calls, the same approach is applicable for getting class properties, direct member access etc.  
  
**For Java developers** - It's worth mentioning that, when dealing with primitive, value-typed .NET arrays, Javonet framework
automatically translates them to respective Java primitive type. In such cases, it is necessary to keep in mind, that the returned array will contain boxing-type objects, otherwise we might face an InvalidClassCastException.
  
Example of calling method which returns array of Integers:
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Arrays_GetIntArray
:display: calling
:::

As for arrays containing reference-type objects, we're simply dealing with an NObject/JObject array. Working with such object is no different that for any other NObject/JObject provided by the framework from the `{called_name}`  
  
Example of calling method which returns array of Objects:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Arrays_GetCustomObjectArray
:display: calling
:::

In the previous examples, we've been retrieving a single-dimensional arrays.  It is possible however, to get an array of arrays, either for primitive- and reference-type objects. Here are the examples:  
  
Value-typed nested arrays:  

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Arrays_GetArrayOfIntArrays
:display: calling
:::

Reference-type nested arrays:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Arrays_GetArrayOfCustomObjectArrays
:display: calling
:::

**For Java developers** - Unfortunately, current version of Javonet framework does not support retrieval of arrays containing arraytype objects, nested more than once. Also, the multidimensional arrays (in the .NET way of things) are not
supported either. Thankfully, despite the fact, that such cases are not that common and/or easy
workarounds exist, it is considered as viable enhancement, which most probably will be shipped in one of the upcoming versions.  
  
## Passing arrays

**For Java developers** - Being aware of the automatic type conversion for value-typed arrays, it is absolutely safe to pass regular Java arrays as arguments to the .NET code. Similarily as when retrieving primitive arrays, it is necessary to work with the boxed wrappers.  
  
Passing array of primitive types:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Arrays_UseIntArray
:display: calling
:::
  
In case we need to send a reference-type array, all we need to do is create an array of NObjects/JObjects and
populate it, as shown in the next example.  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Arrays_UseCustomObjectArray
:display: calling
:::
  
  
Unlike the array-retrieval scenario, sending nested arrays is not supported at the moment, it is however considered for shipment, depending on the demand for such feature.  
  

## Summary  
  
In this article we've focused on working with arrays using Javonet framework. As for array objects, differences of handling arrays of value- and reference-type objects have been discussed, as well as framework's current limitations have been presented.
  
