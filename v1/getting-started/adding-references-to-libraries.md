:::options
:title: Adding references to libraries
:description: Adding references to libraries
:::

# Adding references

## Adding references `{called_name}` to at runtime

Javonet allows you to use any library from `{called_name}`. As with any regular application, you need to reference the libraries you are planning to use. You can reference any JAR file or DLL file on your computer or registered in GAC, as well as any library from the .NET Framework.  

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/sampleProgram.`{calling_ext}`
:calling_id: AddReference
:display: calling
:::

As argument you provide the relative or full path to `{called_name}`. If your package has dependencies on other packages you should add reference to each package first.  

Now you can access any objects stored in this package. Use static classes, create instances, call methods, use fields and properties and much more.

## Adding references to `{called_name}` through an XML configuration file

here are many benefits to setting up Javonet using an XML configuration file. It simplifies distribution of your application to your team, lets you update the Javonet references more quickly, and avoids hardcoded referenced DLLs details.  

Before the first usage Javonet looks for XML configuration file and loads defined references. Using XML references you can still add additional libraries in Java code using standard approach.

Sample Javonet XML configuration file with references:

## Java 

**NOTE**  
By default Javonet references mscorlib from the .NET framework

