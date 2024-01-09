:::options
:title: Activating Javonet
:description: This article provides information about activating Javonet
:related_articles: getting-started/about-javonet, getting-started/getting-started-dotnet, getting-started/getting-started-java, getting-started/getting-started-perl, getting-started/getting-started-python, getting-started/getting-started-ruby, getting-started/getting-started-nodejs, getting-started/getting-started-cpp, getting-started/getting-started-golang, getting-started/adding-references-to-libraries
:keywords: Javonet, `{called_technology}` Activation, `{calling_technology}`, License Key, Software Activation, License Activation, Register, Log In, Application Startup, License Verification, javonet.lic
:::


# Activating Javonet

## Get activation key
  
Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) pages to get license key, which is necessary to activate Javonet.

## Activating Javonet in your application

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. During the first activation, license server are called and a javonet.lic file is generated. 

:::code 
:calling_source: v2/snippets/`{calling_technology}`/common/activation.`{calling_ext}`
:calling_id: Javonet_activate
:display: calling
:::
  
During the first activation, Javonet contacts our servers and generates a javonet.lic file in your application directory. All subsequent calls simply verify this file.