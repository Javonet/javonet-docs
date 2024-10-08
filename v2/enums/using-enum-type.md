:::options
:title: Use `{called_name}` enum type in `{calling_name}` application
:description: This article provides an overview of working with enum types from `{called_name}` in `{calling_name}` application.
:keywords: Javonet, `{called_name}` Enum Types, `{calling_name}`, Enum Handling, Enum Values, Enum Names, Enum Conversion, Enum Methods, Enum Pass, Enum Return, Enum Item
:::

# Use `{called_name}` enum type in `{calling_name}` app
  
This article provides an introduction to cross-technology handling of `enum` type. In programming, an `enum` (short for enumeration) type is a special data type that enables for a variable to be a set of predefined constants. The variable must be equal to one of the values that have been predefined for it. Enums are used to create our own data types, just like classes. They are particularly useful when we want to represent a fixed set of constants, such as days of the week, states, colors, directions, and more. This makes the code more readable and less prone to errors.  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet, you can interact with `enum` types from `{called_name}` as if they were available in `{calling_name}`, but interaction must be performed through the Javonet SDK API. This allows you to handle and manipulate `enum` values, pass them to methods, and return them from methods, all while maintaining the type safety and readability of your `{calling_name}` code.  
  
## Custom `{called_name}` with enum type
  
With Javonet it is possible to [reference](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with its methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` which contains `enum` type.  
  
:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Enums
:display: called
:::

Javonet SDK contains various methods to interact with enums and consume the results in `{calling_name}`:  

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_EnumNameAndValue
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Enums
:display: calling
:::

This snippet uses [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) runtime bridging to load the `{called_name}` and next retrieves reference to specific `enum` type. Then two `enum` items are created. Their values and names are checked.  
  
Enum items can be passed to `{called_name}` method:

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_EnumAddToList
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Enums
:display: calling
:::

In this example, two `enum` items are created, too. Then array of enums is created and passed to method which adds `enum` items to list.  
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
