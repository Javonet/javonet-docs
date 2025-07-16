:::options
:title: Configure channel in `{calling_name}` application
:description: The article describes how to configure channel which Javonet uses to communicate
:related_articles: foundations/javonet-static-class, foundations/in-memory-channel, foundations/tcp-channel, foundations/websocket-channel, foundations/runtime-context, foundations/invocation-context, foundations/execute-method
:keywords: Javonet, `{called_name}` In Memory Connection, `{calling_name}`, In Memory Channel, TCP Channel, WebSocket Channel, Communication Channel, Runtime Context, Invocation Context, Execute Method, Static Class
:::

# Configure channel in `{calling_name}` app

Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology.  
If you have not yet created your first project, check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.

Javonet enables configuring the communication channel with foreign runtimes via a configuration file. Each runtime section (`jvm`, `netcore`, `nodejs`, `python`, `ruby`, `clr`, `perl`) can be configured independently with one of the supported channel types:

- **In-Memory Channel** – high-performance, within-process communication  
  [Learn more ›](/guides/v2/javascript/foundations/in-memory-channel)
- **TCP Channel** – for inter-process or remote communication over TCP  
  [Learn more ›](/guides/v2/javascript/foundations/tcp-channel)
- **WebSocket Channel** – ideal for browser-based or cross-platform communication  
  [Learn more ›](/guides/v2/javascript/foundations/websocket-channel)

Example configuration file with all three channel types:

:::code source="v2/snippets/commons/configuration-file/javonetconf.json":::

To use this file, load it using:

:::code
:calling_source: v2/snippets/`{calling_technology}`/common/channelTests.`{calling_ext}`
:calling_id: WithConfigurationFile
:display: calling
:::

Javonet can be used both in **Node.js** and in browser-based **JavaScript** environments.  
When using `Javonet.withConfig(...)`, you are not limited to providing a configuration file path — you can also pass:

- **JavaScript object** – representing the configuration structure directly in code. 
- **JSON string** – containing the configuration as a raw JSON-formatted string.

This flexibility allows seamless integration regardless of your runtime environment.  
You can use configuration from a file, a JavaScript object, or a JSON string depending on your use case.

Below you can see a code example demonstrating how to load configuration from JavaScript object source.

:::code
:called_source: v2/snippets/`{called_technology}`common/browserConfig.`{called_ext}`
:called_id: WithConfigurationObject
:display: called
:::