const {Javonet} = require('javonet-nodejs-sdk/lib/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const resourcesDirectory = path.resolve(__dirname, '../../..') + '/testResources/ruby-package'


describe('Nodejs to Ruby integration tests', () => {

    let result = Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)
    expect(result).toBe(0)

    test(`Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'

        //load custom library
        calledRuntime.loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Ruby_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        //load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // get type's static field
        let response = calledRuntimeType.getStaticField("static_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Ruby_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        //load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // set static field's value
        calledRuntimeType.setStaticField("static_value", 75).execute()

        // get type's static field
        let response = calledRuntimeType.getStaticField("static_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetStaticField>
        calledRuntimeType.setStaticField("static_value", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_Ruby_TestResources_GetInstanceField_PublicValue_18`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        //load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance(18, 19).execute()

        // get instance's field
        let response = instance.getInstanceField("public_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetInstanceField>
        expect(result).toBe(18)
    })

    test(`Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        //load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("multiply_by_two", 25).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        //load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeInstanceMethod>36)
        expect(result).toBe(20)
    })

    test(`Test_Ruby_TestResources_1DArray_GetIndex_2_StringThree`, () => {
        // <TestResources_1DArray_GetIndex>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get_1d_array").execute()

        // get index from array
        response = array.getIndex(2).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_GetIndex>
        expect(result).toBe("three")
    })

    test(`Test_Ruby_TestResources_1DArray_GetSize_5`, () => {
        // <TestResources_1DArray_GetSize>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get_1d_array").execute()

        // get array's size
        response = array.getSize().execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_GetSize>
        expect(result).toBe(5)
    })

    test(`Test_Ruby_TestResources_1DArray_SetIndex_StringSeven`, () => {
        // <TestResources_1DArray_SetIndex>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get_1d_array").execute()

        // set array's index
        array.setIndex("seven", 4).execute()

        // get index from array
        response = array.getIndex(4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_SetIndex>
        array.setIndex("five", 4).execute()
        expect(result).toBe("seven")
    })

    test(`Test_Ruby_TestResources_1DArray_Iterate`, () => {
        // <TestResources_1DArray_Iterate>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get_1d_array").execute()

        // create local array and store elements in it
        let arrayValues = []

        for (let element of array) {
            arrayValues.push(element.invokeInstanceMethod("upcase").execute().getValue())
        }

        // write result to console
        console.log(arrayValues)
        // </TestResources_1DArray_Iterate>
        expect(arrayValues).toEqual(["ONE", "TWO", "THREE", "FOUR", "FIVE"])
    })

    test(`Test_Ruby_TestResources_1DArray_PassArrayAsArgument`, () => {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("add_array_elements_and_multiply", ["", 12.22, 98.22, -10.44 ], 9.99).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_PassArrayAsArgument>
        expect(result).toEqual(999)
    })

    test(`Test_Ruby_StandardLibrary_GetStaticField_Math_PI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("Math").execute()

        // get type's field
        let response = calledRuntimeType.getStaticField("PI").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_GetStaticField>
        expect(result).toBeCloseTo(Math.PI, 6)
    })

    test(`Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("Math").execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("sqrt", 2500).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

})
