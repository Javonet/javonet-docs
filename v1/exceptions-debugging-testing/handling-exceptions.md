:::options
:title: Handling exceptions
:description: Handling exceptions
:related_articles: exceptions-debugging-testing/handling-activation-issues, exceptions-debugging-testing/debugging-net-code-called-from-java, exceptions-debugging-testing/debugging-javonet-enabled-application
:::

# Handling exceptions 
  
Any exception thrown by called technology can be handled in your `{calling_name}` code. All Javonet methods that operate on objects from `{called_name}` throw a JavonetException when exceptions occur. You can catch exceptions by catching the JavonetExceptions, and then perform the appropriate exception handling logic.  


:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: HandlingExceptions
:display: calling
:::
  