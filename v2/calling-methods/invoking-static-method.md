:::options
:title: Invoking static methods
:description: This article provides an overview of invoking static methods from other technology with Javonet
:::

# Invoking static methods

This article provides an introduction to cross-technology invocation of static methods when calling the `{called_name}` static method from `{calling_name}`. The article explans how to invoke any static method, pass arguments and retrieve the results.

With Javonet you can interact with `{called_name}` static methods like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API, passing the name of the target method as String.

Javonet allows you to pass any `{calling_name}` value type as argument to `{called_name}` static method. In example: int, float, String, char, long and other. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the InvocationContext variable referencing that object as argument of static method invocation.

## Sample `{called_name}` library

Code example below represents the sample `{called_name}` class that will be used in following sections to present the right syntax to invoke static methods defined in potential target `{called_name}` library.

:::code source="v2/snippets/testResources/`{called_technology}`/TestClass.`{called_ext}`":::

To invoke static method from the custom `{called_name}` library with `{calling_name}` code:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="TestResources_InvokeStaticMethod":::

## Standard `{called_name}` library

To invoke static method from standard `{called_name}` library:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="StandardLibrary_InvokeStaticMethod":::
