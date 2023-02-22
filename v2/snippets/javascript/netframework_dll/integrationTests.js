const {Javonet} = require('javonet-nodejs-sdk/lib/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const resourcesDirectory = path.resolve(__dirname, '../../..') + '/testResources/netframework_dll'


describe('Nodejs to CLR integration tests', () => {
    if (process.platform === 'win32') {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)

        test(`Test_Clr_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50`, () => {
            // <StandardLibrary_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // get type from the runtime
            let clrType = clrRuntime.getType("System.Math").execute()

            // invoke type's static method
            let response = clrType.invokeStaticMethod("Abs", -50).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_InvokeStaticMethod>
            expect(result).toBe(50)
        })

        test(`Test_Clr_StandardLibrary_GetStaticField_Math_PI_PI`, () => {
            // <StandardLibrary_GetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // get type from the runtime
            let clrType = clrRuntime.getType("System.Math").execute()

            // get type's static field
            let response = clrType.getStaticField("PI").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_GetStaticField>
            expect(result).toBe(Math.PI)
        })

        test(`Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022`, () => {
            // <StandardLibrary_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // get type from the runtime
            let clrType = clrRuntime.getType("System.DateTime").execute()

            // create type's instance
            let instance = clrType.createInstance(2022, 9, 2).execute()

            // invoke instance's method
            let response = instance.invokeInstanceMethod("ToShortDateString").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_InvokeInstanceMethod>
            expect(result).toContain("2022")
        })

        test(`Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022`, () => {
            // <StandardLibrary_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // get type from the runtime
            let clrType = clrRuntime.getType("System.DateTime").execute()

            // create type's instance
            let instance = clrType.createInstance(2022, 9, 2).execute()

            // get instance's field
            let response = instance.getInstanceField("Year").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </StandardLibrary_InvokeInstanceMethod>
            expect(result).toBe(2022)
        })

        test(`Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
            // <TestResources_LoadLibrary>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/ClrTestClass.dll'

            // load custom library
            clrRuntime.loadLibrary(libraryPath)
            // </TestResources_LoadLibrary>
        })

        test(`Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
            // <TestResources_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/ClrTestClass.dll'
            let className = 'ClrTestClass.ClrTestClass'

            // load custom library
            clrRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let clrType = clrRuntime.getType(className).execute()

            // invoke type's static method
            let response = clrType.invokeStaticMethod("MultiplyByTwo", 25).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_InvokeStaticMethod>
            expect(result).toBe(50)
        })

        test(`Test_Clr_TestResources_GetStaticField_StaticValue_3`, () => {
            // <TestResources_GetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/ClrTestClass.dll'
            let className = 'ClrTestClass.ClrTestClass'

            // load custom library
            clrRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let clrType = clrRuntime.getType(className).execute()

            // get type's static field
            let response = clrType.getStaticField("StaticValue").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_GetStaticField>
            expect(result).toBe(3)
        })

        test(`Test_Clr_TestResources_SetStaticField_StaticValue_75`, () => {
            // <TestResources_SetStaticField>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/ClrTestClass.dll'
            let className = 'ClrTestClass.ClrTestClass'

            // load custom library
            clrRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let clrType = clrRuntime.getType(className).execute()

            // set static field's value
            clrType.setStaticField("StaticValue", 75).execute()

            // get static field's value
            let response = clrType.getStaticField("StaticValue").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_SetStaticField>
            clrType.setStaticField("StaticValue", 3).execute()
            expect(result).toBe(75)
        })

        test(`Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
            // <TestResources_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/ClrTestClass.dll'
            let className = 'ClrTestClass.ClrTestClass'

            // load custom library
            clrRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let clrType = clrRuntime.getType(className).execute()

            // create type's instance
            let instance = clrType.createInstance(2, 3).execute()

            // invoke instance's method
            let response = instance.invokeInstanceMethod("MultiplyTwoNumbers", 5, 4).execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_InvokeInstanceMethod>
            expect(instance.getValue().length).toBe(36)
            expect(result).toBe(20)
        })

        test(`Test_Clr_TestResources_GetInstanceField_PublicValue_18`, () => {
            // <TestResources_GetInstanceField>
            // use Activate only once in your app
            Javonet.activate("your-email", "your-license-key")

            // create CLR runtime context
            let clrRuntime = Javonet.inMemory().clr()

            // set up variables
            let libraryPath = resourcesDirectory + '/ClrTestClass.dll'
            let className = 'ClrTestClass.ClrTestClass'

            // load custom library
            clrRuntime.loadLibrary(libraryPath)

            // get type from the runtime
            let clrType = clrRuntime.getType(className).execute()

            // create type's instance
            let instance = clrType.createInstance(18, 19).execute()

            // get instance's field
            let response = instance.getInstanceField("PublicValue").execute()

            // get value from response
            let result = response.getValue()

            // write result to console
            console.log(result)
            // </TestResources_GetInstanceField>
            expect(instance.getValue().length).toBe(36)
            expect(result).toBe(18)
        })
    } else {
        test.skip("Clr supported only on Windows", () => {
        })
    }
})
