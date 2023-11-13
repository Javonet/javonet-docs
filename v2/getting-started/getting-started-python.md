:::options
:title: Getting started for Python developers
:description: This article provides Javonet getting started guide for Python developers
:related_articles: getting-started/about-javonet, getting-started/activating-javonet, getting-started/adding-references-to-libraries
:::

## Install Javonet for Python

Javonet is available as a Python package, which can be installed using PyPI package manager or any other method which supports Python packages.

For applications using Python 3.6 and higher use [javonet-python-sdk Package](https://pypi.org/project/javonet-python-sdk/)  

## Activate Javonet

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) page to get license key, which is necessary to activate Javonet.  

## First sample application

Javonet needs to be imported as any other dependency.

:::code source="v2/snippets/python/common/sampleProgram.py" ID="Import":::

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. During the first activation, license server are called and a javonet.lic file is generated. 

:::code source="v2/snippets/python/common/sampleProgram.py" ID="Activation":::

To use other programming technology, [Runtime Context](/guides/v2/foundations/runtime-context.md) of the called technology needs to be created.

:::code source="v2/snippets/python/common/sampleProgram.py" ID="RuntimeContextCreation":::

RuntimeContext refers to single instance of the called runtime. Once it is created it is used to interact with called runtime.

The simplest use case is to get from target technology a type from a built-in library:

:::code source="v2/snippets/python/common/sampleProgram.py" ID="GetType":::

And then get static field from the type:

:::code source="v2/snippets/python/common/sampleProgram.py" ID="GetStaticField":::

The returned value needs to be cast to calling technology type and can be used as any other variable:

:::code source="v2/snippets/python/common/sampleProgram.py" ID="GetValue":::

To sum up, the whole code snippet looks like:

:::code source="v2/snippets/python/common/sampleProgram.py" ID="WholeSnippet":::


