const {Javonet} = require('javonet-nodejs-sdk/lib/sdk/Javonet')
const ActivationCredentials = require("../../utils/ActivationCredentials")
const path = require('path')
const {expect, describe, test} = require("@jest/globals");

const resourcesDirectory = path.resolve(__dirname, '../../../..') + '/testResources/jar-library'

describe('Nodejs to Jar Library integration tests', () => {

    let result = Javonet.activate(ActivationCredentials.yourLicenseKey)
    expect(result).toBe(0)

    test(`Test_JarLibrary_TestResources_LoadLibrary`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_JarLibrary_StandardLibrary_CreateRuntimeContext`, () => {
        // <StandardLibrary_CreateRuntimeContext>
        // use activate only once in your app
        Javonet.activate('your-license-key')

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // use calledRuntime to interact with code from other technology
        // </StandardLibrary_CreateRuntimeContext>
        expect(calledRuntime).not.toBeNull()
    })

    test(`Test_JarLibrary_StandardLibrary_CreateInvocationContext`, () => {
        // <StandardLibrary_CreateInvocationContext>
        // use activate only once in your app
        Javonet.activate('your-license-key')

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // construct an invocation context - this invocationContext in non-materialized
        let invocationContext = calledRuntime.getType('java.lang.Math').invokeStaticMethod('abs', -50)

        // execute invocation context - this will materialize the invocationContext
        let response = invocationContext.execute()
        // </StandardLibrary_CreateInvocationContext>
        expect(response).not.toBeNull()
    })

    test(`Test_JarLibrary_StandardLibrary_GetValue`, () => {
        // <StandardLibrary_GetValue>
        // use activate only once in your app
        Javonet.activate('your-license-key')

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // construct an invocation context - this invocationContext in non-materialized
        let invocationContext = calledRuntime.getType('java.lang.Math').invokeStaticMethod('abs', -50)

        // execute invocation context - this will materialize the invocationContext
        let response = invocationContext.execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_GetValue>
        expect(result).toBe(50)
    })

    test(`Test_JarLibrary_StandardLibrary_GetStaticField`, () => {
        // <StandardLibrary_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("java.lang.Math").execute()

        // get type's field
        let response = calledRuntimeType.getStaticField("PI").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_GetStaticField>
        expect(result).toBe(Math.PI)
    })

    test(`Test_JarLibrary_StandardLibrary_GetInstanceField`, () => {
        // <StandardLibrary_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("java.sql.DriverPropertyInfo").execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance("sample value", "sample value 2").execute()

        // get instance's field
        let response = instance.getInstanceField("name").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_GetInstanceField>
        expect(result).toBe("sample value")
    })

    test(`Test_JarLibrary_StandardLibrary_InvokeStaticMethod`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("java.lang.Math").execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("abs", -50).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_JarLibrary_StandardLibrary_InvokeInstanceMethod`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType("java.util.Random").execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

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

    test(`Test_JarLibrary_TestResources_GetStaticField`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // get type's static field
        let response = calledRuntimeType.getStaticField("staticValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_JarLibrary_TestResources_SetStaticField`, () => {
        // <TestResources_SetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // set static field's value
        calledRuntimeType.setStaticField("staticValue", 75).execute()

        // get static field's value
        let response = calledRuntimeType.getStaticField("staticValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetStaticField>
        calledRuntimeType.setStaticField("staticValue", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_JarLibrary_TestResources_GetInstanceField`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance(18, 19).execute()

        // get instance's field
        let response = instance.getInstanceField("publicValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetInstanceField>
        expect(result).toBe(18)
    })

    test(`Test_JarLibrary_TestResources_SetInstanceField`, () => {
        // <TestResources_SetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance(18, 19).execute()

        // set instance field
        instance.setInstanceField("publicValue", 44).execute()

        // get instance's field
        let response = instance.getInstanceField("publicValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetInstanceField>
        expect(result).toBe(44)
    })

    test(`Test_JarLibrary_TestResources_InvokeStaticMethod`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("multiplyByTwo", 25).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_JarLibrary_TestResources_InvokeInstanceMethod`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("multiplyTwoNumbers", 5, 4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeInstanceMethod>
        expect(result).toBe(20)
    })

    test(`Test_JarLibrary_TestResources_1DArray_GetIndex`, () => {
        // <TestResources_1DArray_GetIndex>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get1DArray").execute()

        // get index from array
        let response = array.getIndex(2).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_GetIndex>
        expect(result).toBe("three")
    })

    test(`Test_JarLibrary_TestResources_1DArray_GetSize`, () => {
        // <TestResources_1DArray_GetSize>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get1DArray").execute()

        // get array's size
        let response = array.getSize().execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_GetSize>
        expect(result).toBe(5)
    })

    test(`Test_JarLibrary_TestResources_1DArray_SetIndex`, () => {
        // <TestResources_1DArray_SetIndex>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get1DArray").execute()

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

    test(`Test_JarLibrary_TestResources_1DArray_Iterate`, () => {
        // <TestResources_1DArray_Iterate>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get1DArray").execute()

        // create local array and store elements in it
        let arrayValues = []

        for (let element of array) {
            arrayValues.push(element.invokeInstanceMethod("toUpperCase").execute().getValue())
        }

        // write result to console
        console.log(arrayValues)
        // </TestResources_1DArray_Iterate>
        expect(arrayValues).toEqual(["ONE", "TWO", "THREE", "FOUR", "FIVE"])
    })

    test(`Test_JarLibrary_TestResources_1DArray_PassArrayAsArgument`, () => {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("addArrayElementsAndMultiply", [12.22, 98.22, -10.44], 9.99).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_PassArrayAsArgument>
        expect(result).toEqual(999)
    })

    test(`Test_JarLibrary_TestResources_1DArray_RetrieveArray`, () => {
        // <TestResources_1DArray_RetrieveArray>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let arrayReference = instance.invokeInstanceMethod("get1DArray").execute()

        // get value from response
        let result = arrayReference.retrieveArray()

        // write result to console
        console.log(result)
        // </TestResources_1DArray_RetrieveArray>
        expect(result).toEqual(["one", "two", "three", "four", "five"])
    })

    test(`Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException`, () => {
        // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method which throws exception
        try {
            let response = calledRuntimeType.invokeStaticMethod("divideBy", 10, 0).execute()
        } catch (e) {
            // write exception to console
            console.log(e)
            return
        }
        // </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        expect(false).toBe(true)
    })

    test(`Test_JarLibrary_TestResources_GenericStaticMethod`, () => {
        // <TestResources_GenericStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeGenericStaticMethod("genericSampleStaticMethod", 7, 5).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GenericStaticMethod>
        expect(result).toBe("7 and 5")
    })

    test(`Test_JarLibrary_TestResources_GenericMethod`, () => {
        // <TestResources_GenericMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke type's method
        let response = instance.invokeGenericMethod("genericSampleMethod", 7, 5).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GenericMethod>
        expect(result).toBe("7 or 5")
    })

    test(`Test_JarLibrary_TestResources_GenericMethodWithTwoTypes`, () => {
        // <TestResources_GenericMethodWithTwoTypes>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke type's method
        let response = instance.invokeGenericMethod("genericSampleMethodWithTwoTypes", 7).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GenericMethodWithTwoTypes>
        expect(result).toBe("genericSampleMethodWithTwoTypes invoked")
    })

    test(`Test_JarLibrary_TestResources_EnumAddToList`, () => {
        // <TestResources_EnumAddToList>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get enum
        let enumType = calledRuntime.getType("TestClass$Fruit");

        // create enum items
        let apple = calledRuntime.getEnumItem(enumType, "Apple");
        let mango = calledRuntime.getEnumItem(enumType, "Mango");

        // create fruits array
        let fruits = [apple, mango]

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // invoke type's static method
        let response = calledRuntimeType.invokeStaticMethod("addFruitsToList",
            fruits).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_EnumAddToList>
        expect(result).toBe("2 fruits on the list")
    })

    test(`Test_JarLibrary_TestResources_EnumNameAndValue`, () => {
        // <TestResources_EnumNameAndValue>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get enum
        let enumType = calledRuntime.getType("TestClass$Fruit");

        // create enum items
        let fruit1 = calledRuntime.getEnumItem(enumType, "Mango");
        let fruit2 = calledRuntime.getEnumItem(enumType, "Orange");

        let fruit1Name = fruit1.getEnumName().execute().getValue()
        let fruit2Name = fruit2.getEnumName().execute().getValue()
        let fruit1Value = fruit1.getEnumValue().execute().getValue()
        let fruit2Value = fruit2.getEnumValue().execute().getValue()

        // write result to console
        console.log("%s: %d, %s: %d", fruit1Name, fruit1Value, fruit2Name, fruit2Value)
        // </TestResources_EnumNameAndValue>
        expect(fruit1Name).toBe("Mango")
        expect(fruit2Name).toBe("Orange")
        expect(fruit1Value).toBe(3)
        expect(fruit2Value).toBe(2)
    })


    test(`Test_JarLibrary_TestResources_2DArray_GetIndex`, () => {
        // <TestResources_2DArray_GetIndex>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom library
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get2DArray").execute()

        // three ways to get elements from array
        let response1 = array.getIndex(0, 0).execute()
        let response2 = array.getIndex([0, 1]).execute()
        let response3 = array.getIndex(1, 1).execute()

        // get value from response
        let result1 = response1.getValue()
        let result2 = response2.getValue()
        let result3 = response3.getValue()

        // write result to console
        console.log(result1)
        console.log(result2)
        console.log(result3)
        // </TestResources_2DArray_GetIndex>
        expect(result1).toBe("S00")
        expect(result2).toBe("S01")
        expect(result3).toBe("S11")
    })

    ''
    test(`Test_JarLibrary_TestResources_2DArray_GetSizeAndRank`, () => {
        // <TestResources_2DArray_GetSizeAndRank>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom libraries
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get2DArray").execute()

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

    test(`Test_JarLibrary_TestResources_2DArray_SetIndex`, () => {
        // <TestResources_2DArray_SetIndex>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // set up variables
        const libraryPath = resourcesDirectory + '/TestClass.jar'
        const className = 'TestClass'

        // load custom libraries
        calledRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let calledRuntimeType = calledRuntime.getType(className).execute()

        // create type's instance
        let instance = calledRuntimeType.createInstance().execute()

        // invoke instance's method
        let array = instance.invokeInstanceMethod("get2DArray").execute()

        // two ways of setting elements in array
        array.setIndex([1, 1], "new value 1").execute()
        array.setIndex([0, 1], "new value 2").execute()

        // two ways of getting elements from array
        let response1 = array.getIndex(1, 1).execute()
        let response2 = array.getIndex(0, 1).execute()

        // get value from response
        let result1 = response1.getValue()
        let result2 = response2.getValue()

        // write result to console
        console.log(result1)
        console.log(result2)
        // </TestResources_2DArray_SetIndex>
        array.setIndex([1, 1], "S11").execute()
        array.setIndex([0, 1], "S01").execute()
        expect(result1).toBe("new value 1")
        expect(result2).toBe("new value 2")
    })

    test(`Test_JarLibrary_StandardLibrary_CreateInstanceOfGenericClass`, () => {
        // <StandardLibrary_CreateInstanceOfGenericClass>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let listType = calledRuntime.getType("java.util.ArrayList").execute()

        // create instance of generic class
        let listInstance = listType.createInstance().execute()

        // invoke instance's method
        listInstance.invokeGenericMethod("add", "one").execute()
        listInstance.invokeGenericMethod("add", "two").execute()
        listInstance.invokeGenericMethod("add", "three").execute()
        listInstance.invokeGenericMethod("add", "four").execute()
        listInstance.invokeGenericMethod("add", "five").execute()
        listInstance.invokeGenericMethod("add", "six").execute()

        // check number of elements in list
        let response = listInstance.invokeGenericMethod("size").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_CreateInstanceOfGenericClass>
        expect(result).toBe(6)
    })

    test(`Test_JarLibrary_StandardLibrary_HandleList`, () => {
        // <StandardLibrary_HandleList>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let listType = calledRuntime.getType("java.util.ArrayList").execute()

        // create instance of generic class
        let listInstance = listType.createInstance().execute()

        // invoke instance's method
        listInstance.invokeGenericMethod("add", "one").execute()
        listInstance.invokeGenericMethod("add", "two").execute()
        listInstance.invokeGenericMethod("add", "three").execute()
        listInstance.invokeGenericMethod("add", "four").execute()
        listInstance.invokeGenericMethod("add", "five").execute()
        listInstance.invokeGenericMethod("add", "six").execute()

        // get elements from list
        let response1 = listInstance.getIndex(2).execute()
        let response2 = listInstance.getIndex(3).execute()

        // get value from response
        let result1 = response1.getValue()
        let result2 = response2.getValue()

        // write result to console
        console.log(result1)
        console.log(result2)
        // </StandardLibrary_HandleList>
        expect(result1).toBe("three")
        expect(result2).toBe("four")
    })

    test(`Test_JarLibrary_StandardLibrary_HandleDictionary`, () => {
        // <StandardLibrary_HandleDictionary>
        // use Activate only once in your app
        Javonet.activate("your-license-key")

        // create called runtime context
        let calledRuntime = Javonet.inMemory().jvm()

        // get type from the runtime
        let dictionaryType = calledRuntime.getType("java.util.HashMap").execute()

        // create instance of generic class
        let dictionary = dictionaryType.createInstance().execute()

        // invoke instance's method
        dictionary.invokeGenericMethod("put", "pi", Math.PI).execute()
        dictionary.invokeGenericMethod("put", "e", Math.E).execute()
        dictionary.invokeGenericMethod("put", "c", 299792458.0).execute()

        // get elements from dictionary
        let response1 = dictionary.getIndex("pi").execute()
        let response2 = dictionary.getIndex("c").execute()

        // get value from response
        let result1 = response1.getValue()
        let result2 = response2.getValue()

        // write result to console
        console.log(result1)
        console.log(result2)
        // </StandardLibrary_HandleDictionary>
        expect(result1).toBe(Math.PI)
        expect(result2).toBe(299792458.0)
    })

})
