:::options
:title: Get/Set values for static fields and properties
:description: Get/Set values for static fields and properties
:related_articles: fields-and-properties/get-set-values-for-instance-fields-and-properties, getting-started/fluent-interface
:::

# Get/Set Values for Static Fields and Properties

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