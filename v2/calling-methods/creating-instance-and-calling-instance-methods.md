:::options
:title: Creating instance and calling instance method
:description: This article provides an overview of Creating instance and calling instance method
:related_articles: calling-methods/invoking-static-method
:::

## Creating instance and calling instance method
  
This article provides an introduction to cross-technology invocation of instance methods when calling a instance method from `{called_name}` using `{calling_name}`. The article explains how to create instance of class and invoke any instance method, pass arguments and retrieve the results.  
  
With Javonet you can interact with classes from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API, passing type and method name as string.   
  
Javonet allows you to pass any `{calling_name}` value type as argument to instance method from `{called_name}`. In example: int, float, string, char, long and other. For reference type arguments (instances of other classes) you can create such instance with Javonet and pass the Invocation Context variable referencing that object as argument of static method invocation.   
  
## Creating instance and calling instance method from custom `{called_name}`
  
With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with public methods declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
This section present sample custom `{called_name}` with class declaring methods and Javonet SDK syntax required to create object and invoke that methods and consume the results in `{calling_name}`.  
  
Code example below represents sample code from `{called_name}` that will be used in following sections:  
  
:::code 
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Methods
:display: called
:::
  
It is possible to invoke one of the declared instance methods from `{called_name}` using following `{calling_name}` code. This uses in memory runtime bridging to load the `{called_name}`, and next retrieves reference to specific type, creates object of the type, and invokes the instance method passing value type arguments. Result of the invocation is returned as regular `{calling_name}` value and can be used for further processing.  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeInstanceMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Methods
:display: calling
:::

## Standard `{called_name}`

The same steps are required to use types and methods from standard `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_InvokeInstanceMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::