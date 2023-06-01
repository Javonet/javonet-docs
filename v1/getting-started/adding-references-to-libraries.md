:::options
:title: Adding references to libraries
:description: Adding references to libraries
:related_articles: getting-started/installing-javonet, getting-started/activating-javonet, getting-started/xml-configuration-file
:::

# Adding references

## Adding references `{called_name}` to at runtime

Javonet allows you to use any library from `{called_name}`. As with any regular application, you need to reference the libraries you are planning to use. You can reference any JAR file or DLL file on your computer or registered in GAC, as well as any library from the .NET Framework.  

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_AddReference
:display: calling
:::

As argument you provide the relative or full path to `{called_name}`. If your package has dependencies on other packages you should add reference to each package first.  

Now you can access any objects stored in this package. Use static classes, create instances, call methods, use fields and properties and much more.

## Java 

**NOTE**  
By default Javonet references mscorlib from the .NET framework

## Adding references to .NET libraries from memory stream  
  
If you are planning to embed all your .NET code in single JAR file either for simplifying deployment procedures, hiding the unnecessary complexity from the user or because your project is Java applet, you can use the possibility of adding references to .NET libraries using memory stream.  
  
To add reference using memory stream call the **Javonet.addReference("dll name", dll_byte_array);** method. Javonet still requires to provide the DLL name for caching and listing purposes. The name can be either full name with ".dll" extension or just the DLL name or easy to understand alias. The second argument is the DLL byte array. You need to load your .NET DLL from embedded resource in your JAR file, from disk or other location into the byte array and pass that array as argument to this method.  
  
If your DLL has dependency reference to other DLL you should load all the dependencies and target library using addReference before starting any operations on the types stored in those libraries. Javonet will automatically resolve the dependant types from DLLs provided.

You can pass both byte[] or boxed Byte[] however Byte[] is preferred. In case of passing unboxed byte[] array Javonet will perform the boxing internally before passing the array to .NET.  
  
See the example below how you can add reference to .NET library using byte array:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_AddReferenceMemoryStream
:display: calling
:::

To completely hide the .NET DLLs from end-user you can embed them in your JAR file and load using InputStreams. Example below shows how to convert JAR file embedded resource into byte array and pass to addReference method:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: AddEmbeddedDllReference
:display: calling
:::

Usage:  

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_AddReferenceMemoryStream2
:display: calling
:::


## Adding references to `{called_name}` through an XML configuration file

There are many benefits to setting up Javonet using an XML configuration file. It simplifies distribution of your application to your team, lets you update the Javonet references more quickly, and avoids hardcoded referenced DLLs details.  
  
Before the first usage Javonet looks for XML configuration file and loads defined references. Using XML references you can still add additional libraries in Java code using standard approach.  
  
Sample Javonet XML configuration file with references:  

:::code source="v1/snippets/xml-configuration-files/references/javonet.xml":::



