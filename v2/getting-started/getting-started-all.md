:::options
:title: Getting started for all technologies
:description: This article provides Javonet getting started guide
:::

## Install Javonet

:::code 
:calling_source: v2/snippets/`{calling_technology}`/common/installingJavonet.`{calling_ext}` 
:display: calling
:::

Javonet is available as a Nuget package, which can be installed using Nuget package manager or any other method which supports Nuget packages. Detailed instructions can be found at [Nuget Documentation](https://learn.microsoft.com/en-us/nuget/)    

For applications using .NET Framework 4.7.2 and higher use [Javonet.Clr.Sdk Package](https://www.nuget.org/packages/Javonet.Clr.Sdk)  

For application using .NET Core 3.1 or .NET 5.0 and higher use [Javonet.Netcore.Sdk Package](https://www.nuget.org/packages/Javonet.Netcore.Sdk)  

![Install Javonet in Nuget](/v2/images/getting-started-dotnet-nuget.png?raw=true "Install Javonet in Nuget")  

## Activate Javonet

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) pages to obtain license key.

An e-mail and license key is necessary to activate Javonet.

## First sample application

Javonet needs to be imported as any other dependency.

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="Import":::

If Javonet.Clr.Sdk package is used replace it with:
```
using Javonet.Clr.Sdk.
```

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. During the first activation, license server are called and a javonet.lic file is generated. 

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="Activation":::

To use other programming technology, [Runtime Context](/guides/v2/foundations/runtime-context.md) of called technology needs to be created.

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="RuntimeContextCreation":::

RuntimeContext refers to single instance of an runtime. Once it is created it is used to interact with called runtime.

The simplest use case is to get from target technology a type from a built-in library:

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="GetType":::

And then get static field from the type:

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="GetStaticField":::

The returned value needs to be cast to calling technology type and can be used as any other variable:

:::code source="v2/snippets/csharp/common/sampleProgram.cs" ID="GetValue":::

To sum up, the whole code snippet looks like:

:::code 
:calling_source: v2/snippets/csharp/common/sampleProgram.cs 
:calling_id: WholeSnippet
:called_source: v2/snippets/python-package/TestClass.py
:display: calling
:::

