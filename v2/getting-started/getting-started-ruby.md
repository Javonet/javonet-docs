:::options
:title: Getting started for Ruby developers
:description: This article provides Javonet getting started guide for Ruby developers
:related_articles: getting-started/about-javonet, getting-started/prerequisites, getting-started/activating-javonet, getting-started/adding-references-to-libraries, javonet-code-gateway/about-javonet-code-gateway
:keywords: Javonet, `{called_name}` Getting Started, `{calling_name}`, Ruby Developers, Ruby Integration, Library Usage, Method Calls, Interacting Technologies, Runtime Installation, Activation Key, Sample Application, Runtime Context, Static Field Access
:::

# Getting started for Ruby

Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Perl, Python, JavaScript/TypeScript) like they were created in your technology.  
  
To use the guides both interacting technologies needs to be selected from left-side dropdown lists. Developer's technology is named "I code in" and technology to be called is named "I want to use".  

## Prerequisites
  
To call library/package/module from another technology, corresponding runtime has to be installed. See [Prerequisites](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/prerequisites) for details about installing called technology runtime.  

Javonet is available as a javonet-ruby-sdk GEM package which can be downloaded from [RubyGems public repository](https://rubygems.org/gems/javonet-ruby-sdk) or from [My Javonet Portal](https://my.javonet.com).

Package can be installed with CLI:
:::code source="v2/snippets/ruby/common/install.ps1" ID="Install":::

## Get activation key

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) page to get license key, which is necessary to activate Javonet.  

## First sample application

Javonet needs to be imported as any other dependency.

:::code source="v2/snippets/ruby/common/sampleProgram.rb" ID="Import":::

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. More about activation in [Activating Javonet section](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/activating-javonet).

:::code source="v2/snippets/ruby/common/sampleProgram.rb" ID="Activation":::

As a second step, [Runtime Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context) of the called technology needs to be created. RuntimeContext refers to single instance of the called runtime. Once it is created it is used to interact with called runtime.

:::code source="v2/snippets/ruby/common/sampleProgram.rb" ID="RuntimeContextCreation":::

The simplest use case is to get from target technology a type from a built-in library:

:::code source="v2/snippets/ruby/common/sampleProgram.rb" ID="GetType":::

And then get static field from the type:

:::code source="v2/snippets/ruby/common/sampleProgram.rb" ID="GetStaticField":::

The returned value needs to be cast to calling technology type and can be used as any other variable:

:::code source="v2/snippets/ruby/common/sampleProgram.rb" ID="GetValue":::

To sum up, the whole code snippet looks like:

:::code source="v2/snippets/ruby/common/sampleProgram.rb" ID="WholeSnippet":::

The same operation can be performed remotely by just changing the new Runtime Context invocation from [in memory](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/in-memory-channel) to [tcp](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/tcp-channel) that will create and interact with your `{called_name}` objects on any remote node, container or service that hosts [Javonet Code Gateway](/guides/v2/`{calling_technology}`/`{called_technology}`/javonet-code-gateway/about-javonet-code-gateway). This way you can preserve the same logic in your application and instantly switch between monolithic and microservices architecture without the need to implement the integration layer based on web services or other remote invocation methods.
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
