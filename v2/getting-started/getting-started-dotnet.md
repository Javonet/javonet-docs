:::options
:title: Getting started for .NET developers
:description: This article provides Javonet getting started guide for .NET developers
:::

## Install Javonet for .NET

Javonet is available as a Nuget package, which can be installed using Nuget package manager or any other method which supports Nuget packages. Detailed instructions can be found at [Nuget Documentation](https://learn.microsoft.com/en-us/nuget/)    

For applications using .NET Framework 4.7.2 and higher use [Javonet.Clr.Sdk Package](https://www.nuget.org/packages/Javonet.Clr.Sdk)  

For application using .NET Core 3.1 or .NET 5.0 and higher use [Javonet.Netcore.Sdk Package](https://www.nuget.org/packages/Javonet.Netcore.Sdk)  

![Install Javonet in Nuget](/v2/images/getting-started-dotnet-nuget.png?raw=true "Install Javonet in Nuget")  

## Activate Javonet

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) pages to obtain license key.

An e-mail and license key is necessary to activate Javonet.

## First App

Code example below represents the sample class that will be used in following example.

:::code source="v2/snippets/testResources/`{called_technology}`/TestClass.`{called_ext}`":::

The file is to be called TestClass.`{called_ext}` and be saved/compiled in main application directory. To use simple static method from this class the following code is used: 

:::code source="v2/snippets/csharp/`{called_technology}`/integrationTests.cs" ID="StandardLibrary_GetStaticField"::: 


