:::options
:title: Getting started for GoLang developers
:description: This article provides Javonet getting started guide for GoLang developers
:::

## Install Javonet for GoLang

Javonet is available as a GoLang library. To get the library please contact support@javonet.com.

## Activate Javonet

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) pages to obtain license key.

An e-mail and license key is necessary to activate Javonet.

## First sample application

Javonet needs to be imported as any other dependency.

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="Import":::

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. During the first activation, license server are called and a javonet.lic file is generated. 

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="Activation":::

To use other programming technology, [Runtime Context](/guides/v2/foundations/runtime-context.md) of called technology needs to be created.

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="RuntimeContextCreation":::

RuntimeContext refers to single instance of an runtime. Once it is created it is used to interact with called runtime.

The simplest use case is to get from target technology a type from a built-in library:

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="GetType":::

And then get static field from the type:

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="GetStaticField":::

The returned value needs to be cast to calling technology type and can be used as any other variable:

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="GetValue":::

To sum up, the whole code snippet looks like:

:::code source="v2/snippets/golang/common/sampleProgram.go" ID="WholeSnippet":::
