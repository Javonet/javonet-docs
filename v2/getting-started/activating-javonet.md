:::options
:title: Activating Javonet
:description: This article provides an information about activating Javonet
:::

# Activating Javonet

# Getting licence

In order to activate Javonet you need to get licence key. Please register on: 

https://my.javonet.com/signup/?type=free

If you already have an account, please login on: 

https://my.javonet.com/signin/ 

After logging in, go to Licence Keys subpage. There are your credentials and trial expiry date 

# Activating Javonet in your application

To start using Javonet in your application you need to activate your license first. This must be done before you use any other Javonet features.

:::code source="v1/snippets/`{called_technology}`/`{calling_technology}`/Activation.`{calling_ext}`" ID="Javonet_activate":::

Activation must be called only once at the start-up of your application. During the first activation, Javonet contacts our servers and generates a javonet.lic file in your application directory. All subsequent calls simply verify this file.