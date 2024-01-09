:::options
:title: Runtime vs. offline vs. compile time activation
:description: Runtime vs. offline vs. compile time activation
:keywords: activation, licensing, runtime, offline, compile time
:related_articles: advanced-activation-and-licensing/delegating-activation-server, advanced-activation-and-licensing/project-activation-tool
:::

# Runtime vs. offline vs. compile time activation
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
  
This article explains the difference between offline activation, standard runtime activation and optional compile time activation. Javonet supports 3 types of activation to satisfy different distribution scenarios. Read further sections to understand which approach would be most appropriate for your project.

## Runtime Activation  
  
Runtime activation is the default option. It means that Javonet module will contact our activation server to retrieve the license during the first execution of an application that uses Javonet on the new machine. During the activation request the unique hardware ID of the machine that runs the application will be generated and sent to our servers including the license key and provided email address (either to Javonet.activate() method or through XML config file). Activation server validates the license key and checks if there are still any available slots for new machines for this key. If license is valid server will return the Javonet license in the XML format.  
  
The license XML will be stored in "javonet.lic" file in the root directory of the application (or in the custom directory indicated in the configuration). License file stores signed approval to run Javonet on particular machine and depending on the conditions of your license it can include also the optional license limitations and license renewal date.  
  
## Offline Activation  
  
Offline activation works similarly to runtime activation. The only difference is that first the user generates the hardware ID of the target machine using our special tool "Javonet Stations Identity", and then manually enters the hardware ID, license key and email address to the offline activation web form input fields. By submitting the form the user will receive the downloadable "javonet.lic" file which should subsequently be copied to root directory of the application or custom directory created for storing the license that shall be indicated in the configuration.  
  
Javonet will verify the license file and approve or reject the usage of the product with each execution.  
  
## Compile Time Activation  
  
Compile time activation is used for the per project activation or per project and hardware ID activation only. Therefore the compile activation way can be used only with Javonet Professional or Javonet Enterprise license. In this scenario Javonet license file is bound to particular Java modules that will be used through Javonet. In case of Javonet Professional license it is bound to both target modules and particular hardware IDs.  
  
License file is generated during the compilation of the product by calling the "Javonet Project Activation Tool" at the end of the compilation process. Project activation tool connects to Javonet Activation Server and retrieves the license file. License file is stored in *.lic file. The name of the "*.lic" file will be displayed on the console after running the tool.  
  
This license file should be included in any application package that uses Javonet and uploaded to the target machines. If the Javonet Professional is used, the separate ".lic" file will be created for each of the target machines. If the Javonet Enterprise license is used there will be a single license valid for all the machines.  
  
Read more in article about Project Activation Tool.  