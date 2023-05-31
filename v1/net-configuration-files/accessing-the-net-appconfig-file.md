:::options
:title: Accessing the .NET AppConfig File (connectionStrings and appSettings)
:description: Accessing the .NET AppConfig File (connectionStrings and appSettings)
:::

# Accessing the .NET AppConfig File 

## Accessing the .NET AppConfig File (connectionStrings and appSettings)  

If your .NET logic uses App.Config files, reads information from connectionStrings sections, appSettings or needs any other data from configuration, you can use Javonet to load this file.    
  
To do this, use the following method in your application. This method should be called just after activating Javonet and before any other operation. Simply add this method to your application and call it by passing the path to your config file.     

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: AccessNetAppConfigFile
:display: calling
:::
  