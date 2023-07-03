:::options
:title: Getting started for C++ developers
:description: This article provides Javonet getting started guide for C++ developers
:related_articles: getting-started/about-javonet, getting-started/activating-javonet, getting-started/adding-references-to-libraries
:::

## Install Javonet for C++

Javonet is available as a dynamic c++ library. To get the library please contact support@javonet.com.

## Activate Javonet

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) pages to obtain license key.

An e-mail and license key is necessary to activate Javonet.

## First sample application

Javonet needs to be imported as any other dependency.

:::code source="v2/snippets/cpp/common/sampleProgram.cpp" ID="Import":::

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. During the first activation, license server are called and a javonet.lic file is generated. 

:::code source="v2/snippets/cpp/common/sampleProgram.cpp" ID="Activation":::

To use other programming technology, [Runtime Context](/guides/v2/foundations/runtime-context.md) of the called technology needs to be created.

:::code source="v2/snippets/cpp/common/sampleProgram.cpp" ID="RuntimeContextCreation":::

RuntimeContext refers to single instance of the called runtime. Once it is created it is used to interact with called runtime.

The simplest use case is to get from target technology a type from a built-in library:

:::code source="v2/snippets/cpp/common/sampleProgram.cpp" ID="GetType":::

And then get static field from the type:

:::code source="v2/snippets/cpp/common/sampleProgram.cpp" ID="GetStaticField":::

The returned value needs to be cast to calling technology type and can be used as any other variable:

:::code source="v2/snippets/cpp/common/sampleProgram.cpp" ID="GetValue":::

To sum up, the whole code snippet looks like:

:::code source="v2/snippets/cpp/common/sampleProgram.cpp" ID="WholeSnippet":::


