const {Javonet} = require('javonet-nodejs-sdk/lib/Javonet')
const ActivationCredentials = require("../../utils/ActivationCredentials")

describe('Nodejs activation tests', () => {

    test(`Test_Activation_CorrectCredentials_Returns0`, () => {
        // <Javonet_activate>
        let result = Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)
        // </Javonet_activate>
        expect(result).toBe(0)
    })
})
