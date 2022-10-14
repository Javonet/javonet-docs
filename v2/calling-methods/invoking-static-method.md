:::options
:title: Invoking static methods
:description: This article provides an overview of invoking static methods from other technology with Javonet
:::

# Invoking static methods

## Standard `{called_name}` library

To call static method from standard `{called_name}` library.

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/IntegrationTests.`{calling_ext}`" ID="StandardLibrary_InvokeStaticMethod":::

## Custom `{called_name}` library

Example how to call static method from any library written for `{called_name}`:

Assuming we have a library with the following class in it:

:::code source="v2/snippets/testResources/`{called_technology}`/TestClass.`{called_ext}`":::

We can invoke static method with the following command:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/IntegrationTests.`{calling_ext}`" ID="TestResources_InvokeStaticMethod":::