:::options
:title: Get value from `{called_name}` in `{calling_name}` application
:description: The article describes the concept of GetValue method from `{called_name}` in `{calling_name}` application.
:related_articles: foundations/javonet-static-class, foundations/in-memory-channel, foundations/tcp-channel, foundations/runtime-context, foundations/invocation-context,foundations/execute-method
:keywords: Javonet, `{called_name}` Get Value Method, `{calling_name}`, Method Execution, Invocation Context, Non-Materialized Context, Command Nesting, Method Invocation, Runtime Processing, Expression Transfer, Developer Control
:::

# Get value from `{called_name}` in `{calling_name}` app
  
The GetValue method is used to retrieve the result of an operation performed by the Javonet API.

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_GetValue
:display: calling
:::
  
Commands are becoming nested through each invocation of methods on Invocation Context. Each invocation triggers the creation of new Invocation Context instance wrapping the current command with new parent command valid for invoked method.  
  
Developer can decided on any moment of the materialization for the context taking full control of the chunks of the expression being transferred and processed on target runtime.  
