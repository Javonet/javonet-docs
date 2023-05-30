:::options
:title: Passing typeof(Type) as method argument
:description: Passing typeof(Type) as method argument
:related_articles: methods-arguments/passing-reference-type-arguments, methods-arguments/passing-arguments-by-reference-with-ref-keyword, methods-arguments/passing-arguments-by-reference-with-out-keyword, methods-arguments/calling-overloaded-method-passing-null-argument
:::

# Passing typeof(Type) as method argument 
  
If target .NET methods expects "Type" as argument, which is being called in .NET using Method(typeof(Some_Type)) syntax, you can call such method with NType object as argument.  

Javonet introduces "NType" class to store .NET Type. To retrieve the instance of particular .NET type as counterpart of typeof(String) you should use Javonet.getType("String") method. The "getType(String typeName)" method is static method on Javonet class which accepts in first argument the name of .NET type and returns the instance of NType class connected to the Type object of provided type. Type name argument might contain either type name or type name with full namespace. If there is only one type with selected name in loaded assemblies then Javonet will lookup the namespace automatically otherwise full namespace should be provided or exception will be thrown.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::


To use method which expects type as argument:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_PassTypeAsMethodArgument
:display: calling
:::

