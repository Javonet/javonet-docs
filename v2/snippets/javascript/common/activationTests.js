const {Javonet} = require('javonet-nodejs-sdk/lib/sdk/Javonet')
const ActivationCredentials = require("../../utils/ActivationCredentials")
const {describe, expect, test} = require("@jest/globals");

describe('Nodejs activation tests', () => {

    test(`Test_Activation_CorrectCredentials_Returns0`, () => {
        // <Javonet_activate>
        let result = Javonet.activate(ActivationCredentials.yourLicenseKey)
        // </Javonet_activate>
        expect(result).toBe(0)
    })
})
