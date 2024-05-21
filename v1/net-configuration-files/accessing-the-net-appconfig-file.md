:::options
:title: Accessing the .NET AppConfig File (connectionStrings and appSettings)
:description: Accessing the .NET AppConfig File (connectionStrings and appSettings)
:keywords: Javonet, .NET AppConfig File, `{called_technology}`, `{calling_name}`, Windows, Linux, MacOS, ConnectionStrings, AppSettings, Configuration File, Javonet Activation, Application Configuration
:::

# Accessing the .NET AppConfig File 
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
## Accessing the .NET AppConfig File (connectionStrings and appSettings)  
  
If your .NET logic uses App.Config files, reads information from connectionStrings sections, appSettings or needs any other data from configuration, you can use Javonet to load this file.    
  
To do this, use the following method in your application. This method should be called just after activating Javonet and before any other operation. Simply add this method to your application and call it by passing the path to your config file.     

:::code source="v1/snippets/java/netframework-dll/integrationTests.java" ID="AccessNetAppConfigFile":::
  