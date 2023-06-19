:::options
:title: Invoking static method
:description: This section describes how to invoke static methods
:related_articles: calling-methods/create-instance-and-calling-instance-methods, getting-started/fluent-interface
:::

# Invoking Static Methods

To invoke the static method, first get the particular type and call invoke providing method arguments.  

Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To invoke static method from this class:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeStaticMethod
:display: calling
:::

The invoke method allows you to call any static or method with or without arguments. Value-type arguments are automatically translated to appropriate types, and you can also pass referenced arguments. If method has no arguments you just call it using **Invoke("methodName")**. If called method expects arguments you can pass them as arguments to Invoke method.  
  
Any calls to .NET or Java objects using Javonet can be shortened and simplified using Javonet Fluent interface.  
  
[**See Live Example!**](http://lab.javonet.com/e/1)