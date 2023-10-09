:::options
:title: Project Activation Tool
:description: This section describes the usage of the Project Activation Tool
:related_articles: advanced-activation-and-licensing/delegating-activation-server, advanced-activation-and-licensing/runtime-offline-compile-time-activation
:::
  
# Project Activation Tool  
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
## Overview  
  
This section describes the usage of the Project Activation Tool. Project Activation Tool should be used for Javonet Professional and Javonet Enterprise license with compile time activation only. This tool allows for generating Javonet license file that is bound to binaries that will be used by Javonet.  
  
Using Project Activation Tool allows for generating license file during the compilation of the project and guarantees that no further activation requests will be sent from the target machines. The target machine verifies the pre-generated license and approves or rejects Javonet usage without connecting to Javonet Activation Servers.  
  
## Download  
  
Currently Project Activation Tool is available for the customers with Javonet Professional or Enterprise license only. To receive the download link for Project Activation Tool please contact our support team.  
  
## Activation Workflow  
  
![Activation workflow](/v1/images/compiletimeactivationworkflow.png?raw=true "Activation workflow")
  
## Usage  
  
Project Activation Tool is a console application. To generate the license one of the following modes needs to be used.  
  
## For Javonet Professional License:  
  
Activate the Javonet license by binding it to the project libraries and particular target machines:  

:::code source="v1/snippets/project-activation-tool/ProjectLicenseGenerator.txt" ID="Snippet1":::

Generate multiple license files providing list of hardware IDs and project libraries:  
  
:::code source="v1/snippets/project-activation-tool/ProjectLicenseGenerator.txt" ID="Snippet2":::
  
## For Javonet Enterprise License:  
  
Generate license file for project libraries and now target machine limits.  

:::code source="v1/snippets/project-activation-tool/ProjectLicenseGenerator.txt" ID="Snippet3":::
  
In each case you can provide project libraries directly as command arguments, by specifying directory with your target JAR files or by pointing to text files which lists libraries that will be used by Javonet. 
