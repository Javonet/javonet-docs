:::options
:title: Extending a class and wrapping methods
:description: Extending a class and wrapping methods
:related_articles: working-with-objects/creating-instance-of-generic-object
:::

# Extending a class and wrapping methods

You can extend any class from `{called_name}` by extending the `{calling_name}` class with the NObject/JObject type and then call the constructor base constructor by passing the name of the called type and arguments for its constructor as an argument.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To extend this class and wrap method from this class create the following class:

:::code 
:called_source: v1/snippets/`{calling_technology}`/`{called_technology}`/ExtendedTestClass.`{calling_ext}`
:display: called
:::

And use it like any other `{calling_name}` class

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_ExtendClassAndWrapMethod
:display: calling
:::