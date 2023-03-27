:::options
:title: Execute method
:description: The article describes the concept of Execute method
:::

# Execute method

Because invocation context is building the intent of executing particular expression on target environment, we call the initial state of invocation context as non-materialized. The non-materialized context wraps either single command or chain of recursively nested commands.  

Commands are becoming nested through each invocation of methods on InvocationContext. Each invocation triggers the creation of new InvocationContext instance wrapping the current command with new parent command valid for invoked method.  

Developer can decided on any moment of the materialization for the context taking full control of the chunks of the expression being transferred and processed on target runtime.  