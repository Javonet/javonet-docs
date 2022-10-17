const {Javonet} = require('javonet/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const javonet_src_root = path.resolve(__dirname, '../../..')
// <TestResources_TestClassValues>
const libraryPath = javonet_src_root + '/testResources/netcore/NetcoreTestClass.dll'
const className = 'NetcoreTestClass.NetcoreTestClass'
// </TestResources_TestClassValues>

describe('NodeJS to Netcore integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)

    test(`Test_Netcore_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        let call = Javonet.inMemory().netcore().getType("System.Math").invokeStaticMethod("Abs", -50).execute()
        let result = call.getValue()
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Netcore_StandardLibrary_GetStaticField_SystemMath_PI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        let call = Javonet.inMemory().netcore().getType("System.Math").getStaticField("PI").execute()
        let result = call.getValue()
        // </StandardLibrary_GetStaticField>
        expect(result).toBe(Math.PI)
    })

    test(`Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        let instance = Javonet.inMemory().netcore().getType("System.DateTime").createInstance(2022, 9, 2).execute()
        let call = instance.invokeInstanceMethod("ToShortDateString").execute()
        let result = call.getValue()
        // </StandardLibrary_InvokeInstanceMethod>
        expect(result).toContain("2022")
    })

    test(`Test_Netcore_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022`, () => {
        // <StandardLibrary_InvokeInstanceMethod>
        let instance = Javonet.inMemory().netcore().getType("System.DateTime").createInstance(2022, 9, 2).execute()
        let call = instance.getInstanceField("Year").execute()
        let result = call.getValue()
        // </StandardLibrary_InvokeInstanceMethod>
        expect(result).toBe(2022)
    })

    test(`Test_Netcore_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().netcore().loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Netcore_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().netcore().loadLibrary(libraryPath)
        let call = Javonet.inMemory().netcore().getType(className).invokeStaticMethod("MultiplyByTwo", 25).execute()
        let result = call.getValue()
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Netcore_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        Javonet.inMemory().netcore().loadLibrary(libraryPath)
        let call = Javonet.inMemory().netcore().getType(className).getStaticField("StaticValue").execute()
        let result = call.getValue()
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Netcore_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        Javonet.inMemory().netcore().loadLibrary(libraryPath)
        Javonet.inMemory().netcore().getType(className).setStaticField("StaticValue", 75).execute()
        // </TestResources_SetStaticField>
        let call = Javonet.inMemory().netcore().getType(className).getStaticField("StaticValue").execute()
        let result = call.getValue()
        expect(result).toBe(75)
        Javonet.inMemory().netcore().getType(className).setStaticField("StaticValue", 3).execute()
    })

    test(`Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().netcore().loadLibrary(libraryPath)
        let instance = Javonet.inMemory().netcore().getType(className).createInstance(2, 3).execute()
        let call = instance.invokeInstanceMethod("MultiplyTwoNumbers", 5, 4).execute()
        let result = call.getValue()
        // </TestResources_InvokeInstanceMethod>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(20)
    })

    test(`Test_Netcore_TestResources_GetInstanceField_PublicValue_1`, () => {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().netcore().loadLibrary(libraryPath)
        let instance = Javonet.inMemory().netcore().getType(className).createInstance(1, 2).execute()
        let call = instance.getInstanceField("PublicValue").execute()
        let result = call.getValue()
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(1)
    })

    test(`Test_Netcore_StandardLibrary_System_DateTime_PassInstanceAsArgument`, () => {
        let ic1 = Javonet.inMemory().netcore().getType("System.DateTime").createInstance(2022, 5, 22, 21, 37, 38).execute()
        let ic2 = Javonet.inMemory().netcore().getType("System.Globalization.CultureInfo").createInstance("fr-FR").execute()
        let ic3 = Javonet.inMemory().netcore().getType("System.Globalization.CultureInfo").createInstance("en-US").execute()
        let ic4 = Javonet.inMemory().netcore().getType("System.Globalization.CultureInfo").createInstance("pl-PL").execute()
        let result2 = ic1.invokeInstanceMethod("ToString", "F", ic2).execute().getValue()
        let result3 = ic1.invokeInstanceMethod("ToString", "F", ic3).execute().getValue()
        let result4 = ic1.invokeInstanceMethod("ToString", "F", ic4).execute().getValue()

        expect(result2).toBe("dimanche 22 mai 2022 21:37:38")
        expect(result3).toBe("Sunday, May 22, 2022 9:37:38 PM")
        expect(result4).toBe("niedziela, 22 maja 2022 21:37:38")
    })

})
