:::options
:title: Adding references to libraries
:description: Adding references to libraries
:::

# Adding references to libraries

Javonet allows you to use any library from all supported technologies. As with any regular application, you need to reference the libraries you are planning to use. 

You can call:

:::code source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`" ID="TestResources_LoadLibrary":::


As argument you provide the relative or full path to file or package. 
If your package has dependencies on other packages you should add reference to each package first.

Now you can access any objects stored in this package. 
Use static classes, create instances, call methods, use fields and properties and much more.
