:::options
:title: Invoking static methods
:description: This article provides an overview of invoking static methods from other technology with Javonet
:::

# Invoking static methods

This article provides an introduction to cross-technology invocation of static methods when calling the `{called_name}` static method from `{calling_name}`. The article explains how to invoke any static method, pass arguments and retrieve the results.

With Javonet you can interact with `{called_name}` static methods like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API, passing the name of the target method as String.

Javonet allows you to pass any `{calling_name}` value type as argument to `{called_name}` static method. In example: int, float, String, char, long and other. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the InvocationContext variable referencing that object as argument of static method invocation.

## Calling static method in custom `{called_name}` library

With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` library and interact with public static methods declared on types defined within that module almost the same as with any other `{calling_name}` library. 

This section present sample custom `{called_name}` package with class declaring static methods and Javonet SDK syntax required to invoke that methods and consume the results in `{calling_name}`.

Code example below represents the sample `{called_name}` class that will be used in following sections

:::code source="v2/snippets/testResources/`{called_technology}`/TestClass.`{called_ext}`":::
  
To interact with this library there are defined two variables pointing to `{called_name}` package and class.

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="TestResources_TestClassValues":::
 
Now it possible to invoke one of the declared `{called_name}` static methods using following `{calling_name}` code. This uses in memory runtime bridging to load the `{called_name}` package, and next retrieves reference to specific type and invokes the static method passing value type arguments. Result of the invocation is returned as regular `{calling_name}` value and can be used for further processing.

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="TestResources_InvokeStaticMethod":::
 
## Calling static methods in `{called_name}` library

To invoke static method from standard `{called_name}` library:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="StandardLibrary_InvokeStaticMethod":::
