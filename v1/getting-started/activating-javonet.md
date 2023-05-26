:::options
:title: Activating Javonet
:description: This article provides an information about activating Javonet
:related_articles: getting-started/installing-javonet, getting-started/adding-references-to-libraries, getting-started/xml-configuration-file
:::

# Activating Javonet

## Getting licence

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) pages to obtain license key.

An e-mail and license key is necessary to activate Javonet.

## Activating Javonet in your application

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. During the first activation, license server are called and a javonet.lic file is generated. 

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: Activation
:display: calling
:::

Activation must be called only once at the start-up of your application. During the first activation, Javonet contacts our servers and generates a javonet.lic file in your application directory. All subsequent calls simply verify this file.

## Java 
Last argument of activate method allows you to specify which .NET framework version should be used by Javonet to load your DLLs. Higher frameworks are backward compatible. If you have .NET 4.5 installed you can run Javonet in JavonetFramework.v45 mode and use .NET 3.5, 4.0 and 4.5 DLLs. This argument is of com.javonet.JavonetFramework enum type.  

## .NET
Last argument of activate method allows you to specify path to your Java runtime JRE or Java development kit (JDK)  

## Activating Javonet using proxy

Starting with Javonet v1.3, the activation method allows for new optional arguments which can be used to configure Javonet to activate the license using a local proxy server.
Using these new arguments proxy details, used by Javonet while performing activation, can be specified. Javonet supports any HTTP proxy:

- Without authentication
- With authentication
- With authentication based on Active Directory accounts  
  

**NOTE**  
In environments where proxy settings are required to access the Internet, use these activate method overloads:  

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.java
:calling_id: ActivationWithProxy
:display: calling
:::

Specify the hostname and port or IP address in standard formats in the proxyHost field.

- hostname:port
- ip_address:port  
  
## Activating Javonet using XML configuration file

There are many benefits to activating and setting up Javonet using an XML configuration file. It simplifies distribution of your application to your team, lets you update the Javonet license more quickly, and avoids hardcoded activation details.  
  
During the first application use, Javonet searches for, and then automatically uses the XML configuration file to activate your application.  
  
Simply name the file "javonet.xml" and place it in the root directory of your Java application.  
:::code source="v1/snippets/xml-configuration-files/short-file/javonet.xml":::

Starting with version 1.3, Javonet supports proxy settings for activations. These settings can be defined as activate method arguments or as an optional tag in your XML configuration file using the following syntax:

:::code source="v1/snippets/xml-configuration-files/with-proxy/javonet.xml":::