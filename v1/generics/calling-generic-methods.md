:::options
:title: Invoking static method
:description: This section describes how to invoke static methods
:::

# Invoking Static Methods

To invoke the static method, first get the particular type and call invoke providing method arguments.

Assuming we have a custom .NET Framework DLL with the following class inside

:::code source="~/v1/snippets/`{called_technology}`/SampleClass.`{ext}`" ID="SampleClass":::

:::code source="~/v1/snippets/`{calling_technology}`/`{called_technology}`/Samples.`{calling_ext}`" ID="InvokeStaticMethod":::

The invoke method allows you to call any static or method with or without arguments. Value-type arguments are automatically translated to appropriate types, and you can also pass referenced arguments. If method has no arguments you just call it using **Invoke(“methodName”)**. If your Jmethod expects arguments you can pass them as arguments to Invoke method.

