:::options
:title: Using nested types
:description: Using nested types
:::

# Using nested types

Nested types are the classes defined within other class or struct. Javonet is able to create the instance of nested type, pass nested type as Type argument, set nested type to field or property and use nested types as generic arguments for methods and classes.  
  
More about nested types you can read in MSDN documentation: [Nested Types](http://msdn.microsoft.com/en-us/library/ms173120.aspx)  
  
Assuming we have a custom `{called_name}` with the following classes inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

And

:::code 
:called_source: v1/snippets/`{called_technology}`/Container.`{called_ext}`
:display: called
:::

To reference nested type with full namespace the name of the nested class should be prefixed with namespace, name of parent class and "+" sign. For example the "Nested" class defined above could be access using following path "TestNamespace.Container+Nested". Following examples show how to initialize and work with nested types using full namespace.  
  
:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_UseNestedTypes
:display: calling
:::
  
  
[**See Live Example!**](http://lab.javonet.com/e/18)
