:::options
:title: Adding references to libraries
:description: Adding references to libraries
:::

# Adding references to libraries

Javonet allows to use any library from all supported technologies. As with any regular application, necessary libraries need to be referenced.

:::code 
calling_source="v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`"
calling_id="TestResources_LoadLibrary"
called_source = "v2/snippets/testResources/`{called_technology}`/TestClass.`{called_ext}`"
called_id="Test_Resource_All"
display="calling"
:::


The argument is a relative or full path to `{called_name}`. 
If the `{called_name}` has dependencies on other `{called_name}`, the latter needs to be added first.

After referencing the `{called_name}` any objects stored in this package can be used. 
Use static classes, create instances, call methods, use fields and properties and much more.
