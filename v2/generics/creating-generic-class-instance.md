:::options
:title: Creating generic class instance from `{called_name}` in `{calling_name}`
:description: This article provides an overview of creating generic class instance from `{called_name}` in `{calling_name}`
:related_articles: generics/calling-generic-static-method, generics/calling-generic-instance-method
:keywords: Javonet, `{called_name}` Generic Class Instance, `{calling_name}`, Class Instantiation, Generic Classes, Type Parameters, Generic Arguments, Object Creation, Custom `{called_technology}`, Public Classes, Value Type Arguments, Reference Type Arguments
:::

# Create generic class instance from `{called_name}` in `{calling_name}`  

This article provides an introduction to cross-technology handling of generic class instance. A generic class in programming is a class that can work with any data type. The data type is specified as a parameter at the time of creating an instance of the class. This allows for type-safe code reusability. A single class or method can be used with different data types without the need for multiple implementations. It is described in detail in [article about generic classes in .NET](https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/generics/generic-classes) and [article about generics in Java](https://docs.oracle.com/javase/tutorial/extra/generics/simple.html).  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet you can interact with generic classes from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API.  
  
Javonet allows you to pass any `{calling_name}` value type as argument to method from `{called_name}`. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the [Invocation Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/invocation-context) variable referencing that object as argument of method invocation.  
  
## Generic class from framework in `{calling_name}`
  
It is possible to create generic class instance and interact with its methods from `{called_technology}` framework using following `{calling_name}` code:
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_CreateInstanceOfGenericClass
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::

This snippet uses [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) runtime bridging to start called technology.  
Next, instance of generic class is created.
While creating instance of .NET generic class it is necessary to pass method name, type and arguments.  
While creating instance of Java generic class it is necessary to pass method name and arguments.  
Next, instance method are invoked to interact with created instance.  
Finally, the result is printed to console.  
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway.md). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
