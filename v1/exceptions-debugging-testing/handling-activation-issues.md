:::options
:title: Handling activation issues
:description: Handling activation issues
:related_articles: exceptions-debugging-testing/handling-exceptions, exceptions-debugging-testing/debug-net-code-called-from-java, exceptions-debugging-testing/debugging-javonet-enabled-application
:::

# Handling activation issues  
  
Javonet activation works in two modes. Synchronous and asynchronous. The activation mode depends on the condition if the license file is available or provided as in code.  
  
## Using standard activation with license key  
  
This chapter refers to standard activation where license key is passed either to activate method or configured in XML configuration file.  
  
If there is no license file and standard activation method is called Javonet will execute synchronous activation. Once the activation is successful Javonet stores the javonet.lic file in the application working directory or directory indicated using **Javonet.setLicenseDirectory(…).**  
  
If you have offline generated license or license activated per project files it can be placed in the license or working directory manually or with your package deployment. Each execution of the application when license file is available will trigger the asynchronous activation mode.  
  
**synchronous activation** - call on Javonet.activate(...) method or first usage of Javonet with XML config file, triggers the execution of activation logic which calls Javonet activation server and receives the activation confirmation and license file. Due to the cryptography operations and need to process the activation request by activation server this call might take up to few seconds.  
  
**asynchronous activation** -  when license file is available call of Javonet.activate(...) method or first usage of Javonet with XML config file will extract license limits from license file and trigger the asynchronous thread which will perform the license verification. During the license verification Javonet will work like it was activated properly. This approach guarantees fast execution of your application and no unnecessary delays. Asynchronous license verification will validate the license, machine hardware ID and license expiry date. If all checks are successful Javonet will become activated. If any check like hardware ID, license expiry date or license integrity is not fulfilled, Javonet will try to renew the license by contacting Javonet activation server and replacing the license file. If that will be successful Javonet will repeat the license verification, otherwise will get blocked and all further calls on Javonet API will be rejected.  
  
**Important** In case of license expiration if Javonet will not be able to contact activation server it will keep working properly for another 180 days of grace period. Read more in Subscription and License File Grace Period section.

## Listening for Activation and License Verification Issues  
  
t is important to properly handle the Javonet activation issues and potential license rejection and blocking of an API. For that purpose we have expose new method to subscribe for license activation state notifications **Javonet.addActivationStateListener(…)**. Activation state listener passed to this method will be notified about each critical change in Javonet activation state both in synchronous and asynchronous mode. It can be used to detect the license grace period or activation rejection, to properly handle that in your application.  
  
Check the code below to see how you can subscribe to activation state update events:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: HandlingActivationIssues
:display: calling
:::
  
This method must be called before calling Javonet.activate and cannot be used with XML configuration file.  
  
First argument of the method returns the enum value indicating the type of activation event and second argument provides detailed open text description. Possible activation states are:  
  
- Started - activation has been initiated (not used in current release)
- Verified - license verification has been completed with success
- NewLicenseGenerated - new license file has been generated (not used in current release)
- LicenseInvalid - license is corrupted (not used in current release)
- LicenseExpired BLOCKING - license has expired and grace period has passed, Javonet usage will be blocked
- LicenseInGracePeriod - license has expired but is still within grace period, Javonet was not able to renew the license from the server. License renewal will be retried with next execution.
- LicenseFileNotExisting - license file does not exist (not used in current release)
- ActivationRejectedByServer BLOCKING - license file has expired, Javonet tried to renew the license but activation server rejected the activation. Detailed reason will be provided in second argument. Javonet usage will be blocked.
- Exception - other unknown exception occurred  
  