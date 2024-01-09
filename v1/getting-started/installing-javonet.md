:::options
:title: Installing Javonet
:description: This article provides an information about installing Javonet
:related_articles: getting-started/activating-javonet, getting-started/adding-references-to-libraries, getting-started/xml-configuration-file
:keywords: Javonet, Installing Javonet, `{called_technology}`, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, JDK, .NET Framework, Visual C++ Runtime, Javonet Package, Project Reference
:::

# Installing Javonet
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
## Prerequisites

Before using Javonet, make sure you have following pre-requisites installed:  
[JDK 1.6](https://www.oracle.com/pl/java/technologies/javase-java-archive-javase6-downloads.html) or newer  

## For use with .NET Framework 3.5 (supports .NET 3.5 DLLs)
[Visual C++ Runtime 2008](https://www.microsoft.com/en-us/download/details.aspx?id=26368)  
[.NET Framework 3.5](https://www.microsoft.com/en-us/download/details.aspx?id=22)  

## For use with .NET Framework 4.0 (supports .NET 4.0 and 3.5 DLLs)
[Visual C++ Runtime 2010](https://www.microsoft.com/en-us/download/details.aspx?id=26999)  
[.NET Framework 4.0](https://www.microsoft.com/en-us/download/details.aspx?id=17718)  

## For use with .NET Framework 4.5 (supports .NET 4.5, 4.0 and 3.5 DLLs)

[Visual C++ Runtime 2013](https://www.microsoft.com/en-us/download/details.aspx?id=40784)  
[.NET Framework 4.5](https://www.microsoft.com/en-us/download/details.aspx?id=30653)  

## Adding Javonet Reference to your project

As Javonet is single file solution, all you need to start using it is to [download the latest Javonet package](https://my.javonet.com/signup/) and add a reference to this file in your project. If any of pre-requisites will be missing Javonet will detect them automatically and display in exception message the URLs for download of required dependencies.