// use Activate only once in your app
Javonet.activate(ActivationCredentials.yourLicenseKey)

// Set up configuration Object
let configObject = {
  runtimes: {
    jvm: [
      {
        name: 'default',
        customOptions: '',
        modules: './',
        channel: {
          type: 'inMemory',
        },
      },
    ],
  }
};

let communicationChannel = Javonet.withConfig(configObject)
// use communicationChannel to create runtimes to interact with
