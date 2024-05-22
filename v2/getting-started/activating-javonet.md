:::options
:title: Activating Javonet in `{calling_name}`
:description: This article provides information about activating Javonet in `{calling_name}`
:related_articles: getting-started/about-javonet, getting-started/prerequisites, getting-started/adding-references-to-libraries
:keywords: Javonet, `{called_name}` Activation, `{calling_name}`, License Key, Software Activation, License Activation, Register, Log In, Application Startup, License Verification, javonet.lic
:::

# Activating Javonet in `{calling_name}`
  
Javonet enables software developers to instantly integrate several programming languages. Javonet is available for Windows, Linux and Mac operating systems as a downloadable package for supported programming languages. This article lists getting started sections for supported technologies.  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology.  

## Get activation key  
  
Activation key is available on main dashboard of [My Javonet Portal](https://my.javonet.com).  

Use [register](https://my.javonet.com/signup/?type=free) or [log in](https://my.javonet.com/signin/) on My Javonet Portal to get license key, which is necessary to activate Javonet.  

## Activating Javonet in your application

Javonet needs to be activated first. Activation must be called only once at the start-up of an application. During the first activation, license server are called and a javonet.lic file is generated.  

:::code
:calling_source: v2/snippets/`{calling_technology}`/common/activationTests.`{calling_ext}`
:calling_id: Javonet_activate
:display: calling
:::
  
During the first activation, Javonet contacts our servers and generates a javonet.lic file in your application directory. All subsequent calls simply verify this file.