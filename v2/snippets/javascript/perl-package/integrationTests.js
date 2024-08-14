const {Javonet} = require("javonet-nodejs-sdk/lib/sdk/Javonet")
const ActivationCredentials = require("../../utils/ActivationCredentials")
const path = require("path")
const {expect, describe, test} = require("@jest/globals")

const resourcesDirectory =
    path.resolve(__dirname, "../../../..") + "/testResources/perl-package"

describe("Nodejs to Perl Package integration tests", () => {
    if (process.platform === "win32") {
        Javonet.activate(ActivationCredentials.yourLicenseKey);

        test(`Test_PerlPackage_StandardLibrary_CreateRuntimeContext`, () => {
            // <StandardLibrary_CreateRuntimeContext>
            // use activate only once in your app
            Javonet.activate('your-license-key')

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // use calledRuntime to interact with code from other technology
            // </StandardLibrary_CreateRuntimeContext>
            expect(calledRuntime).not.toBeNull()
        })

        test(`Test_PerlPackage_StandardLibrary_CreateInvocationContext`, () => {
            // <StandardLibrary_CreateInvocationContext>
            // use activate only once in your app
            Javonet.activate('your-license-key')

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // construct an invocation context - this invocationContext in non-materialized
            let invocationContext = calledRuntime.getType('CORE').invokeStaticMethod("length", "sample text")

            // execute invocation context - this will materialize the invocationContext
            let response = invocationContext.execute()
            // </StandardLibrary_CreateInvocationContext>
            expect(response).not.toBeNull()
        })

        test(`Test_PerlPackage_StandardLibrary_GetValue`, () => {
            // <StandardLibrary_GetValue>
            // use activate only once in your app
            Javonet.activate('your-license-key')

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // construct an invocation context - this invocationContext in non-materialized
            let invocationContext = calledRuntime.getType('CORE').invokeStaticMethod("length", "sample text")

            // execute invocation context - this will materialize the invocationContext
            let response = invocationContext.execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_GetValue>
            expect(result).toBe(11)
        })

        test(`Test_PerlPackage_StandardLibrary_InvokeStaticMethod`, () => {
            // <StandardLibrary_InvokeStaticMethod>
            // use activate only once in your app
            Javonet.activate('your-license-key')

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // construct an invocation context - this invocationContext in non-materialized
            let invocationContext = calledRuntime.getType('CORE').invokeStaticMethod("abs", -50)

            // execute invocation context - this will materialize the invocationContext
            let response = invocationContext.execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_InvokeStaticMethod>
            expect(result).toBe(50)
        })

        test(`Test_PerlPackage_TestResources_LoadLibrary`, () => {
            // <TestResources_LoadLibrary>
            // use Activate only once in your app
            Javonet.activate("your-license-key");

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm";

            // load custom library
            calledRuntime.loadLibrary(libraryPath)
            // </TestResources_LoadLibrary>
        });

        test(`Test_PerlPackage_TestResources_GetStaticField`, () => {
            // <TestResources_GetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-license-key");

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm";
            const className = "TestClass::TestClass";

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
        });

        test(`Test_PerlPackage_TestResources_SetStaticField`, () => {
            // <TestResources_SetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + '/TestClass.pm'
            const className = 'TestClass::TestClass'

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

        test(`Test_PerlPackage_TestResources_GetInstanceField`, () => {
            // <TestResources_GetInstanceField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm";
            const className = "TestClass::TestClass";

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance().execute()

            // get instance's field
            let response = instance.getInstanceField("public_value").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_GetInstanceField>
            expect(result).toBe(1)
        });

        test(`Test_PerlPackage_TestResources_SetInstanceField`, () => {
            // <TestResources_SetInstanceField>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm";
            const className = "TestClass::TestClass";

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

        test(`Test_PerlPackage_TestResources_InvokeStaticMethod`, () => {
            // <TestResources_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm"
            const className = "TestClass::TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // invoke type's static method
            let response = calledRuntimeType
                .invokeStaticMethod("multiply_by_two", 25)
                .execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_InvokeStaticMethod>
            expect(result).toBe(50)
        });

        test(`Test_PerlPackage_TestResources_InvokeInstanceMethod`, () => {
            // <TestResources_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key");
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm"
            const className = "TestClass::TestClass"

            // load custom library
            calledRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance().execute()

            // invoke instance's method
            let response = instance
                .invokeInstanceMethod("multiply_two_numbers", 5, 4)
                .execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_InvokeInstanceMethod>
            expect(result).toBe(20)
        });

        test(`Test_PerlPackage_TestResources_1DArray_GetIndex`, () => {
            // <TestResources_1DArray_GetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm"
            const className = "TestClass::TestClass"

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
        });

        test(`Test_PerlPackage_TestResources_1DArray_GetSize`, () => {
            // <TestResources_1DArray_GetSize>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm"
            const className = "TestClass::TestClass"

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
        });

        test(`Test_PerlPackage_TestResources_1DArray_SetIndex`, () => {
            // <TestResources_1DArray_SetIndex>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm"
            const className = "TestClass::TestClass"

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
        });

        test(`Test_PerlPackage_TestResources_1DArray_Iterate`, () => {
            // <TestResources_1DArray_Iterate>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm"
            const className = "TestClass::TestClass"

            // get type from the runtime
            let calledRuntimeType = calledRuntime.getType(className).execute()

            // create type's instance
            let instance = calledRuntimeType.createInstance().execute()

            // invoke instance's method
            let array = instance.invokeInstanceMethod("get_1d_array").execute()

            // create local array and store elements in it
            let arrayValues = []

            for (let element of array) {
                arrayValues.push(element.execute().getValue())
            }

            // write result to console
            console.log(arrayValues)
            // </TestResources_1DArray_Iterate>
            expect(arrayValues).toEqual(["one", "two", "three", "four", "five"])
        });

        test(`Test_PerlPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException`, () => {
            // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-license-key")

            // create called runtime context
            let calledRuntime = Javonet.inMemory().perl()

            // set up variables
            const libraryPath = resourcesDirectory + "/TestClass.pm"
            const className = "TestClass::TestClass"

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
        });
    } else {
        test.skip("Perl not supported on MacOs", () => {
        })
    }
})
