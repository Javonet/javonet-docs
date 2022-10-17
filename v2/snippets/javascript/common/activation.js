const {Javonet} = require('javonet/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials");

describe('NodeJS activation tests', () => {

    test(`Test_Activation_CorrectCredentials_Returns0`, () => {
        // <Javonet_activate>
        let result = Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)
        // </Javonet_activate>
        expect(result).toBe(0)
    })
})
