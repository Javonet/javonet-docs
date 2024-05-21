:::options
:title: Configure channel in `{calling_name}`
:description: The article describes how to configure channel which Javonet uses to communicate in `{calling_name}`
:related_articles: foundations/javonet-static-class, foundations/in-memory-channel, foundations/tcp-channel, foundations/runtime-context, foundations/invocation-context, foundations/execute-method
:keywords: Javonet, `{called_name}` In Memory Connection, `{calling_name}`, In Memory Channel, Communication Channel, Runtime Context, Invocation Context, Execute Method, TCP Channel, Static Class
:::

# Configure channel

Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
With Javonet it is possible to configure communication channel with foreign runtimes via configuration file.
Example of such file is presented below:

:::code source="v2/snippets/commons/configuration-file/javonetconf.json":::
  
To use this file load it using:  

:::code
:calling_source: v2/snippets/`{calling_technology}`/common/channelTests.`{calling_ext}`
:calling_id: WithConfigurationFile
:display: calling
:::
