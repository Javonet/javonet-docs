:::options
:title: Extending a class and wrapping methods
:description: Extending a class and wrapping methods
:related_articles: working-with-objects/creating-instance-of-generic-object
:::

# Extending a class and wrapping methods
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
You can extend any class from `{called_name}` by extending the `{calling_name}` class with the NObject/JObject type and then call the constructor base constructor by passing the name of the called type and arguments for its constructor as an argument.  
  
Assuming we have a custom `{called_name}` with the following class inside:

:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass.`{called_ext}`
:display: called
:::

To extend this class and wrap method from this class create the following class:

:::code 
:called_source: v1/snippets/`{calling_technology}`/`{called_technology}`/ExtendedTestClass.`{calling_ext}`
:display: called
:::

And use it like any other `{calling_name}` class

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_ExtendClassAndWrapMethod
:display: calling
:::  
  
[**See Live Example!**](http://lab.javonet.com/e/13)