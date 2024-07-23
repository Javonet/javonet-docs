:::options
:title: Adding `{calling_name}` references to libraries from `{called_name}`
:description: This article provides information about adding `{calling_name}` references to libraries from `{called_name}`
:related_articles: getting-started/about-javonet, getting-started/prerequisites, getting-started/activating-javonet
:keywords: Javonet, `{called_name}` Adding References, `{calling_name}`, Library References, DLL References, JAR References, Python Package References, Ruby Package References, Perl Package References, Node.js Package References, Library Loading, Library Usage, Library Integration
:::

# Adding `{calling_name}` references to libraries from `{called_name}`

Javonet enables software developers to instantly integrate several programming languages. Javonet is available for Windows, Linux and Mac operating systems as a downloadable package for supported programming languages. This article lists getting started sections for supported technologies.  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology.  

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
