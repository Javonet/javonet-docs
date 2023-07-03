:::options
:title: Getting and setting values for static fields and properties
:description: This article provides an overview of getting and setting values for static fields and properties
:related_articles: fields-and-properties/getting-values-for-instance-fields-and-properties
:::

# Static fields and properties
  
This article provides an introduction to cross-technology handling of static fields and properties from `{called_name}` using `{calling_name}`. The article explains how to get and set any static field/property.  
  
With Javonet you can interact with static fields and properties from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API, passing the name of the field or property as string. 
  
## Get/Set static field from custom `{called_name}`
  
With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with public static fields and properties declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
This section present sample custom `{called_name}` with class declaring static field and Javonet SDK syntax required to use that field and consume the results in `{calling_name}`.  
    
Code example below represents the sample code from `{called_name}` that will be used in following sections.   

:::code 
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Fields
:display: called
:::

It is possible to get one of the declared static fields from `{called_name}` using following `{calling_name}` code. This uses in memory runtime bridging to load the `{called_name}`, and next retrieves reference to specific type and gets the static field. Result of the invocation is returned as regular `{calling_name}` value and can be used for further processing.

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GetStaticField
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Fields
:display: calling
:::

To set static field/property from the custom `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_SetStaticField
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Fields
:display: calling
:::

## Get/Set static field from standard `{called_name}`

The same steps are required to use types and fields from standard `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_GetStaticField
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::
