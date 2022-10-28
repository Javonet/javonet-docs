:::options
:title: Invocation context
:description: The article describes the concept of Invocation Context
:::

# Invocation context

Calling any method on [Runtime Context](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context.md) creates new instance of InvocationContext.

Navigation through the methods on different variations of InvocationContext allows to construct the chain of invocations. Those chains of invocation represent the non-materialized expression of interaction with libraries, types, and any programming entities in target technology.

In order to materialize expression, a call to called technology needs to be invoked with [Execute method](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/execute-method.md)