:::options
:title: Calling overloaded method passing null argument
:description: Calling overloaded method passing null argument
:related_articles: methods-arguments/passing-reference-type-argument, methods-arguments/passing-arguments-by-reference-with-ref-keyword, methods-arguments/passing-arguments-by-reference-with-out-keyword, methods-arguments/passing-typeof-type-as-method-argument
:::

# Calling overloaded method passing null argument 
  
With Javonet, you can very easily pass any object from `{called_name}` as argument to any method from `{called_name}`, or substitute a field or property from `{called_name}`. Instances of objects from `{called_name}` can be stored in your `{calling_name}` application using the special NObject\JObject type variable. When passing the NObject\JObject object to the called method, Javonet just pass it as a reference.  
  
Example:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_PassReferenceTypeArgument
:display: calling
:::

