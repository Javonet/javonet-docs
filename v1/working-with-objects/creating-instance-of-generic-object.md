:::options
:title: Creating instance of generic objects
:description: Creating instance of generic objects
:related_articles: generics/calling-generic-methods, working-with-objects/extending-a-class-and-wrapping-methods
:::

# Creating instance of generic objects

Javonet allows you to create instances of generic objects. To initialize generic class first type with expected generic type should be created. Next to initialize the instance of generic type call the "create()" method on the object.  
  
**Important** Notice that while initializing NType for generic class there is apostrophe with number of generic arguments provided which let's Javonet recognize which generic class should be initialized. For example for List<T> class, the List<Strings> can be obtained by calling Javonet.getType("List`1","String"). As first argument we provide generic type name and number of generic arguments and as second argument the name of the type to be used as generic type. If class expects more then one generic type they should be passed as further arguments of getType method.  
  
To create instance of generic class:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_CreateInstanceOfGenericObject
:display: calling
:::
  
