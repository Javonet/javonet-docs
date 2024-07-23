:::options
:title: Working with `{calling_name}` exceptions from `{called_name}`
:description: This article provides an overview of working with `{calling_name}` exceptions from `{called_name}`
:keywords: Javonet, `{called_name}` Exceptions, `{calling_name}`, Exception Handling, Try-Catch, Throw Exception, Catch Exception, Exception Types, Runtime Exceptions, Checked Exceptions, Unchecked Exceptions
:::

# Exceptions `{calling_name}` from `{called_name}`
  
This article provides an introduction to cross-technology handling of exceptions. Exceptions in programming are events that occur during the execution of programs that disrupt the normal flow of instructions.  
  
Any exception thrown by called technology is handled and thrown as any other exception in `{calling_name}` code. Details of exception depend on called technology, but in most cases final exception has all the information passed by called side.  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  

## Custom `{called_name}` withe `{calling_name}` exception handling 
  
With Javonet it is possible to [reference](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with its methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
Snippet below represents the sample code from `{called_name}` which contains a chain of methods:  

:::code
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Exceptions
:display: called
:::

To invoke these methods in `{calling_name}`:
  
:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_ExceptionsFromCalledTech_InvokeStaticMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Exceptions
:display: calling
:::

The last method throws exception which is handled and rethrown in `{calling_name}`. Then the exception in catched and printed.  
  
The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway.md). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
