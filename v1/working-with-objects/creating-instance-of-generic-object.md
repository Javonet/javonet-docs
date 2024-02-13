:::options
:title: Creating instance of generic objects
:description: Creating instance of generic objects
:related_articles: generics/calling-generic-methods, working-with-objects/extending-a-class-and-wrapping-methods
:keywords: Javonet, Generic Objects, `{called_technology}`, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, Generic Class, NType, Create Method, Generic Arguments, List<T>, getType Method
:::

# Creating instance of generic objects
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/generics/creating-generic-class-instance">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
Javonet allows you to create instances of generic objects. To initialize generic class first type with expected generic type should be created. Next to initialize the instance of generic type call the "create()" method on the object.  
  
**Important** Notice that while initializing NType for generic class there is apostrophe with number of generic arguments provided which let's Javonet recognize which generic class should be initialized. For example for List<T> class, the List<Strings> can be obtained by calling Javonet.getType("List`1","String"). As first argument we provide generic type name and number of generic arguments and as second argument the name of the type to be used as generic type. If class expects more then one generic type they should be passed as further arguments of getType method.  
  
To create instance of generic class:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_CreateInstanceOfGenericObject
:display: calling
:::
    
  
[**See Live Example!**](http://lab.javonet.com/e/17)