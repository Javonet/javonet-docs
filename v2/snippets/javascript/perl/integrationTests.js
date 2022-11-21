const {Javonet} = require('javonet/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const javonet_src_root = path.resolve(__dirname, '../../..')
// <TestResources_TestClassValues>
const libraryPath = javonet_src_root + '/testResources/perl'
const fileName = 'PerlTestClass.pm'
const className = 'PerlTestClass::PerlTestClass'
// </TestResources_TestClassValues>

describe('Nodejs to Perl integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)


    test(`Test_Perl_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName)
        let call = Javonet.inMemory().perl().getType(className).invokeStaticMethod("multiply_by_two", 25).execute()
        let result = call.getValue()
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Perl_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName)
        let call = Javonet.inMemory().perl().getType(className).getStaticField("static_value").execute()
        let result = call.getValue()
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Perl_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName)
        Javonet.inMemory().perl().getType(className).setStaticField("static_value", 75).execute()
        // </TestResources_SetStaticField>
        let call = Javonet.inMemory().perl().getType(className).getStaticField("static_value").execute()
        let result = call.getValue()
        Javonet.inMemory().perl().getType(className).setStaticField("static_value", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName)
        let instance = Javonet.inMemory().perl().getType(className).createInstance().execute()
        let call = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute()
        let result = call.getValue()
        // </TestResources_InvokeInstanceMethod>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(20)
    })

    test(`Test_Perl_TestResources_GetInstanceField_PublicValue_1`, () => {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName)
        let instance = Javonet.inMemory().perl().getType(className).createInstance().execute()
        let call = instance.getInstanceField("public_value").execute()
        let result = call.getValue()
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(1)
    })

})
