:::options
:title: Create `{called_name}` instance and call instance method in `{calling_name}` application
:description: This article provides an overview of creating instances and calling instance methods from `{called_name}` in `{calling_name}` application.
:related_articles: calling-methods/invoking-static-method
:keywords: Javonet, `{called_name}` Instance Creation, `{calling_name}`, Instance Methods, Method Invocation, Object Creation, Method Arguments, Method Results, Custom `{called_technology}`, Public Methods, Value Type Arguments, Reference Type Arguments
:::

# Create `{called_name}` instance and call instance method in `{calling_name}` app
  
This article provides an introduction to cross-technology creation of instances of classes and invocation of instance methods.
  
With Javonet you can interact with classes from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API, passing type and method name as string.  
  
Javonet allows you to pass any `{calling_name}` value type as argument to instance method from `{called_name}`. In example: int, float, string, char, long and other. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the Invocation Context variable referencing that object as argument of static method invocation.  
  
## Use custom `{called_name}` classes in `{calling_name}` application
  
With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with public methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
This section present sample custom `{called_name}` with class declaring methods and Javonet SDK syntax required to create object and invoke that methods and consume the results in `{calling_name}`.  
  
Snippet below represents the sample code from `{called_name}` which contains class and its methods:  
  
:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Methods
:display: called
:::
  
It is possible to invoke one of the declared instance methods from `{called_name}` using following `{calling_name}` code.  
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeInstanceMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Methods
:display: calling
:::

In code snippet above you can see how easily you can activate Javonet and instruct it using [inMemory()](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) method to create new [RuntimeContext](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context) that will run `{called_technology}` runtime within your current process. Next with [addLibrary](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) method it triggers the load of required `{called_technology}` module and allows you to interact with any classes and their methods defined in that package.  
  
Further call to createInstance() allows to create instance of class.

Calls to invokeInstanceMethod() allows to call "multiplyTwoNumbers" `{called_technology}` instance method and pass the value type arguments. With Javonet you can invoke methods with any number and any type of arguments including value type arguments, reference type arguments, arrays and collections.  
  
You can receive and further process and type of result returned by called `{called_technology}` method, regardless if it is reference type that will get returned as another instance of [Invocation Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/invocation-context) that you can use for further interaction, or value type that you can obtain as `{calling_technology}` value with getValue() method.  
  
## Use framework classes in `{calling_name}` application

The same steps are required to use types and methods from standard `{called_name}`:

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_InvokeInstanceMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::

The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
