:::options
:title: Working with exceptions
:description: This article provides an overview of working with exceptions
:::

# Exceptions
  
Code example below represents the sample code from `{called_name}` that will be used in following sections.  

Any exception thrown by called technology can be handled in your `{calling_name}` code. All Javonet methods that operate on objects from `{called_name}` throw an `{calling_name}` exception when exceptions occur. You can catch exceptions, and then perform the appropriate exception handling logic.  

:::code 
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Exceptions
:display: called
:::
    
To catch and handle exception thrown from `{called_name}`:  
  
----  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_ExceptionsFromCalledTech_InvokeStaticMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Exceptions
:display: calling
:::