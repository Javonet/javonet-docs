const {Javonet} = require('javonet/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const javonet_src_root = path.resolve(__dirname, '../../..')
// <TestResources_TestClassValues>
const libraryPath = javonet_src_root + '/testResources/jvm/JavaTestClass.jar'
const className = 'javonet.test.resources.jvm.JavaTestClass'
// </TestResources_TestClassValues>

describe('NodeJS to Jvm integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)

    test(`Test_Jvm_StandardLibrary_InvokeStaticMethod_javalangMath_abs_minus50_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        let call = Javonet.inMemory().jvm().getType("java.lang.Math").invokeStaticMethod("abs", -50).execute()
        let result = call.getValue()
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Jvm_StandardLibrary_GetStaticField_javalangMathPI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        let call = Javonet.inMemory().jvm().getType("java.lang.Math").getStaticField("PI").execute()
        let result = call.getValue()
        // </StandardLibrary_GetStaticField>
        expect(result).toBe(Math.PI)
    })

    test(`Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        let instance = Javonet.inMemory().jvm().getType("java.util.Random").createInstance().execute()
        let call = instance.invokeInstanceMethod("nextInt", 10).execute()
        let result = call.getValue()
        // </StandardLibrary_InvokeInstanceMethod>
        expect(result).toBeGreaterThanOrEqual(0)
        expect(result).toBeLessThan(10)
    })

    test(`Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().jvm().loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().jvm().loadLibrary(libraryPath)
        let call = Javonet.inMemory().jvm().getType(className).invokeStaticMethod("multiplyByTwo", 25).execute()
        let result = call.getValue()
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Jvm_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        Javonet.inMemory().jvm().loadLibrary(libraryPath)
        let call = Javonet.inMemory().jvm().getType(className).getStaticField("staticValue").execute()
        let result = call.getValue()
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Jvm_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        Javonet.inMemory().jvm().loadLibrary(libraryPath)
        Javonet.inMemory().jvm().getType(className).setStaticField("staticValue", 75).execute()
        // </TestResources_SetStaticField>
        let call = Javonet.inMemory().jvm().getType(className).getStaticField("staticValue").execute()
        let result = call.getValue()
        expect(result).toBe(75)
        Javonet.inMemory().jvm().getType(className).setStaticField("staticValue", 3).execute()
    })

    test(`Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().jvm().loadLibrary(libraryPath)
        let instance = Javonet.inMemory().jvm().getType(className).createInstance(2, 3).execute()
        let call = instance.invokeInstanceMethod("multiplyTwoNumbers", 5, 4).execute()
        let result = call.getValue()
        // </TestResources_InvokeInstanceMethod>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(20)
    })

    test(`Test_Jvm_TestResources_GetInstanceField_PublicValue_1`, () => {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().jvm().loadLibrary(libraryPath)
        let instance = Javonet.inMemory().jvm().getType(className).createInstance(1, 2).execute()
        let call = instance.getInstanceField("publicValue").execute()
        let result = call.getValue()
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(1)
    })
    
})
