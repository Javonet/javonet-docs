:::options
:title: Invoking static methods
:description: This article provides an overview of invoking static methods from other technology with Javonet
:::

# Invoking static methods

This article provides an introduction to cross-technology invocation of static methods when calling a static method from `{called_name}` using `{calling_name}`. The article explains how to invoke any static method, pass arguments and retrieve the results.

With Javonet you can interact with static methods form `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API, passing the name of the target method as String.

Javonet allows you to pass any `{calling_name}` value type as argument to static method from `{called_name}`. In example: int, float, String, char, long and other. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the InvocationContext variable referencing that object as argument of static method invocation.

## Calling static method from custom `{called_name}`

With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with public static methods declared on types defined within that module almost the same as with any other `{calling_name}` library. 

This section present sample custom `{called_name}` with class declaring static methods and Javonet SDK syntax required to invoke that methods and consume the results in `{calling_name}`.

Code example below represents the sample class from `{called_name}` that will be used in following sections

:::code 
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Simple/TestClass.`{called_ext}`
:display: called
:::
  
Now it possible to invoke one of the declared static methods from `{called_name}` using following `{calling_name}` code. This uses in memory runtime bridging to load the `{called_name}`, and next retrieves reference to specific type and invokes the static method passing value type arguments. Result of the invocation is returned as regular `{calling_name}` value and can be used for further processing.

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeStaticMethod
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Simple/TestClass.`{called_ext}`
:display: calling
:::
 
## Calling static methods from standard `{called_name}`

To invoke static method from standard `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_InvokeStaticMethod
:called_source: v2/snippets/testResources/`{called_technology}`/TestClass_Empty/TestClass.`{called_ext}`
:display: calling
:::
