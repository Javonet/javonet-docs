const {Javonet} = require('javonet/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const javonet_src_root = path.resolve(__dirname, '../../..')
// <TestResources_TestClassValues>
const libraryPath = javonet_src_root + '/testResources/python'
const className = 'PythonTestClass.PythonTestClass'
// </TestResources_TestClassValues>

describe('NodeJS to Python integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)

    test(`Test_Python_StandardLibrary_InvokeStaticMethod_Math_Abs_minus50_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        let call = Javonet.inMemory().python().getType("builtins").invokeStaticMethod("abs", -50).execute()
        let result = call.getValue()
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Python_StandardLibrary_GetStaticField_Math_PI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        let call = Javonet.inMemory().python().getType("math").getStaticField("pi").execute()
        let result = call.getValue()
        // </StandardLibrary_GetStaticField>
        expect(result).toBeCloseTo(Math.PI, 6)
    })


    test(`Test_Python_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().python().loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().python().loadLibrary(libraryPath)
        let call = Javonet.inMemory().python().getType(className).invokeStaticMethod("multiply_by_two", 25).execute()
        let result = call.getValue()
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Python_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        Javonet.inMemory().python().loadLibrary(libraryPath)
        let call = Javonet.inMemory().python().getType(className).getStaticField("static_value").execute()
        let result = call.getValue()
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Python_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        Javonet.inMemory().python().loadLibrary(libraryPath)
        Javonet.inMemory().python().getType(className).setStaticField("static_value", 75).execute()
        // </TestResources_SetStaticField>
        let call = Javonet.inMemory().python().getType(className).getStaticField("static_value").execute()
        let result = call.getValue()
        expect(result).toBe(75)
        Javonet.inMemory().python().getType(className).setStaticField("static_value", 3).execute()
    })

    test(`Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().python().loadLibrary(libraryPath)
        let instance = Javonet.inMemory().python().getType(className).createInstance(2, 3).execute()
        let call = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute()
        let result = call.getValue()
        // </TestResources_InvokeInstanceMethod>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(20)
    })

    test(`Test_Python_TestResources_GetInstanceField_PublicValue_1`, () => {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().python().loadLibrary(libraryPath)
        let instance = Javonet.inMemory().python().getType(className).createInstance(1, 2).execute()
        let call = instance.getInstanceField("public_value").execute()
        let result = call.getValue()
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(1)
    })
    
})
