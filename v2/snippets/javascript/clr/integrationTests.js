const {Javonet} = require('javonet/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials");
const path = require('path')

const javonet_src_root = path.resolve(__dirname, '../../..')
// <TestResources_TestClassValues>
const libraryPath = javonet_src_root + '/testResources/clr/ClrTestClass.dll'
const className = 'ClrTestClass.ClrTestClass'
// </TestResources_TestClassValues>

describe('NodeJS to CLR integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)

    test(`Test_Clr_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50`, () => {
        if (process.platform === 'win32') {
            // <StandardLibrary_InvokeStaticMethod>
            let call = Javonet.inMemory().clr().getType("System.Math").invokeStaticMethod("Abs", -50).execute()
            let result = call.getValue()
            // </StandardLibrary_InvokeStaticMethod>
            expect(result).toBe(50)
        }
    })

    test(`Test_Clr_StandardLibrary_GetStaticField_SystemMath_PI_PI`, () => {
        if (process.platform === 'win32') {
            // <StandardLibrary_GetStaticField>
            let call = Javonet.inMemory().clr().getType("System.Math").getStaticField("PI").execute()
            let result = call.getValue()
            // </StandardLibrary_GetStaticField>
            expect(result).toBe(Math.PI)
        }
    })

    test(`Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022`, () => {
        if (process.platform === 'win32') {
            // <StandardLibrary_InvokeInstanceMethod>
            let instance = Javonet.inMemory().clr().getType("System.DateTime").createInstance(2022, 9, 2).execute()
            let call = instance.invokeInstanceMethod("ToShortDateString").execute()
            let result = call.getValue()
            // </StandardLibrary_InvokeInstanceMethod>
            expect(result).toContain("2022")
        }
    })

    test(`Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022`, () => {
        if (process.platform === 'win32') {
            // <StandardLibrary_InvokeInstanceMethod>
            let instance = Javonet.inMemory().clr().getType("System.DateTime").createInstance(2022, 9, 2).execute()
            let call = instance.getInstanceField("Year").execute()
            let result = call.getValue()
            // </StandardLibrary_InvokeInstanceMethod>
            expect(result).toBe(2022)
        }
    })

    test(`Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        if (process.platform === 'win32') {
            // <TestResources_LoadLibrary>
            Javonet.inMemory().clr().loadLibrary(libraryPath)
            // </TestResources_LoadLibrary>
        }
    })

    test(`Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        if (process.platform === 'win32') {
            // <TestResources_InvokeStaticMethod>
            Javonet.inMemory().clr().loadLibrary(libraryPath)
            let call = Javonet.inMemory().clr().getType(className).invokeStaticMethod("MultiplyByTwo", 25).execute()
            let result = call.getValue()
            // </TestResources_InvokeStaticMethod>
            expect(result).toBe(50)
        }
    })

    test(`Test_Clr_TestResources_GetStaticField_StaticValue_3`, () => {
        if (process.platform === 'win32') {
            // <TestResources_GetStaticField>
            Javonet.inMemory().clr().loadLibrary(libraryPath)
            let call = Javonet.inMemory().clr().getType(className).getStaticField("StaticValue").execute()
            let result = call.getValue()
            // </TestResources_GetStaticField>
            expect(result).toBe(3)
        }
    })

    test(`Test_Clr_TestResources_SetStaticField_StaticValue_75`, () => {
        if (process.platform === 'win32') {
            // <TestResources_SetStaticField>
            Javonet.inMemory().clr().loadLibrary(libraryPath);
            Javonet.inMemory().clr().getType(className).setStaticField("StaticValue", 75).execute()
            // </TestResources_SetStaticField>
            let call = Javonet.inMemory().clr().getType(className).getStaticField("StaticValue").execute()
            let result = call.getValue()
            expect(result).toBe(75)
            Javonet.inMemory().clr().getType(className).setStaticField("StaticValue", 3).execute()
        }
    })

    test(`Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        if (process.platform === 'win32') {
            // <TestResources_InvokeInstanceMethod>
            Javonet.inMemory().clr().loadLibrary(libraryPath);
            let instance = Javonet.inMemory().clr().getType(className).createInstance(2, 3).execute()
            let call = instance.invokeInstanceMethod("MultiplyTwoNumbers", 5, 4).execute()
            let result = call.getValue();
            // </TestResources_InvokeInstanceMethod>
            expect(instance.getValue().length).toBe(36)
            expect(result).toBe(20)
        }
    })

    test(`Test_Clr_TestResources_GetInstanceField_PublicValue_1`, () => {
        if (process.platform === 'win32') {
            // <TestResources_GetInstanceField>
            Javonet.inMemory().clr().loadLibrary(libraryPath);
            let instance = Javonet.inMemory().clr().getType(className).createInstance(1, 2).execute()
            let call = instance.getInstanceField("PublicValue").execute()
            let result = call.getValue();
            // </TestResources_GetInstanceField>
            expect(instance.getValue().length).toBe(36)
            expect(result).toBe(1)
        }
    })
})
