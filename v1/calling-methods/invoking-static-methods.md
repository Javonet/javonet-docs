:::options
:title: Invoking static method
:description: This section describes how to invoke static methods
:::

# Invoking Static Methods

To invoke the static method, first get the particular type and call invoke providing method arguments.

Sample code:

:::code 
:calling_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeStaticMethod
:display: calling
:::

The invoke method allows you to call any static or method with or without arguments. Value-type arguments are automatically translated to appropriate types, and you can also pass referenced arguments. If method has no arguments you just call it using **Invoke(“methodName”)**. If your Jmethod expects arguments you can pass them as arguments to Invoke method.

