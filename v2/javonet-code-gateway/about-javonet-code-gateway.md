:::options
:title: About Javonet Gateway
:description: This article provides general information about Javonet Gateway
:related_articles: getting-started/about-javonet,getting-started/prerequisites, getting-started/activating-javonet
:keywords: Javonet, `{called_technology}` About, `{calling_technology}`, Language Integration, Cross-Language Communication, .NET Framework, .NET Core, JAR Library, Python Package, Ruby Package, Perl Package, Node.js Package, Getting Started, Prerequisites, Installation, Runtime
:::

# Javonet Code Gateway
  
Javonet enables software developers to instantly integrate several programming languages. Javonet is available for Windows, Linux and Mac operating systems as a downloadable package for supported programming languages. This article lists getting started sections for supported technologies.  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology.  

If you want to host your foreign module on remote node you need to run Javonet Code Gateway that will expose any public objects and methods defined in those modules for the consumption from your remote client code.  

Javonet Code Gateway is available on [My Javonet Portal](https://my.javonet.com) for Windows, Linux and MacOS.  

Javonet Code Gateway listens on port 8080 and serves all requests to the remote machine which was sent via [TCP Channel](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel.md).

All the samples which are presented in this guides can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel).  That will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway.md) that hosts Javonet Code Gateway. This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.  
