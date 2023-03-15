:::options
:title: Activating Javonet
:description: This article provides an information about activating Javonet
:::

# Activating Javonet

## Getting license

In order to activate Javonet you need to get your license key. Please use [register webpage](https://my.javonet.com/signup/?type=free) 

If you already have an account, please [log in](https://my.javonet.com/signin/) 

After logging in, go to License Keys tab. There are your credentials and trial expiry date.

## Activating Javonet in your application

To start using Javonet in your `{calling_name}` application you need to activate your license first. This must be done before you use any other Javonet feature.

:::code 
calling_source="v2/snippets/`{calling_technology}`/common/activation.`{calling_ext}`" 
calling_id="Javonet_activate"
display="calling"
:::

Activation must be called only once at the start-up of your `{calling_name}` application. During the first activation, Javonet contacts our servers and generates a javonet.lic file in your application directory. All subsequent calls simply verify this file.
