:::options
:title: Passing array from `{calling_name}` as method argument to `{called_name}`
:description: This article provides general description of passing array from `{calling_name}` as method argument to `{called_name}`
:related_articles: arrays-and-collections/one-dimensional-arrays, arrays-and-collections/multidimensional-arrays, arrays-and-collections/collections, arrays-and-collections/retrieve-array, arrays-and-collections/index-operator, arrays-and-collections/iterate-over-array
:keywords: Javonet, `{called_name}` Arrays, `{calling_name}`, Windows, Linux, MacOS, Array Handling, Array Manipulation, Array Access, Array Iteration, Array Size, Array Elements
:::

# Passing array from `{calling_name}` as method argument to `{called_name}`

This article shows how to pass array as an argument.
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
## Custom `{called_name}` with method accepting array
  
With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with arrays declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` that has methods which return or process the arrays:
  
:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: called
:::

With Javonet SDK it is possible to pass array as an argument to one of this method.  
  
## Passing `{calling_name}` array
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_PassArrayAsArgument
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

In the snippet above, addArrayElementsAndMultiply method needs array to be the first argument. Depending on called technology, the array may need to have a specific type, f. e. array of doubles. In this case, proper cast is needed before passing the array from `{calling_name}`.  
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
