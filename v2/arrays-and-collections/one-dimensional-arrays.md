:::options
:title: Use 1D `{called_name}` arrays in `{calling_name}` application
:description: This article provides general description of working with one-dimensional arrays from `{called_name}` in `{calling_name}` application.
:related_articles: arrays-and-collections/multidimensional-arrays, arrays-and-collections/collections, arrays-and-collections/retrieve-array, arrays-and-collections/index-operator, arrays-and-collections/passing-array-as-method-argument, arrays-and-collections/iterate-over-array
:keywords: Javonet, Arrays, `{called_name}`, `{calling_name}`, Windows, Linux, MacOS, Array Handling, Array Manipulation, Array Access, Array Iteration, Array Size, Array Elements
:::

# Use 1D `{called_name}` arrays in `{calling_name}` app

This article provides an introduction to cross-technology handling of one-dimensional arrays. Data structures are one of the essential aspects of every piece of software. Any application constantly process various information, that very often require specific grouping and access strategies. This aspect is addressed by arrays and more advanced collection types. By using the Javonet framework, users gain ability to easily and effectively work with data structures originating from `{called_name}`. Every array from `{called_name}` is treated as reference.
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet you can interact with arrays from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API.  

## Custom `{called_name}` with arrays handling
  
With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with arrays declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` that has methods which return or process the arrays:
  
:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: called
:::

Javonet SDK contains various methods to interact with arrays and consume the results in `{calling_name}`:  

## Get element from `{called_name}` 1D array in `{calling_name}` application
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_GetIndex
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

In the snippet above, get1DArray method is used to get reference to 1D array from `{called_name}`. Method getIndex is used to get element from the array.

## Set element from `{called_name}` 1D array in `{calling_name}` application
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_SetIndex
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

In the snippet above, get1DArray method is used to get reference to 1D array from `{called_name}`. Method setIndex is used to set element of the 1D array. First argument is index, second argument is new value.  

## Get size and rank of `{called_name}` 1D array in `{calling_name}` application  
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_GetSize
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

In the snippet above, get1DArray method is used to get reference to 1D array from `{called_name}`. Method getSize is used to get number of elements of the array.  
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
