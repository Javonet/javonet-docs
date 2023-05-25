:::options
:title: Activating Javonet
:description: This article provides an information about activating Javonet
:::

# Activating Javonet

## Getting licence

<!-- In order to activate Javonet you need to get licence key. Please register on: 

https://my.javonet.com/signup/?type=free

If you already have an account, please login on: 

https://my.javonet.com/signin/ 

After logging in, go to Licence Keys subpage. There are your credentials and trial expiry date 

## Activating Javonet in your application

To start using Javonet in your `{calling_name}` application you need to activate your license first. This must be done before you use any other Javonet features.

:::code source="v1/snippets/`{calling_technology}`/`{called_technology}`/Activation.`{calling_ext}`" ID="Javonet_activate":::

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

---
**NOTE**

In environments where proxy settings are required to access the Internet, use these activate method overloads:

---

:::code source="v1/snippets/`{calling_technology}`/`{called_technology}`/activation.`{calling_ext}`" ID="Javonet_activate_wth_proxy":::

Specify the hostname and port or IP address in standard formats in the proxyHost field.

- hostname:port
- ip_address:port

## Activating Javonet using XML configuration file

There are many benefits to activating and setting up Javonet using an XML configuration file. It simplifies distribution of your application to your team, lets you update the Javonet license more quickly, and avoids hardcoded activation details.

During the first application use, Javonet searches for, and then automatically uses the XML configuration file to activate your application.

Simply name the file "javonet.xml" and place it in the root directory of your Java application.

Sample Javonet XML configuration file

:::code source="v1/snippets/common/xml-configuration-files/short-file/javonet.xml":::

Starting with version 1.3, Javonet supports proxy settings for activations. These settings can be defined as activate method arguments or as an optional tag in your XML configuration file using the following syntax:

:::code source="v1/snippets/common/xml-configuration-files/with-proxy/javonet.xml"::: -->