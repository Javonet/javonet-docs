:::options
:title: Invoking static methods
:description: This article provides an overview of invoking static methods from other technology with Javonet
:::

# Invoking static methods

## Custom {called_name} library

Assuming we have a library written for {called_name} with the following class in it:

:::code source="v2/snippets/testResources/`{called_tech}`/TestClass.`{called_ext}`":::

To invoke static method from the custom {called_name} library with {calling_name} code:

:::code source="v2/snippets/`{calling_tech}`/`{called_tech}`/integrationTests.`{calling_ext}`" ID="TestResources_InvokeStaticMethod":::

## Standard {called_name} library

To invoke static method from standard `{called_name}` library:

:::code source="v2/snippets/`{calling_tech}`/`{called_tech}`/integrationTests.`{calling_ext}`" ID="StandardLibrary_InvokeStaticMethod":::
