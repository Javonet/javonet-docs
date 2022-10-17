const {Javonet} = require('javonet/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const javonet_src_root = path.resolve(__dirname, '../../..')
// <TestResources_TestClassValues>
const libraryPath = javonet_src_root + '/testResources/ruby/ruby_test_class.rb'
const className = 'RubyTestClass::RubyTestClass'
// </TestResources_TestClassValues>

describe('NodeJS to Ruby integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)

    test(`Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoException`, () => {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().ruby().loadLibrary("base64")
        // </TestResources_LoadLibrary>
    })

    test(`Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_sqrt_2500_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        let call = Javonet.inMemory().ruby().getType("Math").invokeStaticMethod("sqrt", 2500).execute()
        let result = call.getValue()
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Ruby_StandardLibrary_GetStaticField_Math_PI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        let call = Javonet.inMemory().ruby().getType("Math").getStaticField("PI").execute()
        let result = call.getValue()
        // </StandardLibrary_GetStaticField>
        expect(result).toBeCloseTo(Math.PI, 6)
    })


    test(`Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().ruby().loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().ruby().loadLibrary(libraryPath)
        let call = Javonet.inMemory().ruby().getType(className).invokeStaticMethod("multiply_by_two", 25).execute()
        let result = call.getValue()
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Ruby_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        Javonet.inMemory().ruby().loadLibrary(libraryPath)
        let call = Javonet.inMemory().ruby().getType(className).getStaticField("static_value").execute()
        let result = call.getValue()
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Ruby_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        Javonet.inMemory().ruby().loadLibrary(libraryPath)
        Javonet.inMemory().ruby().getType(className).setStaticField("static_value", 75).execute()
        // </TestResources_SetStaticField>
        let call = Javonet.inMemory().ruby().getType(className).getStaticField("static_value").execute()
        let result = call.getValue()
        expect(result).toBe(75)
        Javonet.inMemory().ruby().getType(className).setStaticField("static_value", 3).execute()
    })

    test(`Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().ruby().loadLibrary(libraryPath)
        let instance = Javonet.inMemory().ruby().getType(className).createInstance(2, 3).execute()
        let call = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute()
        let result = call.getValue()
        // </TestResources_InvokeInstanceMethod>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(20)
    })

    test(`Test_Ruby_TestResources_GetInstanceField_PublicValue_1`, () => {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().ruby().loadLibrary(libraryPath)
        let instance = Javonet.inMemory().ruby().getType(className).createInstance(1, 2).execute()
        let call = instance.getInstanceField("public_value").execute()
        let result = call.getValue()
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(1)
    })

})
