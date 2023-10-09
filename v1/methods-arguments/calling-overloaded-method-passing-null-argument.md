:::options
:title: Calling overloaded method passing null argument
:description: Calling overloaded method passing null argument
:related_articles: methods-arguments/passing-reference-type-arguments, methods-arguments/passing-arguments-by-reference-with-ref-keyword, methods-arguments/passing-arguments-by-reference-with-out-keyword, methods-arguments/passing-typeof-type-as-method-argument
:::

# Calling overloaded method passing null argument 
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
In some cases you might need to call a method - that has multiple overloads with the same number of arguments - passing null. Considering following case:  
  
:::code 
:called_source: v1/snippets/`{called_technology}`/TestClass2.`{called_ext}`
:display: called
:::
  
If you call MethodA passing "null" as argument .NET side will not be able to resolve which method should be called as in both overloads null can be passed. Ambigous invocation exception will be thrown. To overcome this issue Javonet introduces "NNull" type which allows to pass type-specific null value.  
  
How to call .NET method passing type-specific null value:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_CallOverloadedMethodPassingNullArg
:display: calling
:::
  
  
[**See Live Example!**](http://lab.javonet.com/e/15)


