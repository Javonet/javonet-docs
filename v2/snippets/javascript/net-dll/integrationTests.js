const {Javonet} = require('javonet-nodejs-sdk/lib/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const resourcesDirectory = path.resolve(__dirname, '../../..') + '/testResources/net-dll'


describe('Nodejs to Netcore integration tests', () => {

    let result = Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)
    expect(result).toBe(0)

    test(`Test_Netcore_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Netcore_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // get type's static field
        let response = calledRuntimeType.getStaticField("StaticValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Netcore_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // set static field's value
        calledRuntimeType.setStaticField("StaticValue", 75).execute()

        // get static field's value
        let response = calledRuntimeType.getStaticField("StaticValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetStaticField>
        calledRuntimeType.setStaticField("StaticValue", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_Netcore_TestResources_GetInstanceField_PublicValue_18`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance(18, 19).execute()

        // get instance's field
        let response = instance.getInstanceField("PublicValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetInstanceField>
        expect(result).toBe(18)
    })

    test(`Test_Netcore_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("MultiplyByTwo", 25).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("MultiplyTwoNumbers", 5, 4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeInstanceMethod>
        expect(result).toBe(20)
    })

    test(`Test_Netcore_TestResources_1DArray_GetIndex_2_StringThree`, () => {
        // <TestResources_1DArray_GetIndex>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("Get1DArray").execute()

        // get index from array
        let response = array.getIndex(2).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_GetIndex>
        expect(result).toBe("three")
    })

    test(`Test_Netcore_TestResources_1DArray_GetSize_5`, () => {
        // <TestResources_1DArray_GetSize>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("Get1DArray").execute()

        // get array's size
        let response = array.getSize().execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_GetSize>
        expect(result).toBe(5)
    })

    test(`Test_Netcore_TestResources_1DArray_SetIndex_StringSeven`, () => {
        // <TestResources_1DArray_SetIndex>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("Get1DArray").execute()

        // set array's index
        array.setIndex("seven", 4).execute()

        // get index from array
        let response = array.getIndex(4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_SetIndex>
        array.setIndex("five", 4).execute()
        expect(result).toBe("seven")
    })

    test(`Test_Netcore_TestResources_1DArray_Iterate`, () => {
        // <TestResources_1DArray_Iterate>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("Get1DArray").execute()

        // create local array and store elements in it
        let arrayValues = []

        for (let element of array) {
            arrayValues.push(element.invokeInstanceMethod("ToUpper").execute().getValue())
        }

        // write result to console
        console.log(arrayValues)
        // </TestResources_1DArray_Iterate>
        expect(arrayValues).toEqual(["ONE", "TWO", "THREE", "FOUR", "FIVE"])
    })

    test(`Test_Netcore_TestResources_1DArray_PassArrayAsArgument`, () => {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("AddArrayElementsAndMultiply", [12.22, 98.22, -10.44], 9.99).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_PassArrayAsArgument>
        expect(result).toEqual(999)
    })

    test(`Test_Netcore_TestResources_1DArray_RetrieveArray`, () => {
        // <TestResources_1DArray_RetrieveArray>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let arrayReference = instance.invokeInstanceMethod("Get1DArray").execute()

        // get value from response
        let result = arrayReference.retrieveArray()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_RetrieveArray>
        expect(result).toEqual(["one", "two", "three", "four", "five"])
    })

    test(`Test_Netcore_TestResources_Cast_ToUInt32`, () => {
        // <TestResources_Cast_ToUInt>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("CastSampleMethod", calledRuntime.cast("System.UInt32", 5.2)).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_Cast_ToUInt>
        expect(result).toBe("CastSampleMethod with System.UInt32 called")
    })

    test(`Test_Netcore_TestResources_Cast_ToFloat`, () => {
        // <TestResources_Cast_ToFloat>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/TestClass.dll'
        let className = 'TestClass.TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("CastSampleMethod", calledRuntime.cast("System.Single", 5)).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_Cast_ToFloat>
        expect(result).toBe("CastSampleMethod with System.Single called")
    })

    test(`Test_Netcore_StandardLibrary_GetStaticField_Math_PI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("System.Math").execute()

        // get type's static field
        let response = calledRuntimeType.getStaticField("PI").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_GetStaticField>
        expect(result).toBe(Math.PI)
    })

    test(`Test_Netcore_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("System.DateTime").execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance(2022, 9, 2).execute()

        // get instance's field
        let response = instance.getInstanceField("Year").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeInstanceMethod>
        expect(result).toBe(2022)
    })

    test(`Test_Netcore_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("System.Math").execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("Abs", -50).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().netcore()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("System.DateTime").execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance(2022, 9, 2).execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("ToShortDateString").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeInstanceMethod>
        expect(result).toContain("2022")
    })

})
