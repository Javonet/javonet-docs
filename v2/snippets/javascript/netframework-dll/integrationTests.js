const {Javonet} = require('javonet-nodejs-sdk')
const ActivationCredentials = require("../../utils/ActivationCredentials")
const path = require('path')
const {expect, describe, test} = require("@jest/globals");

const resourcesDirectory = path.resolve(__dirname, '../../../..') + '/testResources/netframework-dll'


describe('Nodejs to Netframework Dll integration tests', () => {
    if (process.platform === 'win32') {

        let result = Javonet.activate(ActivationCredentials.yourLicenseKey)
        expect(result).toBe(0)

        test(`Test_NetframeworkDll_StandardLibrary_CreateRuntimeContext`, () => {
            // <StandardLibrary_CreateRuntimeContext>
            // use activate only once in your app
            Javonet.activate('your-license-key')

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // use calledRuntime to interact with code from other technology
            // </StandardLibrary_CreateRuntimeContext>
            expect(calledRuntime).not.toBeNull()
        })

        test(`Test_NetframeworkDll_StandardLibrary_CreateInvocationContext`, () => {
            // <StandardLibrary_CreateInvocationContext>
            // use activate only once in your app
            Javonet.activate('your-license-key')

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // construct an invocation context - this invocationContext in non-materialized
            let invocationContext = calledRuntime.getType('System.Math').invokeStaticMethod('Abs', -50)

            // execute invocation context - this will materialize the invocationContext
            let response = invocationContext.execute()
            // </StandardLibrary_CreateInvocationContext>
            expect(response).not.toBeNull()
        })

        test(`Test_NetframeworkDll_StandardLibrary_GetValue`, () => {
            // <StandardLibrary_GetValue>
            // use activate only once in your app
            Javonet.activate('your-license-key')

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // construct an invocation context - this invocationContext in non-materialized
            let invocationContext = calledRuntime.getType('System.Math').invokeStaticMethod('Abs', -50)

            // execute invocation context - this will materialize the invocationContext
            let response = invocationContext.execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_GetValue>
            expect(result).toBe(50)
        })

        test(`Test_NetframeworkDll_StandardLibrary_GetStaticField`, () => {
            // <StandardLibrary_GetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_StandardLibrary_GetInstanceField`, () => {
            // <StandardLibrary_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod_Math`, () => {
            // <StandardLibrary_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod`, () => {
            // <StandardLibrary_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_LoadLibrary`, () => {
            // <TestResources_LoadLibrary>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)
            // </TestResources_LoadLibrary>
        })

        test(`Test_NetframeworkDll_TestResources_GetStaticField`, () => {
            // <TestResources_GetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_SetStaticField`, () => {
            // <TestResources_SetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_GetInstanceField`, () => {
            // <TestResources_GetInstanceField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_SetInstanceField`, () => {
            // <TestResources_SetInstanceField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'
            let className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(18, 19).execute()

            // set instance field
            instance.setInstanceField("PublicValue", 44).execute()

            // get instance's field
            let response = instance.getInstanceField("PublicValue").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_SetInstanceField>
            expect(result).toBe(44)
        })

        test(`Test_NetframeworkDll_TestResources_InvokeStaticMethod`, () => {
            // <TestResources_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_InvokeInstanceMethod`, () => {
            // <TestResources_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_1DArray_GetIndex`, () => {
            // <TestResources_1DArray_GetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_1DArray_GetSize`, () => {
            // <TestResources_1DArray_GetSize>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_1DArray_SetIndex`, () => {
            // <TestResources_1DArray_SetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_1DArray_Iterate`, () => {
            // <TestResources_1DArray_Iterate>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_1DArray_PassArrayAsArgument`, () => {
            // <TestResources_1DArray_PassArrayAsArgument>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_1DArray_RetrieveArray`, () => {
            // <TestResources_1DArray_RetrieveArray>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

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

        test(`Test_NetframeworkDll_TestResources_Cast_ToUInt`, () => {
            // <TestResources_Cast_ToUInt>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'
            let className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // get type for casting
            let targetType = calledRuntime.getType("System.UInt32")

            // invoke type's static method
            let response = calledRuntimeType.invokeStaticMethod("CastSampleMethod", calledRuntime.cast(targetType, 5.2)).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_Cast_ToUInt>
            expect(result).toBe("CastSampleMethod with System.UInt32 called")
        })

        test(`Test_NetframeworkDll_TestResources_Cast_ToFloat`, () => {
            // <TestResources_Cast_ToFloat>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'
            let className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // get type for casting
            let targetType = calledRuntime.getType("System.Single")

            // invoke type's static method
            let response = calledRuntimeType.invokeStaticMethod("CastSampleMethod", calledRuntime.cast(targetType, 5)).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_Cast_ToFloat>
            expect(result).toBe("CastSampleMethod with System.Single called")
        })

        test(`Test_NetframeworkDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException`, () => {
            // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'
            let className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // invoke type's static method which throws exception
            try {
                let response = calledRuntimeType.invokeStaticMethod("DivideBy", 10, 0).execute()
            } catch (e) {
                // write exception to console
                console.log(e)
                return
            }
            // </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
            expect(false).toBe(true)
        })

        test(`Test_NetframeworkDll_TestResources_GenericStaticMethod`, () => {
            // <TestResources_GenericStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'
            let className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // get type for generic method
            let targetType = calledRuntime.getType("System.Int32")

            // invoke type's static method
            let response = calledRuntimeType.invokeGenericStaticMethod("GenericSampleStaticMethod", targetType, 7, 5).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_GenericStaticMethod>
            expect(result).toBe("7 and 5")
        })

        test(`Test_NetframeworkDll_TestResources_GenericMethod`, () => {
            // <TestResources_GenericMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'
            let className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance().execute()

            // get type for generic method
            let targetType = calledRuntime.getType("System.Int32")

            // invoke type's method
            let response = instance.invokeGenericMethod("GenericSampleMethod", targetType, 7, 5).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_GenericMethod>
            expect(result).toBe("7 or 5")
        })

        test(`Test_NetframeworkDll_TestResources_GenericMethodWithTwoTypes`, () => {
            // <TestResources_GenericMethodWithTwoTypes>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'
            let className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance().execute()

            // get types for generic method
            let targetType1 = calledRuntime.getType("System.String")
            let targetType2 = calledRuntime.getType("System.Int32")

            // invoke type's method
            let response = instance.invokeGenericMethod("GenericSampleMethodWithTwoTypes",
                [targetType1, targetType2], "test").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_GenericMethodWithTwoTypes>
            expect(result).toBe(0)
        })

        test(`Test_NetframeworkDll_TestResources_EnumAddToList`, () => {
            // <TestResources_EnumAddToList>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'
            let className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get enum
            let enumType = calledRuntime.getType("TestClass.TestClass+Fruit");

            // create enum items
            let apple = calledRuntime.getEnumItem(enumType, "Apple");
            let mango = calledRuntime.getEnumItem(enumType, "Mango");

            // create fruits array
            let fruits = [apple, mango]

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // invoke type's static method
            let response = calledRuntimeType.invokeStaticMethod("AddFruitsToList",
                fruits).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_EnumAddToList>
            expect(result).toBe("2 fruits on the list")
        })

        test(`Test_NetframeworkDll_TestResources_EnumNameAndValue`, () => {
            // <TestResources_EnumNameAndValue>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/TestClass.dll'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get enum
            let enumType = calledRuntime.getType("TestClass.TestClass+Fruit");

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

        test(`Test_NetframeworkDll_TestResources_2DArray_GetIndex`, () => {
            // <TestResources_2DArray_GetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            const libraryPath = resourcesDirectory + '/TestClass.dll'
            const className = 'TestClass.TestClass'

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance().execute()

            // invoke instance's method
            let array = instance.invokeInstanceMethod("Get2DArray").execute()

            // two ways to get elements from array
            let response1 = array.getIndex(0, 0).execute()
            let response2 = array.getIndex([0, 1]).execute()

            // get value from response
            let result1 = response1.getValue()
            let result2 = response2.getValue()

            // write result to console
            console.log(result1)
            console.log(result2)
            // </TestResources_2DArray_GetIndex>
            expect(result1).toBe("S00")
            expect(result2).toBe("S01")
        })

        test(`Test_NetframeworkDll_TestResources_2DArray_GetSizeAndRank`, () => {
            // <TestResources_2DArray_GetSizeAndRank>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            const libraryPath = resourcesDirectory + '/TestClass.dll'
            const className = 'TestClass.TestClass'

            // load custom libraries
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance().execute()

            // invoke instance's method
            let array = instance.invokeInstanceMethod("Get2DArray").execute()

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

        test(`Test_NetframeworkDll_TestResources_2DArray_SetIndex`, () => {
            // <TestResources_2DArray_SetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            const libraryPath = resourcesDirectory + '/TestClass.dll'
            const className = 'TestClass.TestClass'

            // load custom libraries
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance().execute()

            // invoke instance's method
            let array = instance.invokeInstanceMethod("Get2DArray").execute()

            // setting elements in array
            array.setIndex([1, 1], "new value 1").execute()

            // two ways of getting elements from array
            let response1 = array.getIndex(1, 1).execute()

            // get value from response
            let result1 = response1.getValue()

            // write result to console
            console.log(result1)
            // </TestResources_2DArray_SetIndex>
            array.setIndex([1, 1], "S11").execute()
            expect(result1).toBe("new value 1")
        })

        test(`Test_NetframeworkDll_StandardLibrary_CreateInstanceOfGenericClass`, () => {
            // <StandardLibrary_CreateInstanceOfGenericClass>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // get type from the runtime
            let stringType = calledRuntime.getType("System.String").execute()

            // get type for generic class
            let listType = calledRuntime.getType("System.Collections.Generic.List`1", stringType).execute()

            // create instance of generic class
            let listInstance = listType.createInstance().execute()

            // invoke instance's method
            listInstance.invokeInstanceMethod("Add", "one").execute()
            listInstance.invokeInstanceMethod("Add", "two").execute()
            listInstance.invokeInstanceMethod("Add", "three").execute()
            listInstance.invokeInstanceMethod("AddRange", ["four", "five", "six"]).execute()

            // check number of elements in list
            let response = listInstance.getInstanceField("Count").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_CreateInstanceOfGenericClass>
            expect(result).toBe(6)
        })

        test(`Test_NetframeworkDll_StandardLibrary_HandleList`, () => {
            // <StandardLibrary_HandleList>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // get type from the runtime
            let stringType = calledRuntime.getType("System.String").execute()

            // get type for generic class
            let listType = calledRuntime.getType("System.Collections.Generic.List`1", stringType).execute()

            // create instance of generic class
            let listInstance = listType.createInstance().execute()

            // invoke instance's method
            listInstance.invokeInstanceMethod("Add", "one").execute()
            listInstance.invokeInstanceMethod("Add", "two").execute()
            listInstance.invokeInstanceMethod("Add", "three").execute()
            listInstance.invokeInstanceMethod("AddRange", ["four", "five", "six"]).execute()

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

        test(`Test_NetframeworkDll_StandardLibrary_HandleDictionary`, () => {
            // <StandardLibrary_HandleDictionary>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // get type from the runtime
            let stringType = calledRuntime.getType("System.String").execute()
            let doubleType = calledRuntime.getType("System.Double").execute()

            // get type for generic class
            let dictionaryType = calledRuntime.getType("System.Collections.Generic.Dictionary`2", stringType, doubleType).execute()

            // create instance of generic class
            let dictionary = dictionaryType.createInstance().execute()

            // invoke instance's method
            dictionary.invokeInstanceMethod("Add", "pi", Math.PI).execute()
            dictionary.invokeInstanceMethod("Add", "e", Math.E).execute()
            dictionary.invokeInstanceMethod("Add", "c", 299792458.0).execute()

            // get elements from dictionary
            let response1 = dictionary.getIndex("pi").execute()

            // get value from response
            let result1 = response1.getValue()

            // write result to console
            console.log(result1)
            // </StandardLibrary_HandleDictionary>
            expect(result1).toBe(Math.PI)
        })

        test(`Test_NetframeworkDll_TestResources_Refs_OneArg`, () => {
            // <TestResources_Refs>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.dll"
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create values for ref
            let refValue1 = calledRuntime.asRef(10).execute()
            let intType = calledRuntime.getType("System.Int32").execute()
            let refValue2 = calledRuntime.asRef(20.0, intType).execute()

            // invoke type's static method with ref values
            calledRuntimeType.invokeStaticMethod("RefSampleMethod", refValue1).execute()
            calledRuntimeType.invokeStaticMethod("RefSampleMethod", refValue2).execute()

            // get ref values
            let result1 = refValue1.getRefValue().execute().getValue()
            let result2 = refValue2.getRefValue().execute().getValue()

            // write result to console
            console.log(result1)
            console.log(result2)
            // </TestResources_Refs>
            expect(result1).toBe(20)
            expect(result2).toBe(40)
        })

        test(`Test_NetframeworkDll_TestResources_Refs_MultipleArgs`, () => {
            // <TestResources_Refs_MultipleArgs>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.dll"
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()
            let doubleType = calledRuntime.getType("System.Double").execute()

            // create values for ref
            let refToInt = calledRuntime.asRef(10).execute()
            let refToDouble = calledRuntime.asRef(5, doubleType).execute()
            let refToString = calledRuntime.asRef("Before execution").execute()

            // invoke type's static method with ref values
            calledRuntimeType.invokeStaticMethod("RefSampleMethod2", refToInt, refToDouble, refToString).execute()

            // get ref values
            let result1 = refToInt.getRefValue().execute().getValue()
            let result2 = refToDouble.getRefValue().execute().getValue()
            let result3 = refToString.getRefValue().execute().getValue()

            // write result to console
            console.log(result1)
            console.log(result2)
            console.log(result3)
            // </TestResources_Refs_MultipleArgs>
            expect(result1).toBe(20)
            expect(result2).toBe(2.5)
            expect(result3).toBe("Done")
        })

        test(`Test_NetframeworkDll_TestResources_Outs`, () => {
            // <TestResources_Outs>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().clr()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.dll"
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()
            let stringType = calledRuntime.getType("System.String").execute()

            // create values for outs
            let outValue1 = calledRuntime.asOut(stringType).execute()
            let outValue2 = calledRuntime.asOut('c', stringType).execute()
            let outValue3 = calledRuntime.asOut("Test string").execute()

            // invoke type's static method with out values
            calledRuntimeType.invokeStaticMethod("OutSampleMethod", outValue1).execute()
            calledRuntimeType.invokeStaticMethod("OutSampleMethod", outValue2).execute()
            calledRuntimeType.invokeStaticMethod("OutSampleMethod", outValue3).execute()

            // get outs' values
            let result1 = outValue1.getRefValue().execute().getValue()
            let result2 = outValue2.getRefValue().execute().getValue()
            let result3 = outValue3.getRefValue().execute().getValue()

            // write result to console
            console.log(result1)
            console.log(result2)
            console.log(result3)
            // </TestResources_Outs>
            expect(result1).toBe("String from OutSampleMethod")
            expect(result2).toBe("String from OutSampleMethod")
            expect(result3).toBe("String from OutSampleMethod")
        })
    } else {
        test.skip("Clr supported only on Windows", () => {
        })
    }
})
