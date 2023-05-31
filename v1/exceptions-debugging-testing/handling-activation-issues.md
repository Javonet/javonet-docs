:::options
:title: Handling activation issues
:description: Handling activation issues
:related_articles: exceptions-debugging-testing/debugging-javonet-enabled-application, exceptions-debugging-testing/handling-exceptions, exceptions-debugging-testing/debug-net-code-called-from-java
:::

# Handling activation issues  
  
Javonet activation works in two modes. Synchronous and asynchronous. The activation mode depends on the condition if the license file is available or provided as in code.  
  
## Using standard activation with license key  
  
This chapter refers to standard activation where license key is passed either to activate method or configured in XML configuration file.  
  
If there is no license file and standard activation method is called Javonet will execute synchronous activation. Once the activation is successful Javonet stores the javonet.lic file in the application working directory or directory indicated using **Javonet.setLicenseDirectory(…).**  
  
If you have offline generated license or license activated per project files it can be placed in the license or working directory manually or with your package deployment. Each execution of the application when license file is available will trigger the asynchronous activation mode.  
  
- **synchronous activation** - call on Javonet.activate(...) method or first usage of Javonet with XML config file, triggers the execution of activation logic which calls Javonet activation server and receives the activation confirmation and license file. Due to the cryptography operations and need to process the activation request by activation server this call might take up to few seconds.  
  
- **asynchronous activation** -  when license file is available call of Javonet.activate(...) method or first usage of Javonet with XML config file will extract license limits from license file and trigger the asynchronous thread which will perform the license verification. During the license verification Javonet will work like it was activated properly. This approach guarantees fast execution of your application and no unnecessary delays. Asynchronous license verification will validate the license, machine hardware ID and license expiry date. If all checks are successful Javonet will become activated. If any check like hardware ID, license expiry date or license integrity is not fulfilled, Javonet will try to renew the license by contacting Javonet activation server and replacing the license file. If that will be successful Javonet will repeat the license verification, otherwise will get blocked and all further calls on Javonet API will be rejected.  
  



  
