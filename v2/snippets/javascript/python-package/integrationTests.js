const {Javonet} = require('javonet-nodejs-sdk/lib/sdk/Javonet')
const ActivationCredentials = require("../../utils/ActivationCredentials")
const path = require('path')
const {expect, describe, test} = require("@jest/globals");

const resourcesDirectory = path.resolve(__dirname, '../../../..') + '/testResources/python-package'

describe('Nodejs to Python Package integration tests', () => {
    if (process.platform !== 'darwin') {

        test(`Test_PythonPackage_StandardLibrary_GetStaticField`, () => {
            // <StandardLibrary_GetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType('math').execute()

            // get type's field
            let response = calledRuntimeType.getStaticField("pi").execute()

            // get value from response
            let result = response.getValue()
            // </StandardLibrary_GetStaticField>
            expect(result).toBeCloseTo(Math.PI, 6)
        })

        test(`Test_PythonPackage_StandardLibrary_InvokeStaticMethod`, () => {
            // <StandardLibrary_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType('builtins').execute()

            // invoke type's static method
            let response = calledRuntimeType.invokeStaticMethod("abs", -50).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_InvokeStaticMethod>
            expect(result).toBe(50)
        })

        let result = Javonet.activate(ActivationCredentials.yourLicenseKey)
        expect(result).toBe(0)

        test(`Test_PythonPackage_TestResources_LoadLibrary`, () => {
            // <TestResources_LoadLibrary>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory

            // load custom library
            calledRuntime.loadLibrary(libraryPath)
            // </TestResources_LoadLibrary>
        })

        test(`Test_PythonPackage_TestResources_GetStaticField`, () => {
            // <TestResources_GetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
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

        test(`Test_PythonPackage_TestResources_SetStaticField`, () => {
            // <TestResources_SetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
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

        test(`Test_PythonPackage_TestResources_GetInstanceField`, () => {
            // <TestResources_GetInstanceField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
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
            // </TestResources_GetInstanceField>36)
            expect(result).toBe(18)
        })

        test(`Test_PythonPackage_TestResources_SetInstanceField`, () => {
            // <TestResources_SetInstanceField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

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

        test(`Test_PythonPackage_TestResources_InvokeStaticMethod`, () => {
            // <TestResources_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
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

        test(`Test_PythonPackage_TestResources_InvokeInstanceMethod`, () => {
            // <TestResources_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(12, 13).execute()

            // invoke instance's method
            let response = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_InvokeInstanceMethod>
            expect(result).toBe(20)
        })

        test(`Test_PythonPackage_TestResources_1DArray_GetIndex`, () => {
            // <TestResources_1DArray_GetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

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

        test(`Test_PythonPackage_TestResources_1DArray_GetSize`, () => {
            // <TestResources_1DArray_GetSize>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

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

        test(`Test_PythonPackage_TestResources_1DArray_SetIndex`, () => {
            // <TestResources_1DArray_SetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

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

        test(`Test_PythonPackage_TestResources_1DArray_Iterate`, () => {
            // <TestResources_1DArray_Iterate>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"
            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

            // invoke instance's method
            let array = instance.invokeInstanceMethod("get_1d_array").execute()

            // create local array and store elements in it
            let arrayValues = []

            for (let element of array) {
                arrayValues.push(element.invokeInstanceMethod("upper").execute().getValue())
            }

            // write result to console
            console.log(arrayValues)
            // </TestResources_1DArray_Iterate>
            expect(arrayValues).toEqual(["ONE", "TWO", "THREE", "FOUR", "FIVE"])
        })

        test(`Test_PythonPackage_TestResources_1DArray_PassArrayAsArgument`, () => {
            // <TestResources_1DArray_PassArrayAsArgument>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

            // invoke instance's method
            let response = instance.invokeInstanceMethod("add_array_elements_and_multiply", [12.22, 98.22, -10.44], 9.99).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_1DArray_PassArrayAsArgument>
            expect(result).toEqual(999)
        })

        test(`Test_PythonPackage_TestResources_1DArray_RetrieveArray`, () => {
            // <TestResources_1DArray_RetrieveArray>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

            // invoke instance's method
            let arrayReference = instance.invokeInstanceMethod("get_1d_array").execute()

            // get value from response
            let result = arrayReference.retrieveArray()

            // write result to console
            console.log(result)
            // </TestResources_1DArray_RetrieveArray>
            expect(result).toEqual(["one", "two", "three", "four", "five"])
        })

        test(`Test_PythonPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException`, () => {
            // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

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

        test(`Test_PythonPackage_TestResources_EnumAddToList`, () => {
            // <TestResources_EnumAddToList>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create enum items
            let apple = calledRuntime.getEnumItem(calledRuntimeType, "Fruit", "Apple");
            let mango = calledRuntime.getEnumItem(calledRuntimeType, "Fruit", "Mango");

            // create fruits array
            let fruits = [apple, mango]

            // invoke type's static method
            let response = calledRuntimeType.invokeStaticMethod("add_fruits_to_list",
                fruits).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_EnumAddToList>
            expect(result).toBe("2 fruits on the list")
        })

        test(`Test_PythonPackage_TestResources_EnumNameAndValue`, () => {
            // <TestResources_EnumNameAndValue>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create enum items
            let fruit1 = calledRuntime.getEnumItem(calledRuntimeType, "Fruit", "Mango");
            let fruit2 = calledRuntime.getEnumItem(calledRuntimeType, "Fruit", "Orange");

            let fruit1Name = fruit1.getEnumName().execute().getValue()
            let fruit2Name = fruit2.getEnumName().execute().getValue()
            let fruit1Value = fruit1.getEnumValue().execute().getValue()
            let fruit2Value = fruit2.getEnumValue().execute().getValue()

            // write result to console
            console.log("%s: %d, %s: %d", fruit1Name, fruit1Value, fruit2Name, fruit2Value)
            // </TestResources_EnumNameAndValue>
            expect(fruit1Name).toBe("Mango")
            expect(fruit2Name).toBe("Orange")
            expect(fruit1Value).toBe(4)
            expect(fruit2Value).toBe(3)
        })

        test(`Test_PythonPackage_TestResources_2DArray_GetIndex`, () => {
            // <TestResources_2DArray_GetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

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

        test(`Test_PythonPackage_TestResources_2DArray_GetSizeAndRank`, () => {
            // <TestResources_2DArray_GetSizeAndRank>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

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

        test(`Test_PythonPackage_TestResources_2DArray_SetIndex`, () => {
            // <TestResources_2DArray_SetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // set up variables
            const libraryPath = resourcesDirectory
            const className = "TestClass.TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance(0, 1).execute()

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

        test(`Test_PythonPackage_StandardLibrary_HandleList`, () => {
            // <StandardLibrary_HandleList>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // get list from built-in types
            let typeList = calledRuntime.getType("builtins.list").execute()

            // create instance of list
            let list = typeList.createInstance().execute()

            // invoke instance method
            list.invokeInstanceMethod("extend", ["one", "two", "three", "four", "five", "six"]).execute()

            // get elements from list
            let element0 = list.getIndex(0).execute()
            let element1 = list.getIndex(1).execute()

            let result0 = element0.getValue()
            let result1 = element1.getValue()

            // get size of list
            let size = list.getSize().execute().getValue()

            // write results to console
            console.log(result0)
            console.log(result1)
            console.log(size)
            // </StandardLibrary_HandleList>
            expect(result0).toBe("one")
            expect(result1).toBe("two")
            expect(size).toBe(6)
        })

        test(`Test_PythonPackage_StandardLibrary_HandleDictionary`, () => {
            // <StandardLibrary_HandleDictionary>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().python()

            // get generic class
            let typeDictionary = calledRuntime.getType("builtins.dict").execute()

            // create instance of generic class
            let dictionary = typeDictionary.createInstance().execute()

            // set elements in dictionary
            dictionary.setIndex("pi", Math.PI).execute()
            dictionary.setIndex("e", Math.E).execute()
            dictionary.setIndex("c", 299792458.0).execute()

            // get elements from dictionary
            let response1 = dictionary.getIndex("c").execute()
            let response2 = dictionary.getIndex("e").execute()

            let c_value = response1.getValue()
            let e_value = response2.getValue()

            // write results to console
            console.log(c_value)
            console.log(e_value)
            // </StandardLibrary_HandleDictionary>
            expect(c_value).toBe(299792458.0)
            expect(e_value).toBe(Math.E)
        })

    } else {
        test.skip("Python not supported on MacOs", () => {
        })
    }
})
