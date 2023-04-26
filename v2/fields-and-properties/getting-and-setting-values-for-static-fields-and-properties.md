:::options
:title: Getting and setting values for static fields and properties
:description: This article provides an overview of getting and setting values for static fields and properties
:::

# Working with static fields and properties

## Custom `{called_name}`

Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Simple/TestClass.`{called_ext}`
:display: called
:::

To get static field from the custom `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GetStaticField
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Simple/TestClass.`{called_ext}`
:display: calling
:::

To set static field from the custom `{called_name}` library:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_SetStaticField
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Simple/TestClass.`{called_ext}`
:display: calling
:::


## Standard `{called_name}`

To get static field from the standard `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_GetStaticField
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Empty/TestClass.`{called_ext}`
:display: calling
:::
