:::options
:title: XML configuration file
:description: This article provides an information about XML configuration file
:related_articles: getting-started/installing-javonet, getting-started/activating-javonet, getting-started/adding-references-to-libraries
:::

# XML Configuration file

There are many benefits to activating and setting up Javonet using an XML configuration file. It simplifies distribution of your application to your team, lets you update the Javonet license, references and framework configuration more quickly, and avoids hardcoded activation and configuration details.  
  
During the first application use, Javonet searches for, and then automatically uses the XML configuration file to activate and configure your application.  
  
Simply name the file "javonet.xml" and place it in the root directory of your Java application.  
  
Below you can find the full structure of the XML configuration file. Some of the tags are optional. 
  
:::code source="v1/snippets/xml-configuration-files/all-options/javonet.xml":::