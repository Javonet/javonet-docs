const { Javonet } = require('javonet-nodejs-sdk/lib/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const resourcesDirectory = path.resolve(__dirname, '../../..') + '/testResources/jar-library'

describe('Nodejs to Jvm integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)

    test(`Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let jvmType = jvmRuntime.getType("java.lang.Math").execute()

        // invoke type's static method
        let response = jvmType.invokeStaticMethod("abs", -50).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let jvmType = jvmRuntime.getType("java.lang.Math").execute()

        // get type's field
        let response = jvmType.getStaticField("PI").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_GetStaticField>
        expect(result).toBe(Math.PI)
    })

    test(`Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let jvmType = jvmRuntime.getType("java.util.Random").execute()

        // create type's instance
        let instance = jvmType.createInstance().execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("nextInt", 10).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeInstanceMethod>
        expect(result).toBeGreaterThanOrEqual(0)
        expect(result).toBeLessThan(10)
    })

    test(`Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'

        // load custom library
        jvmRuntime.loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        jvmRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let jvmType = jvmRuntime.getType(className).execute()

        // invoke type's static method
        let response = jvmType.invokeStaticMethod("multiplyByTwo", 25).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Jvm_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        jvmRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let jvmType = jvmRuntime.getType(className).execute()

        // get type's static field
        let response = jvmType.getStaticField("staticValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Jvm_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        jvmRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let jvmType = jvmRuntime.getType(className).execute()

        // set static field's value
        jvmType.setStaticField("staticValue", 75).execute()

        // get static field's value
        let response = jvmType.getStaticField("staticValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetStaticField>
        jvmType.setStaticField("staticValue", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        jvmRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let jvmType = jvmRuntime.getType(className).execute()

        // create type's instance
        let instance = jvmType.createInstance(12, 13).execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("multiplyTwoNumbers", 5, 4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeInstanceMethod>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(20)
    })

    test(`Test_Jvm_TestResources_GetInstanceField_PublicValue_18`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create JVM runtime context
        let jvmRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        jvmRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let jvmType = jvmRuntime.getType(className).execute()

        // create type's instance
        let instance = jvmType.createInstance(18, 19).execute()

        // get instance's field
        let response = instance.getInstanceField("publicValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(18)
    })
    
})
