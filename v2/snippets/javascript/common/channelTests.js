const {Javonet} = require('javonet-nodejs-sdk')
const TcpConnectionData = require('javonet-nodejs-sdk')
const {describe, expect, test} = require("@jest/globals");
const path = require("path");


describe('Nodejs channel tests', () => {

    const resourcesDirectory = path.resolve(__dirname, '../../../..') + '/testResources/configuration-file'

    test(`Test_Channel_InMemory_Success`, () => {
        // <InMemoryChannel>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        let communicationChannel = Javonet.inMemory()
        // use communicationChannel to create runtimes to interact with
        // </InMemoryChannel>
        expect(communicationChannel).not.toBeNull()
    })

    test(`Test_Channel_Tcp_Success`, () => {
        // <TcpChannel>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        let connectionData = TcpConnectionData["127.0.0.1", 8083]
        let communicationChannel = Javonet.tcp(connectionData)
        // use communicationChannel to create runtimes to interact with
        // </TcpChannel>
        expect(communicationChannel).not.toBeNull()
    })

    test(`Test_Channel_WithConfigurationFile_Success`, () => {
        // <WithConfigurationFile>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // set up variables
        let configFile = resourcesDirectory + "/javonetconf.json"
        let communicationChannel = Javonet.withConfig(configFile)
        // use communicationChannel to create runtimes to interact with
        // </WithConfigurationFile>
        expect(communicationChannel).not.toBeNull()
    })
})
