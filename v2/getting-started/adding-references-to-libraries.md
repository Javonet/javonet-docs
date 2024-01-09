:::options
:title: Adding references to libraries
:description: This article provides information about adding references to libraries
:related_articles: getting-started/about-javonet, getting-started/getting-started-dotnet, getting-started/getting-started-java, getting-started/getting-started-perl, getting-started/getting-started-python, getting-started/getting-started-ruby, getting-started/getting-started-nodejs, getting-started/getting-started-cpp, getting-started/getting-started-golang, getting-started/activating-javonet
:keywords: Javonet, `{called_technology}` Adding References, `{calling_technology}`, Library References, DLL References, JAR References, Python Package References, Ruby Package References, Perl Package References, Node.js Package References, Library Loading, Library Usage, Library Integration
:::

# Adding references to libraries

Javonet allows to use any library from all supported technologies. As with any regular application, necessary libraries need to be referenced.

:::code 
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_LoadLibrary
:called_source: v2/snippets/`{called_technology}`/TestClass.`{called_ext}`
:called_id: Empty
:display: calling
:::

The argument is a relative or full path to `{called_name}`.  
If the `{called_name}` has dependencies on other `{called_name}`, the latter needs to be added first.  
After referencing the `{called_name}` any objects stored in this package can be used. 
Use static classes, create instances, call methods, use fields and properties and much more.
