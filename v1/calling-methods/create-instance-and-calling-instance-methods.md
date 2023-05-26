:::options
:title: Creating instance and calling instance methods
:description: This section describes how to invoke instance methods
:::

# Creating instance and calling instance methods

JavOnet lets you create instances of any type from `{called_name}`.

Assuming we have a custom .NET Framework DLL with the following class inside

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To create instance and invoke instance method from this class:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_CreateInstanceAndInvokeMethod
:display: calling
:::

JavOnet calls are very similar to regular .NET or Java calls, with a little bit of reflection style. Value-type results are automatically converted into `{called_name}` types so you can safely assign them to `{called_name}` variables. Reference-type results must be assigned to NObject\JObject variable.

Any calls to .NET objects using Javonet can be shortened and simplified using our Fluent interface
