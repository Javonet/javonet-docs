:::options
:title: Passing arguments by reference with "out" keyword
:description: Passing arguments by reference with "out" keyword
:related_articles: methods-arguments/passing-reference-type-arguments, methods-arguments/passing-arguments-by-reference-with-ref-keyword, methods-arguments/passing-typeof-type-as-method-argument, methods-arguments/calling-overloaded-method-passing-null-argument
:keywords: Javonet, Out Keyword, `{called_technology}`, `{calling_name}`, Windows, Linux, MacOS, Method Arguments, Reference Arguments, NOut, AtomicReference, Method Invocation
:::

# Passing arguments by reference with "out" keyword  
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2//methods-arguments/passing-arguments-by-reference-with-out-keyword">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
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

  
Example of a **out** argument method from .NET standard library which can be invoked using Javonet:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_PassArgumentWithOutKeyword
:display: calling
:::

  
  
[**See Live Example!**](http://lab.javonet.com/e/11)