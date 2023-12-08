:::options
:title: Multidimensional arrays
:description: This article provides general description of working with multidimensional arrays
:::

# Multidimensional arrays

Data structures are one of the essential aspects of every piece of software. Any application, from simple command line util to scalable enterprise systems, constantly process various information, that very often require specific grouping and access strategies. This aspect is addressed by arrays and more advanced collection types. By using the Javonet framework, users gain ability to easily and effectively work with data structures originating from `{called_name}`.  
  
This article provides an introduction to cross-technology handling of multidimensional arrays from `{called_name}` using `{calling_name}`. The article explains how to work with arrays between calling and called technology.  

With Javonet you can interact with arrays from `{called_name}` like they were available in `{calling_name}` but invocation must be performed through Javonet SDK API. 

## Working with arrays custom `{called_name}`  
  
With Javonet it is possible to [reference](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/adding-references-to-libraries) any custom `{called_name}` and interact with arrays declared on types defined within that module almost the same as with any other `{calling_name}` library.  
  
This section present sample custom `{called_name}` with class declaring method which returns array and Javonet SDK syntax required to use that array and consume the results in `{calling_name}`.  
  
Code example below represents the sample code from `{called_name}` that will be used in following sections.  
  
:::code 
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: called
:::

It is possible to invoke method which returns array from `{called_name}` using following `{calling_name}` code. This uses in memory runtime bridging to load the `{called_name}`, and next retrieves reference to specific type, create object of the type, and invoke method which returns array. Result of the invocation is returned as a reference to the array.

## Get element of 2D array  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_2DArray_GetIndex
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

## Set element of 2D array  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_2DArray_SetIndex
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::

## Get size and rank of 2D array  
  
:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_2DArray_GetSizeAndRank
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Arrays
:display: calling
:::