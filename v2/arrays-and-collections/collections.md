:::options
:title: Working with collections
:description: This article provides general description of working with collections
:related_articles: arrays-and-collections/one-dimensional-arrays, arrays-and-collections/multidimensional-arrays, arrays-and-collections/retrieve-array, arrays-and-collections/index-operator, arrays-and-collections/passing-array-as-method-argument, arrays-and-collections/iterate-over-array
:keywords: Javonet, `{called_technology}` Collections, `{calling_technology}`, Windows, Linux, MacOS, List, Dictionary, Collection Handling, Collection Manipulation, Collection Access, Collection Iteration, Collection Elements
:::

# Working with collections

This article provides an introduction to cross-technology handling of collections. Data structures are one of the essential aspects of every piece of software. Any application constantly process various information, that very often require specific grouping and access strategies. This aspect is addressed by arrays and more advanced collection types. By using the Javonet framework, users gain ability to easily and effectively work with data structures originating from `{called_name}`. Every collection from `{called_name}` is treated as reference.
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet you can interact with collections from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API.  

# Working with lists
  
Javonet SDK contains various methods to interact with lists and consume the results in `{calling_name}`:  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_HandleList
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::

In the snippet above, list specific to called technology framework is created.  
Then, some elements are added to the list.
Finally, this list can be handled through Javonet SDK, f.e. with getIndex method.

# Working with dictionary
  
Javonet SDK contains various methods to interact with dictionaries and consume the results in `{calling_name}`:  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_HandleDictionary
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::

In the snippet above, list specific to called technology framework is created.  
Then, some elements are added to the list.
Finally, this list can be handled through Javonet SDK, f.e. with getIndex method.
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service. In this way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
