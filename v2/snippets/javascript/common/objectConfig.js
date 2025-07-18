const { Javonet } = require("javonet-nodejs-sdk");
const { describe, expect, test } = require("@jest/globals");
const ActivationCredentials = require("../../utils/ActivationCredentials");

describe("Browser config tests", () => {
  test(`Test_Channel_WithConfigurationObject_Success `, () => {
    // <WithConfigurationObject>
    // use Activate only once in your app
    Javonet.activate(ActivationCredentials.yourLicenseKey);

    // Set up configuration Object
    let configObject = {
      runtimes: {
        jvm: [
          {
            name: "default",
            customOptions: "",
            modules: "./",
            channel: {
              type: "inMemory",
            },
          },
        ],
      },
    };

    let communicationChannel = Javonet.withConfig(configObject);
    // use communicationChannel to create runtimes to interact with
    // </WithConfigurationObject>
    expect(communicationChannel).not.toBeNull();
  });
});
