:::options
:title: Calling overloaded method passing null argument
:description: Calling overloaded method passing null argument
:related_articles: methods-arguments/passing-reference-type-arguments, methods-arguments/passing-arguments-by-reference-with-ref-keyword, methods-arguments/passing-arguments-by-reference-with-out-keyword, methods-arguments/passing-typeof-type-as-method-argument
:::

# Calling overloaded method passing null argument 
  
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


