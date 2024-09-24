:::options
:title: Pass arguments by reference with ref keyword to `{called_name}` in `{calling_name}` application.
:description: This article provides an overview of passing arguments by reference with ref keyword to `{called_name}` in `{calling_name}` application.
:related_articles: methods-arguments/passing-arguments-by-reference-with-out-keyword
:keywords: Javonet, `{called_name}` Passing Arguments, `{calling_name}`, Ref Keyword, Reference Passing, Method Invocation, Argument Passing, Value Return, Multiple Return Values, Function Calls, Parameter Passing, Return Types
:::

# Pass arguments by reference with ref keyword to `{called_name}` in `{calling_name}` app
  
This article provides an introduction to cross-technology invocation of both static and instance methods which contains argument of type `ref`. Parameter modifier `ref` in C# (.NET) technology is used in a method signature to pass an argument by reference. It is described in details in [this article](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/method-parameters#ref-parameter-modifier).  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet you can interact with methods with `ref` parameter modifier from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API.

Javonet allows you to pass any `{calling_name}` value type as argument to method from `{called_name}`. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the [Invocation Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/invocation-context) variable referencing that object as argument of static method invocation.  
  
## Custom `{called_name}` with ref `{calling_name}` argument
  
With Javonet it is possible to [reference](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with its methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` which contains methods with `ref` parameter modifier.  
  
:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Refs
:display: called
:::
  
It is possible to invoke the declared methods from `{called_name}` using following `{calling_name}` code:  
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Refs
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Refs
:display: calling
:::

This snippet uses [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) runtime bridging to load the `{called_name}` and next retrieves reference to specific type.
  
Next, two reference type arguments are created. An argument that is passed to a `ref` parameter must be initialized before it's passed to a method. Two ways of initialization are presented in *create values for ref* section of the snippet.  
Fist argument (refValue1) is initialized using asRef() method with default type of passed value (int). This type matches the type of parameter in RefSampleMethod(ref int x) method.  
Second argument (refValue2) is initialized using asRef() method with specifying the exact type which should be use. "System.Int32" is an alias for int.  
  
Both values can be passed to RefSampleMethod(ref int x) method using *invokeStaticMethod(...).execute()* invocation.  
  
Each reference type argument is get as regular `{calling_name}` value using *getRefValue()* and can be used for further processing.  
  
## Custom `{calling_name}` with ref keyword
  
It is possible to invoke the declared method which contains multiple `ref` arguments from `{called_name}` using following `{calling_name}` code:
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Refs_MultipleArgs
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Refs
:display: calling
:::
  
This snippet uses [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) runtime bridging to load the `{called_name}` and next retrieves reference to specific type.
  
Next, three reference type arguments are created. An argument that is passed to a `ref` parameter must be initialized before it's passed to a method. Two ways of initialization are presented in *create values for ref* section of the snippet.  
Fist argument (refToInt) is initialized using asRef() method with default type of passed value (int). This type matches the type of first parameter in `RefSampleMethod2` method.  
Second value (refToDouble) is initialized using asRef() method with specifying the exact type which should be used. "System.Double" is an alias for double.  
Third argument (refToString) is initialized using asRef() method with default type of passed value (string).  
  
All three arguments are processed in RefSampleMethod2 and changed. Their values are obtained using getRefValue() method.
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
