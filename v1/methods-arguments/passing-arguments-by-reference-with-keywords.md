:::options
:title: Passing Arguments by Reference with "ref" and "out" Keywords
:description: Passing Arguments by Reference with "ref" and "out" Keywords
:related_articles: methods-arguments/passing-reference-type-arguments, methods-arguments/passing-typeof-type-as-method-argument, methods-arguments/calling-overloaded-method-passing-null-argument
:::

## Passing Arguments by Reference with "ref" and "out" Keywords
  
Microsoft .NET allows you to create methods that expect arguments to be passed by reference.  
Passing by reference is introduced by explicitly setting **ref** or **out** keywords before argument type within the method definition. For example, **void MyMethod(ref int arg1)**.  
  
**Note** Passing arguments by reference should not be confused with passing reference-type arguments described in the previous section. If you need just to pass another .NET object in method arguments, please see the previous section.  
  
Javonet allows you to pass by reference both .NET objects (NObject) or primitive types (String, Integer, Float, Boolean etc..). You can also pass arrays of these types like NObject[] or String[].  
  
While passing variables by reference, the value of that variable might be modified within the method body. Read more about .NET **ref** and **out** keywords here:  
  
- [ref keyword](http://msdn.microsoft.com/en-us/library/14akc2c7.aspx)
- [out keyword](http://msdn.microsoft.com/en-us/library/t3c3bfhx.aspx)

  
Javonet allows you to invoke methods expecting **ref** or **out** arguments by providing two dedicated types: NRef and NOut. To pass the variable by reference, you must wrap the variable with the NRef or NOut class. For NObject and NObject[], you can wrap them with NRef or NOut directly. However because Java does not support passing by reference primitive types, both variables (like String, Integer, Boolean etc.) or arrays of them should be wrapped with the "AtomicReference<?>" class, and then wrapped with NRef or NOut object.  
  
Example .NET class with expecting "ref" argument method:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

Example of a **ref** argument method from Java using Javonet

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_PassArgumentWithRefKeyword
:display: calling
:::


Example of a **out** argument method from Java using Javonet

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_PassArgumentWithOutKeyword
:display: calling
:::

