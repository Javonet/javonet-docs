:::options
:title: Invoking static methods
:description: This article provides an overview of invoking static methods from other technology with Javonet
:::

# Invoking static methods

## Standard `{called_technology}` library

To call static method from standard `{called_technology}` library.

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/IntegrationTests.`{ext}`" ID="StandardLibrary_InvokeStaticMethod":::

## Custom `{called_technology}` library

Example how to call static method from any library written for `{called_technology}`:

Assuming we have a library with the following class in it:

:::code source="v2/snippets/testResouces/`{called_technology}`/TestClass.`{called_tech_ext!!!!!!!}`":::

We can invoke static method with teh following command:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/IntegrationTests.`{ext}`" ID="TestResources_InvokeStaticMethod":::