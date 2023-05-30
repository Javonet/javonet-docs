:::options
:title: Using enum type
:description: Using enum type
:::

# Using enum type

To use .NET enums in your Java project, javonet API provides special NEnum type. 
Using this class you can keep the reference of particular enum value, get/set the enum value, pass the enum value as method argument or compare enum values.  

To initialize reference to .NET enum type you can use the NEnum(String enumTypeName, String enumValue) constructor. As first argument you must provide enum type name with or without namespace. 
When namespace is not provided Javonet will automatically lookup the enum type in all loaded assemblies, if there is only one type with provided name it will be used. 
In second argument selected enum value should be provided.  
  
Assuming we have a custom `{called_name}` with the following enum inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/SampleEnum.`{called_ext}`
:display: called
:::


Enum usage:
  
:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_UseEnumType
:display: calling
:::

How to pass enum as method argument


Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To enum as method argument

:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_UseEnumTypeAsArgument
:display: calling
:::