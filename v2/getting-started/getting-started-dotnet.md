:::options
:title: Getting started for .NET developers
:description: This article provides Javonet getting started guide for .NET developers
:related_articles: getting-started/about-javonet, getting-started/prerequisites, getting-started/activating-javonet, getting-started/adding-references-to-libraries, javonet-code-gateway/about-javonet-code-gateway
:keywords: Javonet, `{called_technology}` Getting Started, `{calling_technology}`, .NET Developers, .NET Integration, Library Usage, Method Calls, Interacting Technologies, Runtime Installation, Activation Key, Sample Application, Runtime Context, Static Field Access
:::

# Getting started for .NET  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology.  
  
To use the guides both interacting technologies needs to be selected from left-side dropdown lists. Developer's technology is named "I code in" and technology to be called is named "I want to use".   

## Prerequisites  

To call library/package/module from another technology, corresponding runtime has to be installed. See [Prerequisites](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/prerequisites.md) for details about installing called technology runtime.  
  
Javonet is available as a Nuget package which can be downloaded from Nuget public repository or from [My Javonet Portal](https://my.javonet.com).  

For application using .NET (Core) 3.1 or higher use [Javonet.Netcore.Sdk](https://www.nuget.org/packages/Javonet.Netcore.Sdk) Package  
For applications using .NET Framework 4.7.2 and higher use [Javonet.Clr.Sdk](https://www.nuget.org/packages/Javonet.Clr.Sdk) Package.   
Package can be installed with Nuget Package Manager:
  
![Install Javonet in Nuget](/v2/images/getting-started-dotnet-nuget.png?raw=true "Install Javonet in Nuget")  
  
Or with .NET CLI for .NET applications:
:::code source="v2/snippets/csharp/common/install.ps1" ID="Netcore_Install":::
or for .NET Framework applications
:::code source="v2/snippets/csharp/common/install.ps1" ID="Clr_Install":::  

## Get activation key

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) page to get license key, which is necessary to activate Javonet.  

## First sample application

Javonet needs to be imported as any other dependency.

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="Import"::: 
  
Javonet needs to be activated first. Activation must be called only once at the start-up of an application. More about activation in [Activating Javonet section](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/activating-javonet.md).

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="Activation":::

As a second step, [Runtime Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context.md) of the called technology needs to be created. RuntimeContext refers to single instance of the called runtime. Once it is created it is used to interact with called runtime.

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="RuntimeContextCreation":::

The simplest use case is to get from target technology a type from a built-in library:
:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="GetType":::

And then get static field from the type:
:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="GetStaticField":::

The returned value needs to be cast to calling technology type and can be used as any other variable:
:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="GetValue":::

To sum up, the whole code snippet looks like:

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="WholeSnippet":::


The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway.md). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.