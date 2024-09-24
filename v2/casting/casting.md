:::options
:title: Cast `{called_name}` variables in `{calling_name}` application
:description: This article provides an overview of casting `{called_name}` variables in `{calling_name}` application.
:keywords: Javonet, `{called_name}` Casting, `{calling_name}`, Type Casting, Data Conversion, Primitive Types, Complex Types, Explicit Casting, Implicit Casting, Cast Operator, Type Conversion
:::

# Cast `{called_name}` variables in `{calling_name}` app
  
This article provides an introduction to cross-technology handling of casting mechanism. Casting is necessary in statically-typed languages like C, C++, Java, and C#, where the data type of a variable is known at compile time. In these languages, if you want to assign a value of one type to a variable of another type, you need to perform a cast.  
  
For example, if you have an integer and you want to use it as a float, you would need to cast it to a float. This is done because different data types may be represented differently in memory, and casting ensures that the data is interpreted correctly.  
  
In contrast, dynamically-typed languages like Python or JavaScript perform most of the casting automatically, and explicit casting is less common.  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet you can interact with objects and methods from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API.  

## Custom `{calling_name}` example with `{called_name}` variables casting
  
With Javonet it is possible to [reference](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with its methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` which contains a few methods with the same name but different parameter type. Each of these methods can perform different logic so it is necessary to invoke intended method.  
  
:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Cast
:display: called
:::

It is possible to invoke each of these methods by casting the value from `{calling_technology}` to proper type specified in `{called_name}`.  
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Cast_ToUInt
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Cast
:display: calling
:::

In the snippet above, user intended to invoke CastSampleMethod with argument of specific type. Value from `{calling_technology}` has been casted to proper type and passed to CastSampleMethod. Second example shows the same steps but for different parameter type.  

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Cast_ToFloat
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Cast
:display: calling
:::

In the snippet above, user intended to invoke CastSampleMethod with argument of specific type. Value from `{calling_technology}` has been casted to proper type and passed to CastSampleMethod.  
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
