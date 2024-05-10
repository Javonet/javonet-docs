const {Javonet} = require('javonet-nodejs-sdk/lib/sdk/Javonet')
const ActivationCredentials = require("../../utils/ActivationCredentials")
const path = require('path')
const {expect, describe, test} = require("@jest/globals");

const resourcesDirectory = path.resolve(__dirname, '../../../..') + '/testResources/ruby-package'


describe('Nodejs to Ruby Package integration tests', () => {

    let result = Javonet.activate(ActivationCredentials.yourLicenseKey)
    expect(result).toBe(0)

    test(`Test_RubyPackage_StandardLibrary_GetStaticField`, () => {
        // <StandardLibrary_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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

    test(`Test_RubyPackage_StandardLibrary_InvokeStaticMethod`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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

    test(`Test_RubyPackage_TestResources_LoadLibrary`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'

        //load custom library
        calledRuntime.loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_RubyPackage_TestResources_GetStaticField`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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

    test(`Test_RubyPackage_TestResources_SetStaticField`, () => {
        // <TestResources_SetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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

    test(`Test_RubyPackage_TestResources_GetInstanceField`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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

    test(`Test_RubyPackage_TestResources_SetInstanceField`, () => {
        // <TestResources_SetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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
        let instance = calledRuntimeType.createInstance(18, 19).execute()

        // set instance field
        instance.setInstanceField("public_value", 44).execute()

        // get instance's field
        let response = instance.getInstanceField("public_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetInstanceField>
        expect(result).toBe(44)
    })

    test(`Test_RubyPackage_TestResources_InvokeStaticMethod`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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

    test(`Test_RubyPackage_TestResources_InvokeInstanceMethod`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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

    test(`Test_RubyPackage_TestResources_1DArray_GetIndex`, () => {
        // <TestResources_1DArray_GetIndex>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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
        let response = array.getIndex(2).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_GetIndex>
        expect(result).toBe("three")
    })

    test(`Test_RubyPackage_TestResources_1DArray_GetSize`, () => {
        // <TestResources_1DArray_GetSize>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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
        let response = array.getSize().execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_GetSize>
        expect(result).toBe(5)
    })

    test(`Test_RubyPackage_TestResources_1DArray_SetIndex`, () => {
        // <TestResources_1DArray_SetIndex>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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
        array.setIndex(4, "seven").execute()

        // get index from array
        let response = array.getIndex(4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_SetIndex>
        array.setIndex(4, "five").execute()
        expect(result).toBe("seven")
    })

    test(`Test_RubyPackage_TestResources_1DArray_Iterate`, () => {
        // <TestResources_1DArray_Iterate>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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

    test(`Test_RubyPackage_TestResources_1DArray_PassArrayAsArgument`, () => {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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
        let response = instance.invokeInstanceMethod("add_array_elements_and_multiply", [12.22, 98.22, -10.44], 9.99).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_PassArrayAsArgument>
        expect(result).toEqual(999)
    })

    test(`Test_RubyPackage_TestResources_1DArray_RetrieveArray`, () => {
        // <TestResources_1DArray_RetrieveArray>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

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
        let arrayReference = instance.invokeInstanceMethod("get_1d_array").execute()

        // get value from response
        let result = arrayReference.retrieveArray()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_RetrieveArray>
        expect(result).toEqual(["one", "two", "three", "four", "five"])
    })

    test(`Test_RubyPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException`, () => {
        // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.rb'
        const className = 'TestClass::TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method which throws exception
        try {
            let response = calledRuntimeType.invokeStaticMethod("divide_by", 10, 0).execute()
        } catch (e) {
            // write exception to console
            console.log(e)
            return
        }
        // </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        expect(false).toBe(true)
    })

    test(`Test_RubyPackage_TestResources_2DArray_GetIndex`, () => {
        // <TestResources_2DArray_GetIndex>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + "/TestClass.rb"
        const className = "TestClass::TestClass"

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get_2d_array").execute()

        // three ways to get elements from array
        let response1 = array.getIndex(1, 1).execute()
        let response2 = array.getIndex(1, 0).execute()
        let response3 = array.getIndex([0, 1]).execute()

        // get value from response
        let result1 = response1.getValue()
        let result2 = response2.getValue()
        let result3 = response3.getValue()

        // write result to console
        console.log(result1)
        console.log(result2)
        console.log(result3)
        // </TestResources_2DArray_GetIndex>
        expect(result1).toBe("S11")
        expect(result2).toBe("S10")
        expect(result3).toBe("S01")
    })

    test(`Test_RubyPackage_TestResources_2DArray_GetSizeAndRank`, () => {
        // <TestResources_2DArray_GetSizeAndRank>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + "/TestClass.rb"
        const className = "TestClass::TestClass"

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get_2d_array").execute()

        // get array's size and rank
        let response1 = array.getSize().execute()
        let response2 = array.getRank().execute()

        // get value from response
        let result1 = response1.getValue()
        let result2 = response2.getValue()

        // write result to console
        console.log(result1)
        console.log(result2)
        // </TestResources_2DArray_GetSizeAndRank>
        expect(result1).toBe(4)
        expect(result2).toBe(2)
    })

    test(`Test_RubyPackage_TestResources_2DArray_SetIndex`, () => {
        // <TestResources_2DArray_SetIndex>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().ruby()

        // set up variables
        const libraryPath = resourcesDirectory + "/TestClass.rb"
        const className = "TestClass::TestClass"

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get_2d_array").execute()

        // set element of array
        array.setIndex([0, 1], "new value").execute()

        // get element from array
        let response = array.getIndex(0, 1).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_2DArray_SetIndex>
        expect(result).toBe("new value")
    })
})
