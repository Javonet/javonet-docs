:::options
:title: Getting started for GoLang developers
:description: This article provides Javonet getting started guide for GoLang developers
:related_articles: getting-started/about-javonet, getting-started/activating-javonet, getting-started/adding-references-to-libraries
:::

# Getting started for GoLang

Javonet is an advanced library enabling direct method calls between programming languages and modules. To use the guides both interacting technologies needs to be selected from left-side dropdown lists. Developer's technology is named "I code in" and technology to be called is named "I want to use". 

## Prerequisites 

To call library/package/module from another technology, corresponding runtime has to be installed. See [About Javonet](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet.md) for details about installing called technology runtime.  

Javonet is available as a GoLang package and can be downloaded from [My Javonet Portal](https://my.javonet.com).  

## Get activation key

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) page to get license key, which is necessary to activate Javonet.  

## First sample application

Javonet needs to be imported as any other dependency.

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="Import":::

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. More about activation in [Activating Javonet section](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/activating-javonet.md)

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="Activation":::

As a second step, [Runtime Context](/guides/v2/`{calling_technology}`/`{called_technology}`/foundations/runtime-context.md) of the called technology needs to be created. RuntimeContext refers to single instance of the called runtime. Once it is created it is used to interact with called runtime.  

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="RuntimeContextCreation":::

The simplest use case is to get from target technology a type from a built-in library:

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="GetType":::

And then get static field from the type:

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="GetStaticField":::

The returned value needs to be cast to calling technology type and can be used as any other variable:

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="GetValue":::

To sum up, the whole code snippet looks like:

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="WholeSnippet":::
