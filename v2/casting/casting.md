:::options
:title: casting values
:description: This article provides an overview of casting values with Javonet
:::

# Casting
  
Code example below represents the sample code from `{called_name}` that will be used in following sections.  
  
:::code 
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Methods
:display: called
:::
    
It is possible to invoke one of the declared static methods from `{called_name}` using following `{calling_name}` code. This uses in memory runtime bridging to load the `{called_name}`, and next retrieves reference to specific type and invokes the static method passing value type arguments. Result of the invocation is returned as regular `{calling_name}` value and can be used for further processing.
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_InvokeStaticMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Methods
:display: calling
:::
   
## Calling static methods from standard `{called_name}`
  
The same steps are required to use types and methods from standard `{called_name}`:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_InvokeStaticMethod
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::
