:::options
:title: Getting values for instance fields and properties
:description: This article provides an overview of getting values for instance fields and properties
:::

# Working with instance fields and properties

## Custom `{called_name}` library

Assuming we have a library written for `{called_name}` with the following class in it:

:::code source="v2/snippets/testResources/`{called_technology}`/TestClass.`{called_ext}`":::

Using this values:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="TestResources_TestClassValues":::

To get instance field from the custom `{called_name}` library:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="TestResources_GetInstanceField":::

## Standard `{called_name}` library

To get instance field from the standard `{called_name}` library:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="StandardLibrary_GetInstanceField":::

