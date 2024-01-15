:::options
:title: Passing arguments by reference with "out" keyword
:description: This article provides an overview of passing arguments by reference with "out" keyword
:related_articles: methods-arguments/passing-arguments-by-reference-with-ref-keyword
:keywords: Javonet, `{called_technology}` Passing Arguments, `{calling_technology}`, Out Keyword, Reference Passing, Method Invocation, Argument Passing, Value Return, Multiple Return Values, Function Calls, Parameter Passing, Return Types
:::

# Argument with out keyword  
  
This article provides an introduction to cross-technology invocation of both static and instance methods which contains argument of type `out`. Parameter modifier `out` in C# (.NET) technology is used in a method signature to pass an argument by reference. It is described in details in [this article](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/method-parameters#out-parameter-modifier).  
   
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet you can interact with methods with `out` parameter modifier from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API.

Javonet allows you to pass any `{calling_name}` value type as argument to method from `{called_name}`. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the [Invocation Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/invocation-context) variable referencing that object as argument of static method invocation.  
  
## Custom `{called_name}` with out argument
  
With Javonet it is possible to [reference](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with its methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
    
Snippet below represents the sample code from `{called_name}` which contains methods with `out` parameter modifier. 
  
:::code 
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Outs
:display: called
:::
  
It is possible to invoke the declared methods from `{called_name}` using following `{calling_name}` code:  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Outs
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Outs
:display: calling
:::

This snippet uses [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) runtime bridging to load the `{called_name}` and next retrieves reference to specific type.
  
Next, two reference type arguments are created. An argument that is passed to a `out` parameter do not have to be initialized before it's passed to a method. Three ways of initialization are presented in *create values for out* section of the snippet. 
Fist way (outValue1) is initializing using asOut() method with specifying type of argument. 
Second way (outValue2) is initializing using asOut() method with specifying value and type of argument. 
Third way (outValue3) is initializing using asOut() method with specifying value of argument. 

All these values can be passed to OutSampleMethod(out string outStr) method using *invokeStaticMethod(...).execute()* invocation. 
  
Each reference type argument is get as regular `{calling_name}` value using *getRefValue()* and can be used for further processing.   
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service. In this way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
  