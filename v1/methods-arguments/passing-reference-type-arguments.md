:::options
:title: Passing reference-type arguments
:description: Passing reference-type arguments
:related_articles: methods-arguments/passing-arguments-by-reference-with-ref-keyword, methods-arguments/passing-arguments-by-reference-with-out-keyword, methods-arguments/passing-typeof-type-as-method-argument, methods-arguments/calling-overloaded-method-passing-null-argument
:keywords: Javonet, Reference-Type Arguments, `{called_technology}`, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, Method Arguments, NObject, JObject, Method Invocation, Object References
:::

# Passing reference-type arguments  
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
With Javonet, you can very easily pass any object from `{called_name}` as argument to any method from `{called_name}`, or substitute a field or property from `{called_name}`. Instances of objects from `{called_name}` can be stored in your `{calling_name}` application using the special NObject\JObject type variable. When passing the NObject\JObject object to the called method, Javonet just pass it as a reference.  
  
Example:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_PassReferenceTypeArgument
:display: calling
:::
  

[**See Live Example!**](http://lab.javonet.com/e/9)
