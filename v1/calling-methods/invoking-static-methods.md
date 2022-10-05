:::options
:title: Invoking static method
:description: This section describes how to invoke static methods
:::

# Invoking Static Methods

To invoke the static method, first get the particular type and call invoke providing method arguments.

Sample code:

:::code source="~/v1/snippets/`{called_technology}`/SampleClass.`{ext}`" ID="SampleClass":::

:::code source="~/v1/snippets/`{called_technology}`/`{calling_technology}`/Samples.`{ext}`" ID="InvokeStaticMethod":::

The invoke method allows you to call any static or instance method with or without arguments. Value-type arguments are automatically translated to appropriate .NET types, and you can also pass referenced arguments