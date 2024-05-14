:::options
:title: Execute method
:description: The article describes the concept of Execute method
:related_articles: foundations/javonet-static-class, foundations/in-memory-channel, foundations/tcp-channel, foundations/runtime-context, foundations/invocation-context,foundations/get-value-method
:keywords: Javonet, `{called_technology}` Execute Method, `{calling_technology}`, Method Execution, Invocation Context, Non-Materialized Context, Command Nesting, Method Invocation, Runtime Processing, Expression Transfer, Developer Control
:::

# Execute method
  
Because invocation context is building the intent of executing particular expression on target environment, we call the initial state of invocation context as non-materialized. The non-materialized context wraps either single command or chain of recursively nested commands.  

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_CreateInvocationContext
:display: calling
:::
  
Commands are becoming nested through each invocation of methods on Invocation Context. Each invocation triggers the creation of new Invocation Context instance wrapping the current command with new parent command valid for invoked method.  
  
Developer can decided on any moment of the materialization for the context taking full control of the chunks of the expression being transferred and processed on target runtime.  