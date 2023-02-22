const { Javonet } = require('javonet-nodejs-sdk/lib/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const resourcesDirectory = path.resolve(__dirname, '../../..') + '/testResources/perl_package'

describe('Nodejs to Perl integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)


    test(`Test_Perl_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PERL runtime context
        let perlRuntime = Javonet.inMemory().perl()

        // set up variables
        const libraryPath = resourcesDirectory
        const fileName = 'PerlTestClass.pm'

        // load custom library
        perlRuntime.loadLibrary(libraryPath, fileName)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PERL runtime context
        let perlRuntime = Javonet.inMemory().perl()

        // set up variables
        const libraryPath = resourcesDirectory
        const fileName = 'PerlTestClass.pm'
        const className = 'PerlTestClass::PerlTestClass'

        // load custom library
        perlRuntime.loadLibrary(libraryPath, fileName)

        // get type from the runtime
        let perlType = perlRuntime.getType(className).execute()

        // invoke type's static method
        let response = perlType.invokeStaticMethod("multiply_by_two", 25).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Perl_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PERL runtime context
        let perlRuntime = Javonet.inMemory().perl()

        // set up variables
        const libraryPath = resourcesDirectory
        const fileName = 'PerlTestClass.pm'
        const className = 'PerlTestClass::PerlTestClass'

        // load custom library
        perlRuntime.loadLibrary(libraryPath, fileName)

        // get type from the runtime
        let perlType = perlRuntime.getType(className).execute()

        // get type's static field
        let response = perlType.getStaticField("static_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Perl_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PERL runtime context
        let perlRuntime = Javonet.inMemory().perl()

        // set up variables
        const libraryPath = resourcesDirectory
        const fileName = 'PerlTestClass.pm'
        const className = 'PerlTestClass::PerlTestClass'

        // load custom library
        perlRuntime.loadLibrary(libraryPath, fileName)

        // get type from the runtime
        let perlType = perlRuntime.getType(className).execute()

        // set static field's value
        perlType.setStaticField("static_value", 75).execute()

        // get type's static field
        let response = perlType.getStaticField("static_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetStaticField>

        perlType.setStaticField("static_value", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PERL runtime context
        let perlRuntime = Javonet.inMemory().perl()

        // set up variables
        const libraryPath = resourcesDirectory
        const fileName = 'PerlTestClass.pm'
        const className = 'PerlTestClass::PerlTestClass'

        // load custom library
        perlRuntime.loadLibrary(libraryPath, fileName)

        // get type from the runtime
        let perlType = perlRuntime.getType(className).execute()

        // create type's instance
        let instance = perlType.createInstance().execute()

        // invoke instance's method
        let response = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeInstanceMethod>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(20)
    })

    test(`Test_Perl_TestResources_GetInstanceField_PublicValue_1`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create PERL runtime context
        let perlRuntime = Javonet.inMemory().perl()

        // set up variables
        const libraryPath = resourcesDirectory
        const fileName = 'PerlTestClass.pm'
        const className = 'PerlTestClass::PerlTestClass'

        // load custom library
        perlRuntime.loadLibrary(libraryPath, fileName)

        // get type from the runtime
        let perlType = perlRuntime.getType(className).execute()

        // create type's instance
        let instance = perlType.createInstance().execute()

        // get instance's field
        let response = instance.getInstanceField("public_value").execute()

        // get value from response
        let result = response.getValue()
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(1)
    })

})
