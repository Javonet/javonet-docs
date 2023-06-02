:::options
:title: Working with collections
:description: Working with collections
:related_articles: arrays-and-collections/using-value-type-and-reference-type-arrays.md, arrays-and-collections/working-with-arrays.md
:::
  
# Working with collections  

Data structures are one of the essential aspects of every piece of software that has ever been written. Any
application, from simple command line util to scalable enterprise systems, constantly process various
information, that very often require specific grouping and access strategies. This aspect is addressed by
arrays and more advanced collection types available both in Java and .NET environments. By using the
Javonet framework, users gain ability to easily and effectively work with data structures originating
from the other platform.  
 
I'll be working with the following pseudo-service class, which main purpose is to produce and consume various collection types.

:::code 
:called_source: v1/snippets/`{called_technology}`/CollectionService.`{called_ext}`
:display: called
:::
  
## Retrieving and handling collections  
  
Collection-type objects retrieved by the Javonet framework, are accessible via the NObject/JObject class instances on the `{calling_name}` side. Therefore working with these objects is really simple, as I'll show in the next few examples.  
  
The following code retrieves an instance of a Set<String> class by invoking the parameterless "GetSet"
method of the CollectionService object. We can access various attributes of our set with the
NObject.get(String propertyName, Object… args) or invoke any of its available methods using
NObject.invoke(String methodName, Object… args). It's worth mentioning that the result type of
these methods can be parametrized, relieving us from manual type-checking-and-casting steps.  
  
In the example below, we're using this approach to check the size of the received Set<String> object, as well as use the collection enumerator object, to iterate over the contained strings. Unfortunately, as the NObject class does not implement Java Iterable interface, it is not possible to simply use the NObject in the for-each loop. Also, since set does not allow for index-based access to the contained elements, using enumerator can be considered primary method of collection traversal.  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Collections_GetSet
:display: calling
:::
  
In contrast to sets, lists and dictionaries do allow its users for selective access to the contained objects. For this purpose, we'll be using the NObject.getIndex(Object index) method, which is only applicable for
NObjects representing .NET types allowing for such access. In case you would try to invoke this method
on a non-indexed .NET object, Javonet framework will throw a JavonetException, stating that given .NET
class does not provide indexed values.  
  
The following two examples present usage of this approach against List<String> and Dictionary<String, String> objects retrieved from .NET code.  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Collections_GetList
:display: calling
:::

Dictionary:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Collections_GetDictionary
:display: calling
:::


## Passing collections  
  
Sending collection-type objects from Java to .NET is no different from passing any other object. All we are required to do is grab the NObject instance, representing specific .NET collection object and use it in the method call. In the following example, we'll instantiate, populate and send a simple .NET list of strings as an argument to the "UseList" method of our .NET CollectionService object. This should result in printing all of the list's contents to standard output stream.  
  
As I'll be using parametrized versions of .NET collection types, I am assuming you are familiar with the Javonet-way of instantiating such objects. In case you're not, I strongly encourage you to have a look at respective section of Quick Guide, available on the Javonet home page.  
  
Similarly as when retrieving collections from .NET, the approach for sending NObject instances as arguments of method calls, can also be applied for setting .NET object's properties etc.  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Collections_UseList
:display: calling
:::

Here's another example in which we're creating a Dictionary<String,String> object, populate it and
pass it as an argument to our .NET CollectionService object's "UseDictionary" method. Exactly as in
previous example, we should get contents of our dictionary object in the standard output stream.

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_Collections_UseDictionary
:display: calling
:::


## Summary  
  
In this article we've focused on working with collections using Javonet framework. We've briefly explained basic techniques of handling collection objects, covering retrieval, enumeration- and index-based access to their contents, as well as instantiation and usage as arguments in the method calls.
  
