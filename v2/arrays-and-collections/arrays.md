:::options
:title: Arrays overview
:description: This article provides general description of working with arrays
:keywords: Javonet, `{called_technology}` Arrays, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, Array Handling, Array Manipulation, Array Access, Array Iteration, Array Size, Array Elements
:::

# Working with arrays

Data structures are one of the essential aspects of every piece of software. Any application, from simple command line util to scalable enterprise systems, constantly process various information, that very often require specific grouping and access strategies. This aspect is addressed by arrays and more advanced collection types. By using the Javonet framework, users gain ability to easily and effectively work with data structures originating from `{called_name}`.  
  
This article provides an introduction to cross-technology handling of arrays from `{called_name}` using `{calling_name}`.

With Javonet you can interact with arrays from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API. 

## Working with arrays
  
With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with arrays declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
This section present sample custom `{called_name}` with class declaring method which returns array and Javonet SDK syntax required to use that array and consume the results in `{calling_name}`.  
  
Code example below represents the sample code from `{called_name}` that will be used in following sections.  
  
:::code 
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: called
:::

It is possible to invoke method which returns array from `{called_name}` using following `{calling_name}` code. This uses in memory runtime bridging to load the `{called_name}`, and next retrieves reference to specific type, create object of the type, and invoke method which returns array. Result of the invocation is returned as a reference to the array.

## Get element of the array  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_GetIndex
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

## Set element of the array  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_SetIndex
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

## Get size of the array  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_GetSize
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::


## Iterate over the array  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_Iterate
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

## Pass array as argument  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_PassArrayAsArgument
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

## Retrieve array  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_RetrieveArray
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

## Optional [] Operator

For technologies which supports operator overloading it is possible to use array's [] operator as for any other `{calling_name}` array:

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_GetElement
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

And  

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_1DArray_SetElement
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::