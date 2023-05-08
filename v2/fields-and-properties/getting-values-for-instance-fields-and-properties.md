:::options
:title: Getting values for instance fields and properties
:description: This article provides an overview of getting values for instance fields and properties
:::

# Working with instance fields and properties

## Custom `{called_name}`

Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To get instance field of a class inside the custom `{called_name}`

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GetInstanceField
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: calling
:::


## Standard `{called_name}`

To get instance field from the standard `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_GetInstanceField
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::
