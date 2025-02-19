const {Javonet} = require('javonet-nodejs-sdk')
const {describe, expect, test} = require("@jest/globals");
const path = require("path");
const ActivationCredentials = require("../../utils/ActivationCredentials")
const {TcpConnectionData} = require('javonet-nodejs-sdk')

describe('Nodejs channel tests', () => {

    const resourcesDirectory = path.resolve(__dirname, '../../../..') + '/testResources/configuration-file'

    test(`Test_Channel_InMemory_Success`, () => {
        // <InMemoryChannel>
        // use Activate only once in your app
        Javonet.activate(ActivationCredentials.yourLicenseKey)

        let communicationChannel = Javonet.inMemory()
        // use communicationChannel to create runtimes to interact with
        // </InMemoryChannel>
        expect(communicationChannel).not.toBeNull()
    })

    test(`Test_Channel_Tcp_Success`, () => {
        // <TcpChannel>
        // use Activate only once in your app
        Javonet.activate(ActivationCredentials.yourLicenseKey)

        let connectionData = new TcpConnectionData("127.0.0.1", 8080)
        let communicationChannel = Javonet.tcp(connectionData)
        // use communicationChannel to create runtimes to interact with
        // </TcpChannel>
        expect(communicationChannel).not.toBeNull()
    })

    test(`Test_Channel_WithConfigurationFile_Success`, () => {
        // <WithConfigurationFile>
        // use Activate only once in your app
        Javonet.activate(ActivationCredentials.yourLicenseKey)

        // set up variables
        let configFile = resourcesDirectory + "/channel-tests-config.json"
        let communicationChannel = Javonet.withConfig(configFile)
        // use communicationChannel to create runtimes to interact with
        // </WithConfigurationFile>
        expect(communicationChannel).not.toBeNull()
    })
})
