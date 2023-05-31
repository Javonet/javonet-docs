:::options
:title: Using Javonet Hardware Dongle
:description: Using Javonet Hardware Dongle
:::

# Using Javonet Hardware Dongle 

## Binding Javonet License to Hardware Dongle Instead of Machine  
  
In order to preserve flexibility of moving Javonet enabled software between different machines or transitioning to new machine during hardware upgrade you can purchase the Javonet Hardware USB Dongles that allows you to perform the activation against unique hardware ID stored in the dongle device.  
  
To perform the activation with hardware dongle you need to call **Javonet.setUseHardwareKey(true);** before calling activate method. Once this flag is set to true Javonet will try to read the hardware ID from USB dongle. If the key is not present Javonet will fail to start. The key must be constantly plugged to the machine that is using Javonet enabled software. License file "javonet.lic" generated after activation with USB dongle can be used on any machine with that USB dongle attached even if the internet connection is not available.  
  
You can contact our support to request pre-activated license file that will valid for multiple USB dongles if you purchased more than one Javonet license and have multiple Javonet Hardware USB Dongles.  
  
Example  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: UseJavonetHardwareDongle
:display: calling
:::
  
If you need even more flexibility and want to attach single license file to the application that will not need any modification in the future we can generate the pre-activate license file for self-signed dongle keys. These keys allows you to request new dongles for particular license key and distribute with your software without updating the license file embedded in your application package.  
  