:::options
:title: TCP channel
:description: The article describes how to use Javonet with TPC/IP channel
:related_articles: foundations/javonet-static-class, foundations/in-memory-channel, foundations/configure-channel, foundations/runtime-context, foundations/invocation-context, foundations/execute-method, javonet-code-gateway/about-javonet-code-gateway, foundations/get-value-method
:keywords: Javonet, `{called_name}` TCP Channel, `{calling_name}`, TCP/IP Communication, Remote Machine, Server, Docker Container, Runtime Context, Method Invocation, Communication Channel, In Memory Channel, Static Class
:::

# Remote integrations in `{calling_name}`

Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.  
  
You can easily decide if you want to load your `{called_technology}` either in the same operating system process for tightly coupling integration scenarios and use foreign modules like they were created within the same technology or delegate creating required foreign objects in to any remote node, container or service. Javonet SDK provides you two methods to initialize foreign runtimes either in the same process with inMemory() or remote using tcp() method.  

:::code
:calling_source: v2/snippets/`{calling_technology}`/common/channelTests.`{calling_ext}`
:calling_id: TcpChannel
:display: calling
:::
  
Communication channel can be configured also with configuration file. Read more in [Configure Channel](guides/v2/`{calling_technology}`/`{called_technology}`/foundations/configure-channel).  
  
If you want to host your foreign module on remote node you need to run [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway) that will expose any public objects and methods defined in those modules for the consumption from your remote client code.  
  
After selecting channel user selects a runtime to interact with in order to create [Runtime Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context)  
