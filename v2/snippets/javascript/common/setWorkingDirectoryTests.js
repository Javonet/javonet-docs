const {Javonet} = require('javonet-nodejs-sdk')
const ActivationCredentials = require("../../utils/ActivationCredentials")
const {describe, expect, test} = require("@jest/globals");
const path = require('path');
const fs = require('fs');

describe('Nodejs set working directory tests', () => {

    test(`Test_SetWorkingDirectory`, () => {
        // <SetWorkingDirectory>
        // define path to be used as Javonet working directory
        const userHomeDirectory = require('os').homedir();
        const javonetWorkingDirectory = path.join(userHomeDirectory, "myNewDirectory");

        // set Javonet working directory
        Javonet.setJavonetWorkingDirectory(javonetWorkingDirectory);

        // use Activate only once in your app
        let result = Javonet.activate(ActivationCredentials.yourLicenseKey);
        expect(result).toBe(0);

        // create other runtime context
        let rtmCtx = Javonet.inMemory().netcore();

        // start interact with other runtime...
        // </SetWorkingDirectory>
        let response = rtmCtx.getType("System.Math").invokeStaticMethod("Abs", -13).execute();
        let resultValue = response.getValue();
        expect(resultValue).toBe(13);
        expect(fs.existsSync(path.join(javonetWorkingDirectory, "javonet.lic"))).toBe(true);
    })
})
