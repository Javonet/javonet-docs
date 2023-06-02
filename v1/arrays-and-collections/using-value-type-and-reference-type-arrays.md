:::options
:title: Using Value-Type and Reference-Type Arrays
:description: Using Value-Type and Reference-Type Arrays
:related_articles: arrays-and-collections/working-with-arrays.md, arrays-and-collections/working-with-collections.md
:::
  
# Using Value-Type and Reference-Type Arrays  
  
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


  