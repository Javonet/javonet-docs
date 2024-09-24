:::options
:title: In memory channel in `{calling_name}` application
:description: The article describes how to use Javonet with inMemory channel type
:related_articles: foundations/javonet-static-class, foundations/tcp-channel, foundations/configure-channel, foundations/runtime-context, foundations/invocation-context, foundations/execute-method, foundations/get-value-method,foundations/get-value-method
:keywords: Javonet, `{called_name}` In Memory Channel, `{calling_name}`, In Memory Channel, Communication Channel, Runtime Context, Invocation Context, Execute Method, TCP Channel, Static Class
:::

# In memory channel

Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
Javonet offers two ways of communicating with called runtime. In memory channel is used to use Javonet within the same machine.  

:::code
:calling_source: v2/snippets/`{calling_technology}`/common/channelTests.`{calling_ext}`
:calling_id: InMemoryChannel
:display: calling
:::

Communication channel can be configured also with configuration file. Read more in [Configure Channel](guides/v2/`{calling_technology}`/`{called_technology}`/foundations/configure-channel).  
  
After selecting channel user selects a runtime to interact with in order to create [Runtime Context](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context).
