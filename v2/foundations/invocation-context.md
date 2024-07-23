:::options
:title: Invocation context from `{called_name}` in `{calling_name}`.
:description: The article describes the concept of Invocation Context from `{called_name}` in `{calling_name}`.
:related_articles: foundations/javonet-static-class, foundations/in-memory-channel, foundations/tcp-channel, foundations/runtime-context, foundations/execute-method,foundations/get-value-method
:keywords: Javonet, `{called_name}` Invocation Context, `{calling_name}`, Method Invocation, Invocation Chain, Non-Materialized Expression, Execute Method, Runtime Context, In Memory Channel, TCP Channel, Static Class
:::

# Invocation context from `{called_name}` in `{calling_name}`.

Calling any method on [Runtime Context](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context.md) creates new instance of Invocation Context.  

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_CreateInvocationContext
:display: calling
:::
  
Navigation through the methods on different variations of Invocation Context allows to construct the chain of invocations. Those chains of invocation represent the non-materialized expression of interaction with libraries, types, and any programming entities in target technology.  
  
In order to materialize expression, a call to called technology needs to be invoked with [Execute method](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/execute-method.md)