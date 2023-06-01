:::options
:title: Project Activation Tool
:description: This section describes the usage of the Project Activation Tool
:related_articles: advanced-activation-and-licensing/delegating-activation-server, advanced-activation-and-licensing/runtime-offline-compile-time-activation
:::
  
# Project Activation Tool  
  
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
