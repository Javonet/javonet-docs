:::options
:title: Getting and setting values for static fields and properties
:description: This article provides an overview of getting and setting values for static fields and properties
:::

# Working with static fields and properties

## Custom `{called_name}` library

Assuming we have a library written for `{called_name}` with the following class in it:

:::code source="v2/snippets/testResources/`{called_technology}`/TestClass.`{called_ext}`":::

To get static field from the custom `{called_name}` library:

:::code source="v2/snippets/`{calling_tech}`/`{called_tech}`/integrationTests.`{calling_ext}`" ID="TestResources_GetStaticField":::

To set static field from the custom `{called_name}` library:

:::code source="v2/snippets/`{calling_tech}`/`{called_tech}`/integrationTests.`{calling_ext}`" ID="TestResources_SetStaticField":::

## Standard `{called_name}` library

To get static field from the standard `{called_name}` library:

:::code source="v2/snippets/`{calling_tech}`/`{called_tech}`/integrationTests.`{calling_ext}`" ID="StandardLibrary_GetStaticField":::

