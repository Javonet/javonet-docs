:::options
:title: XML configuration file
:description: This article provides an information about XML configuration file
:related_articles: getting-started/installing-javonet, getting-started/activating-javonet, getting-started/adding-references-to-libraries
:::

# XML Configuration file
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
  
There are many benefits to activating and setting up Javonet using an XML configuration file. It simplifies distribution of your application to your team, lets you update the Javonet license, references and framework configuration more quickly, and avoids hardcoded activation and configuration details.  
  
During the first application use, Javonet searches for, and then automatically uses the XML configuration file to activate and configure your application.  
  
Simply name the file "javonet.xml" and place it in the root directory of your Java application.  
  
Below you can find the full structure of the XML configuration file. Some of the tags are optional. 
  
:::code source="v1/snippets/xml-configuration-files/all-options/javonet.xml":::