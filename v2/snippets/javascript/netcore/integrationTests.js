const {Javonet} = require('javonet.nodejs.sdk/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const resourcesDirectory = path.resolve(__dirname, '../../..') + '/testResources/netcore'

describe('Nodejs to Netcore integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)

    test(`Test_Netcore_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType("System.Math").execute()

        // invoke type's static method
        let response = netcoreType.invokeStaticMethod("Abs", -50).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Netcore_StandardLibrary_GetStaticField_Math_PI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType("System.Math").execute()

        // get type's static field
        let response = netcoreType.getStaticField("PI").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_GetStaticField>
        expect(result).toBe(Math.PI)
    })

    test(`Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType("System.DateTime").execute()

        // create type's instance
        let instance = netcoreType.createInstance(2022, 9, 2).execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("ToShortDateString").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeInstanceMethod>
        expect(result).toContain("2022")
    })

    test(`Test_Netcore_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType("System.DateTime").execute()

        // create type's instance
        let instance = netcoreType.createInstance(2022, 9, 2).execute()

        // get instance's field
        let response = instance.getInstanceField("Year").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeInstanceMethod>
        expect(result).toBe(2022)
    })

    test(`Test_Netcore_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/NetcoreTestClass.dll'

        // load custom library
        netcoreRuntime.loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Netcore_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/NetcoreTestClass.dll'
        let className = 'NetcoreTestClass.NetcoreTestClass'

        // load custom library
        netcoreRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType(className).execute()

        // invoke type's static method
        let response = netcoreType.invokeStaticMethod("MultiplyByTwo", 25).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Netcore_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/NetcoreTestClass.dll'
        let className = 'NetcoreTestClass.NetcoreTestClass'

        // load custom library
        netcoreRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType(className).execute()

        // get type's static field
        let response = netcoreType.getStaticField("StaticValue").execute()

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

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/NetcoreTestClass.dll'
        let className = 'NetcoreTestClass.NetcoreTestClass'

        // load custom library
        netcoreRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType(className).execute()

        // set static field's value
        netcoreType.setStaticField("StaticValue", 75).execute()

        // get static field's value
        let response = netcoreType.getStaticField("StaticValue").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetStaticField>
        netcoreType.setStaticField("StaticValue", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/NetcoreTestClass.dll'
        let className = 'NetcoreTestClass.NetcoreTestClass'

        // load custom library
        netcoreRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType(className).execute()

        // create type's instance
        let instance = netcoreType.createInstance(2, 3).execute()

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

    test(`Test_Netcore_TestResources_GetInstanceField_PublicValue_18`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        // set up variables
        let libraryPath = resourcesDirectory + '/NetcoreTestClass.dll'
        let className = 'NetcoreTestClass.NetcoreTestClass'

        // load custom library
        netcoreRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let netcoreType = netcoreRuntime.getType(className).execute()

        // create type's instance
        let instance = netcoreType.createInstance(18, 19).execute()

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

    test(`Test_Netcore_StandardLibrary_System_DateTime_PassInstanceAsArgument`, () => {
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create NETCORE runtime context
        let netcoreRuntime = Javonet.inMemory().netcore()

        let ic1 = netcoreRuntime.getType("System.DateTime").createInstance(2022, 5, 22, 21, 37, 38).execute()
        let ic2 = netcoreRuntime.getType("System.Globalization.CultureInfo").createInstance("fr-FR").execute()
        let ic3 = netcoreRuntime.getType("System.Globalization.CultureInfo").createInstance("en-US").execute()
        let ic4 = netcoreRuntime.getType("System.Globalization.CultureInfo").createInstance("pl-PL").execute()
        let result2 = ic1.invokeInstanceMethod("ToString", "F", ic2).execute().getValue()
        let result3 = ic1.invokeInstanceMethod("ToString", "F", ic3).execute().getValue()
        let result4 = ic1.invokeInstanceMethod("ToString", "F", ic4).execute().getValue()

        expect(result2).toBe("dimanche 22 mai 2022 21:37:38")
        expect(result3).toBe("Sunday, May 22, 2022 9:37:38 PM")
        expect(result4).toBe("niedziela, 22 maja 2022 21:37:38")
    })

})
