:::options
:title: Calling generic instance method
:description: This article provides an overview of calling generic instance method
:related_articles: generics/calling-generic-static-method, generics/creating-generic-class-instance
:keywords: Javonet, `{called_technology}` Generic Instance Method, `{calling_technology}`, Method Invocation, Generic Methods, Type Parameters, Generic Arguments, Method Results, Custom `{called_technology}`, Public Methods, Value Type Arguments, Reference Type Arguments
:::

# Call generic instance method
  
This article provides an introduction to cross-technology invocation of instance generic methods. Generic methods in C# (.NET) and Java technologies are methods that are declared with the type parameter in its signature, allowing it to be used with any data type. It is described in detail in [article about generic methods in .NET](https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/generics/generic-methods) and [article about generic methods in Java](https://docs.oracle.com/javase/tutorial/extra/generics/methods.html).  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet you can interact with generic itstance methods from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API.  
  
Javonet allows you to pass any `{calling_name}` value type as argument to method from `{called_name}`. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the [Invocation Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/invocation-context) variable referencing that object as argument of method invocation.  
  
## Custom `{called_name}` with generic methods
  
With Javonet it is possible to [reference](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with its methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` which contains generic methods.
  
:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Generics
:display: called
:::
  
It is possible to invoke the declared methods from `{called_name}` using following `{calling_name}` code:
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GenericInstanceMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Generics
:display: calling
:::

This snippet uses [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) runtime bridging to load the `{called_name}` and next retrieves reference to specific type.  

Next, generic instance method is invoked and the result is printed to console.  
  
To invoke method which has more than one type specified:  
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GenericMethodWithTwoTypes
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Generics
:display: calling
:::
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service. In this way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
