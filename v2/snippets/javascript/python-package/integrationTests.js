const { Javonet } = require('javonet-nodejs-sdk/lib/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const resourcesDirectory = path.resolve(__dirname, '../../..') + '/testResources/python-package'

describe('Nodejs to Python integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)

    test(`Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PYTHON runtime context
        let pythonRuntime = Javonet.inMemory().python()

        // get type from the runtime
        let pythonType = pythonRuntime.getType('builtins').execute()

        // invoke type's static method
        let response = pythonType.invokeStaticMethod("abs", -50).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Python_StandardLibrary_GetStaticField_Math_PI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PYTHON runtime context
        let pythonRuntime = Javonet.inMemory().python()

        // get type from the runtime
        let pythonType = pythonRuntime.getType('math').execute()

        // get type's field
        let response = pythonType.getStaticField("pi").execute()

        // get value from response
        let result = response.getValue()
        // </StandardLibrary_GetStaticField>
        expect(result).toBeCloseTo(Math.PI, 6)
    })


    test(`Test_Python_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PYTHON runtime context
        let pythonRuntime = Javonet.inMemory().python()

        //set up variables
        const libraryPath = resourcesDirectory

        // load custom library
        pythonRuntime.loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PYTHON runtime context
        let pythonRuntime = Javonet.inMemory().python()

        //set up variables
        const libraryPath = resourcesDirectory
        const className = "TestClass.TestClass"

        // load custom library
        pythonRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let pythonType = pythonRuntime.getType(className).execute()

        // invoke type's static method
        let response = pythonType.invokeStaticMethod("multiply_by_two", 25).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Python_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PYTHON runtime context
        let pythonRuntime = Javonet.inMemory().python()

        //set up variables
        const libraryPath = resourcesDirectory
        const className = "TestClass.TestClass"

        // load custom library
        pythonRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let pythonType = pythonRuntime.getType(className).execute()

        // get type's static field
        let response = pythonType.getStaticField("static_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Python_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PYTHON runtime context
        let pythonRuntime = Javonet.inMemory().python()

        //set up variables
        const libraryPath = resourcesDirectory
        const className = "TestClass.TestClass"

        // load custom library
        pythonRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let pythonType = pythonRuntime.getType(className).execute()

        // set static field's value
        pythonType.setStaticField("static_value", 75).execute()

        // get type's static field
        let response = pythonType.getStaticField("static_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetStaticField>
        pythonType.setStaticField("static_value", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PYTHON runtime context
        let pythonRuntime = Javonet.inMemory().python()

        //set up variables
        const libraryPath = resourcesDirectory
        const className = "TestClass.TestClass"

        // load custom library
        pythonRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let pythonType = pythonRuntime.getType(className).execute()

        // create type's instance
        let instance = pythonType.createInstance(12, 13).execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeInstanceMethod>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(20)
    })

    test(`Test_Python_TestResources_GetInstanceField_PublicValue_18`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PYTHON runtime context
        let pythonRuntime = Javonet.inMemory().python()

        //set up variables
        const libraryPath = resourcesDirectory
        const className = "TestClass.TestClass"

        // load custom library
        pythonRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let pythonType = pythonRuntime.getType(className).execute()

        // create type's instance
        let instance = pythonType.createInstance(18, 19).execute()

        // get instance's field
        let response = instance.getInstanceField("public_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(18)
    })
    
})
