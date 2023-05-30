:::options
:title: Passing reference-type arguments
:description: Passing reference-type arguments
:related_articles: methods-arguments/passing-arguments-by-reference-with-keywords, methods-arguments/passing-typeof-type-as-method-argument, methods-arguments/calling-overloaded-method-passing-null-argument
:::

# Passing reference-type arguments  
  
With Javonet, you can very easily pass any object from `{called_name}` as argument to any method from `{called_name}`, or substitute a field or property from `{called_name}`. Instances of objects from `{called_name}` can be stored in your `{calling_name}` application using the special NObject\JObject type variable. When passing the NObject\JObject object to the called method, Javonet just pass it as a reference.  
  
Example:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_PassReferenceTypeArgument
:display: calling
:::


