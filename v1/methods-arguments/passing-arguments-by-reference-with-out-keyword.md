:::options
:title: Passing Arguments by Reference with "out" keywords
:description: Passing Arguments by Reference with "out" keywords
:related_articles: methods-arguments/passing-reference-type-arguments, methods-arguments/passing-arguments-by-reference-with-ref-keyword, methods-arguments/passing-typeof-type-as-method-argument, methods-arguments/calling-overloaded-method-passing-null-argument
:::

## Passing Arguments by Reference with "out" keyword
  
Microsoft .NET allows you to create methods that expect arguments to be passed by reference.  
Passing by reference is introduced by explicitly setting **ref** or **out** keywords before argument type within the method definition. For example, **void MethodWithRefArg(ref int arg)**.  
  
**Note:** Passing arguments by reference should not be confused with passing reference-type arguments described in the previous section. If you need just to pass another .NET object in method arguments, please see the previous section.  
  
Javonet allows you to pass by reference both .NET objects (NObject) or primitive types (String, Integer, Float, Boolean etc..). You can also pass arrays of these types like NObject[] or String[].  
  
While passing variables by reference, the value of that variable might be modified within the method body. Read more about .NET **ref** and **out** keywords here:  
  
- [ref keyword](http://msdn.microsoft.com/en-us/library/14akc2c7.aspx)
- [out keyword](http://msdn.microsoft.com/en-us/library/t3c3bfhx.aspx)

  
Javonet allows you to invoke methods expecting **out** arguments by providing dedicated type: NOut. To pass the variable by reference, you must wrap the variable with the NOut class. For NObject and NObject[], you can wrap them with NOut directly. However because Java does not support passing by reference primitive types, both variables (like String, Integer, Boolean etc.) or arrays of them should be wrapped with the "AtomicReference<?>" class, and then wrapped with NOut object.  

Example .NET class with expecting **out** argument method:

:::code 
:called_source: v1/snippets/`{called_technology}`/PopulateItems.`{called_ext}`
:display: called
:::

Example of a **out** argument method from Java using Javonet

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_PassArgumentWithOutKeyword
:display: calling
:::

  
Example of a **out** argument method from Java using Javonet

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_PassArgumentWithOutKeyword
:display: calling
:::
