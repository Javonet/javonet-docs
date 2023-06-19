:::options
:title: Get/Set values for instance fields and properties
:description: Get/Set values for instance fields and properties
:related_articles: fields-and-properties/get-set-values-for-static-fields-and-properties, getting-started/fluent-interface
:::

# Get/Set Values for Instance Fields and Properties

To set or get values of instance fields and properties, get or create an instance of the object from `{called_name}`, and call "get(fieldOrPropertyName)" or "set(fieldOrPropertyName,newValue)" methods on NObject\JObject containing this field.

Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To set and get instance field from this class:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GetSetInstanceField
:display: calling
:::
  
  
[**See Live Example!**](http://lab.javonet.com/e/2)
