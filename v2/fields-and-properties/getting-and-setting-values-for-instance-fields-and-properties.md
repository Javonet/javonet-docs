:::options
:title: Getting and setting values for instance fields and properties
:description: This article provides an overview of getting values for instance fields and properties
:related_articles: fields-and-properties/getting-and-setting-values-for-static-fields-and-properties
:keywords: Javonet, `{called_technology}` Instance Fields, `{calling_technology}`, Instance Properties, Field Access, Property Access, Field Modification, Property Modification, Instance Field Values, Instance Property Values, Get Field, Set Field, Get Property, Set Property
:::

# Instance fields and properties  
  
This article provides an introduction to cross-technology handling of static fields and properties.  

Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet you can interact with instance field and properties from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API.  
  
Javonet allows you to pass any `{calling_name}` value type as argument to method from `{called_name}`. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the [Invocation Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/invocation-context) variable referencing that object as argument of method invocation.  
  
## Get/Set instance field from custom `{called_name}`
  
With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with public instance fields and properties declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` which contains class with fields:

:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Fields
:display: called
:::

It is possible to get one of the declared instance fields from `{called_name}` using following `{calling_name}` code.  
  
:::code  
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_GetInstanceField
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Fields
:display: calling
:::

This uses in memory runtime bridging to load the `{called_name}`, and next retrieves reference to specific type and gets the instance field. Result of the invocation is returned as regular `{calling_name}` value and can be used for further processing.

It is possible to set one of the declared instance fields from `{called_name}` using following `{calling_name}` code.  

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_SetInstanceField
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Fields
:display: calling
:::

This uses in memory runtime bridging to load the `{called_name}`, and next retrieves reference to specific type, then sets and gets the instance field. Result of the invocation is returned as regular `{calling_name}` value and can be used for further processing.

## Get/Set instance field from standard `{called_name}`

The same steps are required to get types and fields from framework `{called_name}`:

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_GetInstanceField
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::

The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service. In this way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
