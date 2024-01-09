:::options
:title: Using Javonet Hardware Dongle
:description: Using Javonet Hardware Dongle
:keywords: Javonet, Hardware Dongle, `{called_technology}`, `{calling_technology}`, Java, .NET, JVM, CLR, Netcore, Windows, Linux, MacOS, License Activation, USB Dongle, Hardware ID, Javonet Activation, License Flexibility
:::

# Using Javonet Hardware Dongle 
<div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
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
  