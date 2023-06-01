:::options
:title: Disposing of objects
:description: Disposing of objects
:related_articles: disposing-and-garbage-collection/batching-gc-with-delaygccontext
:::

# Disposing of objects  
  
You can integrate the Java garbage collector with your .NET objects using Javonet. When you create an .NET object and store it in a Java variable, it will be handled in .NET process as long as your variable lives in the Java memory.  
  
When Java collects the NObject object, this event is passed to .NET, and the corresponding .NET object is disposed and collected. If the .NET object implements the IDisposable interface, then the appropriate disposal procedure is followed.  
  
You can also force object disposal by calling the "Dispose" method on the "NObject" object. Javonet exposes the dedicated "Dispose" method for closing all objects and releasing .NET memory. This method should be called only at the end of your Java application.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To see how destructor fro .NET works:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_DisposeObject
:display: calling
:::
  