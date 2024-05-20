:::options
:title: Invoking static methods from `{called_name}` in `{calling_technology}`  
:description: This article provides an overview of invoking static methods from other technology with Javonet
:related_articles: calling-methods/creating-instance-and-calling-instance-methods
:keywords: Javonet, `{called_technology}` Static Methods, `{calling_technology}`, Static Method Invocation, Method Arguments, Method Results, Custom `{called_technology}`, Public Methods, Value Type Arguments, Reference Type Arguments
:::

## Invoke static methods from `{called_name}` in `{calling_technology}`
  
This article provides an introduction to cross-technology invocation of static methods.  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.
  
With Javonet you can interact with static methods from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API, passing the name of the target method as String.  
  
Javonet allows you to pass any `{calling_name}` value type as argument to static method from `{called_name}`. In example: int, float, string, char, long and other. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the [Invocation Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/invocation-context) variable referencing that object as argument of static method invocation.  
  
## Custom `{called_name}` in `{calling_technology}`
  
With Javonet it is possible to [reference](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with public static methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` which contains class and its methods:  
  
:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Methods
:display: called
:::
  
It is possible to invoke one of the declared static methods from `{called_name}` using following `{calling_name}` code.
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeStaticMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Methods
:display: calling
:::

In code snippet above you can see how easily you can activate Javonet and instruct it using [inMemory()](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) method to create new [RuntimeContext](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context) that will run `{called_technology}` runtime within your current process. Next with [addLibrary](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) method it triggers the load of required `{called_technology}` module and allows you to interact with any classes and their static methods defined in that package.
  
Further calls to invokeStaticMethod() allows to call "multiplyByTwo" `{called_technology}` static method and pass the value type arguments. With Javonet you can invoke methods with any number and any type of arguments including value type arguments, reference type arguments, arrays and collections.  
  
You can receive and further process and type of result returned by called `{called_technology}` method, regardless if it is reference type that will get returned as another instance of [Invocation Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/invocation-context) that you can use for further interaction, or value type that you can obtain as `{calling_technology}` value with getValue() method.  
  
## Framework static method in `{calling_technology}`
  
With Javonet you can interact not only with any custom `{called_technology}` module but also with any `{called_technology}` framework objects. The same steps are required to use types and methods from standard `{called_name}` framework class:
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_InvokeStaticMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::
  
In sample above you see how the Javonet allows to create an instance of `{called_name}` _Math_ class and interact with its static _abs_ method.

The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway.md). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
