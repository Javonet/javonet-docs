:::options
:title: Delegation Activation Server
:description: This section describes how to delegate activation server
:related_articles: advanced-activation-and-licensing/project-activation-tool, advanced-activation-and-licensing/runtime-offline-compile-time-activation
:::

# Delegating Activation Server

## Overview  
  
Activation server delegation means temporary delegation of performing compile time activation to one of the local on-premise or cloud servers. Delegation can be used to achieve 100% availability of activation service even if Javonet activation server is not accessible. To delegate activation server role to one of the local machines you need Enterprise License with "No Hardware ID Check" and "Never Expiry" options and activation server delegation hardware dongle.

## Requesting Dongle  
  
In order to apply for delegation dongle please contact our support team at support@javonet.com.  

## Installing Dongle  
  
Dongle should be installed on any on-premise physical server with USB port. To setup the dongle plugin it to the PC and install drivers available here: http://download.javonet.com/dongle_drivers.zip  

## Delegation Overview  
  
With hardware dongle you should receive the delegation license "javonet.delegation.lic". Delegation license has temporary keypair signed by Javonet activation server allowing you to delegate any of your physical or virtual machines to act as activation server up to 6mix after expiry of your current subscription renewal period.  
  
Copying the delegation license to the project activation tool directory you can generate any number of delegations for the hardware IDs of machines that will be delegated to act as activation server. Generating delegation you will receive new "javonet.delegate" file.  
  
Moving delegation file and delegation license to the project activation tool directory on any server that needs to perform the compile time activation (i.e. build server) you will be able to generate Javonet license bound to your project libraries without internet access.  
  
## Delegating New Activation Server  
  
1) Download latest Project Activation Tool: Javonet.ProjectLicenseGenerator.exe  
2) Copy Project Activation Tool to target server that will be used to generate Javonet license for your project  
3) Run following command: "Javonet.ProjectLicenseGenerator.exe -hid"  
4) Write down the hardware ID of target machine  
5) Copy Project Activation Tool to any local physical machine with USB port  
6) Copy javonet.delegation.lic to the folder of PAT tool  
7) Plugin dongle and make sure drivers are properly identified  
8) Run following command: "Javonet.ProjectLicenseGenerator.exe -delegate HARDWARE_ID" (in place of HARDWARE_ID put the id received in step 4)  
9) Save the javonet.delegate file generated  
10)Copy javonet.delegate file and javonet.delegation.lic to the PAT tool directory on target server  
11)Run your activation command. New license should be generated even if there is no internet access or no connectivity to Javonet Activation Server.  
  
Generated license for particular state of the project will be respecting all rules of your license and therefore will allow to be used on any machine and without time limits.  
  
## Renewing delegation license  
  
With each renewal of your subscription you will receive updated delegation license valid for 6months after updated renewal date.