:::options
:title: Creating instance and calling instance method
:description: This article provides an overview of Creating instance and calling instance method
:::

# Working with instances

## Custom `{called_name}` library

Assuming we have a custom library written for `{called_name}` with the following class in it:

:::code source="v2/snippets/testResources/`{called_tech}`/TestClass.`{called_ext}`":::

To create instance and call instance method from the custom `{called_name}` library:

:::code source="v2/snippets/`{calling_tech}`/`{called_tech}`/integrationTests.`{calling_ext}`" ID="TestResources_InvokeInstanceMethod":::

## Standard `{called_name}` library

To create instance and call instance method from standard `{called_name}` library:

:::code source="v2/snippets/`{calling_tech}`/`{called_tech}`/integrationTests.`{calling_ext}`" ID="StandardLibrary_InvokeInstanceMethod":::