:::options
:title: WebSocket channel
:description: The article describes how to use Javonet with WebSocket channel type
:related_articles: foundations/in-memory-channel, foundations/tcp-channel, foundations/configure-channel, foundations/runtime-context, foundations/invocation-context, foundations/execute-method, javonet-code-gateway/about-javonet-code-gateway
:keywords: Javonet, `{called_name}` WebSocket Channel, `{calling_name}`, WebSocket Communication, Remote Integration, Runtime Context, Method Invocation, Communication Channel, Static Class
:::

# WebSocket channel in `{calling_name}`

Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If you have not yet created your first project, check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.

WebSocket channel is a new way of integrating with remote runtimes hosted on a different machine, container, or service. It uses WebSocket protocol (`ws://` or `wss://`) to establish communication with a remote runtime and allows secure and efficient method invocation.

You can choose between in-memory (same process), TCP (remote runtime via raw socket), or WebSocket (remote runtime via WebSocket protocol) communication channels depending on your deployment scenario.

To initialize Javonet with WebSocket channel, use the following snippet:

:::code
:calling_source: v2/snippets/`{calling_technology}`/common/channelTests.`{calling_ext}`
:calling_id: WebSocketChannel
:display: calling
:::

Communication channel can also be configured using a configuration file. Read more in [Configure Channel](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/configure-channel).

After selecting the channel, user selects a runtime to interact with in order to create a [Runtime Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context).
