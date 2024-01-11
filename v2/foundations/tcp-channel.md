:::options
:title: TCP channel
:description: The article describes how to use Javonet with TPC/IP channel
:related_articles: foundations/javonet-static-class, foundations/in-memory-channel, foundations/runtime-context, foundations/invocation-context, foundations/execute-method
:keywords: Javonet, `{called_technology}` TCP Channel, `{calling_technology}`, TCP/IP Communication, Remote Machine, Server, Docker Container, Runtime Context, Method Invocation, Communication Channel, In Memory Channel, Static Class
:::

# Remote Integrations

Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology. If have not yet created your first project check [Javonet overview and quick start guides](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) for your technology.

You can easily decide if you want to load your `{called_technology}` either in the same operating system process for tightly coupling integration scenarios and use foreign modules like they were created within the same technology or delegate creating required foreign objects in to any remote node, container or service. Javonet SDK provides you two methods to initialize foreign runtimes either in the same process with inMemory() or remote using tcp() method. 

If you want to host your foreign module on remote node you need to run there Javonet Code Gateway that will expose any public objects and methods defined in those modules for the consumption from your remote client code. 
  
Javonet offers two ways of communicating with called runtime. TCP/IP channel is used to use Javonet with remote machine, server, Docker container etc.  
  
After selecting channel user selects a runtime to interact with in order to create [Runtime Context](https://www.javonet.com/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context.md)  
