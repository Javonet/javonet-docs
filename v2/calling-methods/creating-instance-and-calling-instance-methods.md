:::options
:title: Creating instance and calling instance method
:description: This article provides an overview of Creating instance and calling instance method
:::

# Working with instances

## Custom `{called_name}`

Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Simple/TestClass.`{called_ext}`
:display: called
:::

To create instance and call instance method of a class inside custom `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeInstanceMethod
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Simple/TestClass.`{called_ext}`
:display: calling
:::

## Standard `{called_name}`

To create instance and call instance method from standard `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_InvokeInstanceMethod
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Empty/TestClass.`{called_ext}`
:display: calling
:::