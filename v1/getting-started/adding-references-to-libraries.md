:::options
:title: Adding references to libraries
:description: Adding references to libraries
:::

# Adding references to libraries

Javonet allows you to use any library from `{called_name}`. As with any regular application, you need to reference the libraries you are planning to use. You can reference any JAR file or DLL file on your computer or registered in GAC, as well as any library from the .NET Framework.

:::code source="v1/snippets/`{calling_tech}`/`{called_tech}`/adding-references.`{calling_ext}`":::

As argument you provide the relative or full path to your JAR or DLL package. If your package has dependencies on other packages you should add reference to each package first.

Now you can access any objects stored in this package. Use static classes, create instances, call methods, use fields and properties and much more.

