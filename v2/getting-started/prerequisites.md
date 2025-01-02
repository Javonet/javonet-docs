:::options
:title: Prerequisites
:description: This article provides information about Javonet prerequisites
:related_articles: getting-started/about-javonet, getting-started/activating-javonet, getting-started/adding-references-to-libraries
:keywords: Javonet, `{called_name}` About, `{calling_name}`, Language Integration, Cross-Language Communication, .NET Framework, .NET Core, JAR Library, Python Package, Ruby Package, Perl Package, Node.js Package, Getting Started, Prerequisites, Installation, Runtime
:::

# About Javonet  
  
Javonet enables software developers to instantly integrate several programming languages. Javonet is available for Windows, Linux and Mac operating systems as a downloadable package for supported programming languages. This article lists prerequisites which need to be installed to call selected technologies.  
  
Javonet allows you to reference and use modules or packages written in (Java/Kotlin/Groovy/Clojure, C#/VB.NET, Ruby, Perl, Python, JavaScript/TypeScript) like they were created in your technology.  
  
## Prerequisites 

## Linux
  
Javonet needs several dependencies on Linux to run:  
  
libxml2-dev openssl libxmlsec1-dev libxmlsec1-openssl  

## Runtimes

To call library/package/module from another technology, corresponding runtime has to be installed:  
  
## .NET Framework DLL library

[.NET Framework 4.7.2 Runtime](https://dotnet.microsoft.com/en-us/download/dotnet-framework/net472) or higher  

## .NET DLL library

[.NET 6.0 x64 Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) or higher. .NET Core 3.1 can be used, but it is not longer officialy supported by Microsoft.  

Starting from Javonet v. 2.5.9:  
If there are multiple .NET runtimes installed on the machine, environment variable JAVONET_NETCORE_RUNTIME_VERSION can be set to use preferred runtime. The variable should have one of the following values: ["netcoreapp3.1", "net6.0", "net7.0", "net8.0", "net9.0"]. If the selected version is missing, the newest runtime version is selected to run Javonet.    

## JAR library

For example: [OpenJDK](https://www.openlogic.com/openjdk-downloads?field_java_parent_version_target_id=416&field_operating_system_target_id=All&field_architecture_target_id=391&field_java_package_target_id=All) or [Oracle](https://www.oracle.com/pl/java/technologies/javase/javase8u211-later-archive-downloads.html)  

Starting from Javonet v. 2.5.9:  
If there are multiple Java runtimes installed on the machine, environment variable JAVONET_JVM_RUNTIME_PATH can be set to use preferred Java runtime. The variable should point directory where this runtime is installed. (f.e. C:\Program Files\Java\jdk-11 on Windows).    

## Python package

[Python 3.8 or newer](https://www.python.org/downloads/).  

On Linux:
python3.\*-dev package needs to be installed corresponding to your Python version.  

Starting from Javonet v. 2.5.9:  
If there are multiple Python versions installed on the machine, environment variable  JAVONET_PYTHON_RUNTIME_PATH can be set to use preferred Python version.  

On Windows:
JAVONET_PYTHON_RUNTIME_PATH should point to the libpython3\*.dll file, for example:
JAVONET_PYTHON_RUNTIME_PATH="C:\Python313\python313.dll".

On Linux:  
JAVONET_PYTHON_RUNTIME_PATH should point to the libpython3.\*.so file, for example:
JAVONET_PYTHON_RUNTIME_PATH="/usr/lib/x86_64-linux-gnu/libpython3.13.so".

On MacOs
Python 3.11 is preffered to be used.

## Ruby package

[Ruby 2.7](https://rubyinstaller.org/downloads/) 

## Perl package

On Windows [Strawberry Perl 5.32](https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit.msi).  
On Linux and MacOS use Perl 5.30 or higher

## Node.js package

[Node.js 18.16](https://nodejs.org/dist/latest-v18.x/) or higher  
  
Read more [about](/guides/v2/`{calling_technology}`/`{called_technology}`/getting-started/about-javonet) use cases and software architecture scenarios where Javonet runtime bridging technology can support your development process.
