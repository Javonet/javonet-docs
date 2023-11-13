:::options
:title: Getting started for Node.js developers
:description: This article provides Javonet getting started guide for Node.js developers
:related_articles: getting-started/about-javonet, getting-started/activating-javonet, getting-started/adding-references-to-libraries
:::

## Install Javonet for Node.js

Javonet is available as a Node.js package, which can be installed using NPM package manager or any other method which supports Node.js packages.

For applications using Nodejs 12 and higher use [javonet-nodejs-sdk Package](https://www.npmjs.com/package/javonet-nodejs-sdk)  

## Activate Javonet

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) page to get license key, which is necessary to activate Javonet.  

## First sample application

Javonet needs to be imported as any other dependency.

:::code source="v2/snippets/javascript/common/sampleProgram.js" ID="Import":::

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. During the first activation, license server are called and a javonet.lic file is generated. 

:::code source="v2/snippets/javascript/common/sampleProgram.js" ID="Activation":::

To use other programming technology, [Runtime Context](/guides/v2/foundations/runtime-context.md) of the called technology needs to be created.

:::code source="v2/snippets/javascript/common/sampleProgram.js" ID="RuntimeContextCreation":::

RuntimeContext refers to single instance of the called runtime. Once it is created it is used to interact with called runtime.

The simplest use case is to get from target technology a type from a built-in library:

:::code source="v2/snippets/javascript/common/sampleProgram.js" ID="GetType":::

And then get static field from the type:

:::code source="v2/snippets/javascript/common/sampleProgram.js" ID="GetStaticField":::

The returned value needs to be cast to calling technology type and can be used as any other variable:

:::code source="v2/snippets/javascript/common/sampleProgram.js" ID="GetValue":::

To sum up, the whole code snippet looks like:

:::code source="v2/snippets/javascript/common/sampleProgram.js" ID="WholeSnippet":::


