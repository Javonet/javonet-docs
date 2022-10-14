:::options
:title: Activating Javonet
:description: This article provides an information about activating Javonet
:::

# Activating Javonet

## Getting licence

In order to activate Javonet you need to get your licence key. Please use [register webpage](https://my.javonet.com/signup/?type=free) 

If you already have an account, please [log in](https://my.javonet.com/signin/) 

After logging in, go to Licence Keys subpage. There are your credentials and trial expiry date.

## Activating Javonet in your application

To start using Javonet in your `{calling_technology}` application you need to activate your license first. This must be done before you use any other Javonet feature.

:::code source="v2/snippets/`{calling_technology}`/common/activation.`{calling_ext}`" ID="Javonet_activate":::

Activation must be called only once at the start-up of your `{calling_technology}` application. During the first activation, Javonet contacts our servers and generates a javonet.lic file in your application directory. All subsequent calls simply verify this file.

TEST:
`{calling_technology}`

`{called_technology}`

`{calling_ext}`

`{called_ext}`

`{name}`

`{slug}`

