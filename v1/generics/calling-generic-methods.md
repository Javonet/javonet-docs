:::options
:title: Calling generic methods
:description: This section describes how to invoke static methods
:related_articles: working-with-objects/creating-instance-of-generic-object
:::

# Calling generic methods

With Javonet you can very easily invoke any generic instance or static method. To call a generic method, you need to provide types that will be used during the method invocation. Those types can be passed as an instance of NType objects initialized with particular .NET types.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To use generic methods from this class:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GenericMethods
:display: calling
:::
  
- Create an instance of our GenericSample class.
- Using the generic method, initialize the generic method invocation by passing one or many generic types of arguments.
- Invoke your method with a sample argument.  
  
Javonet.getType(typeName) returns an instance of NType object attached to a specific .NET type. The instruction NType myType = Javonet.getType("String") is the Java equivalent of the .NET Type myType = typeof(String).

(See Live Example!)[http://lab.javonet.com/e/3]
