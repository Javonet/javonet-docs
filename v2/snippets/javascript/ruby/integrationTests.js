const {Javonet} = require('javonet.nodejs.sdk/src/sdk/Javonet')
const ActivationCredentials = require("./ActivationCredentials")
const path = require('path')

const resourcesDirectory = path.resolve(__dirname, '../../..') + '/testResources/ruby'



describe('Nodejs to Ruby integration tests', () => {

    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey)

    test(`Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoException`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        //load RUBY library
        rubyRuntime.loadLibrary("base64")
        // </TestResources_LoadLibrary>
    })

    test(`Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50`, () => {
        // <StandardLibrary_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        // get type from the runtime
        let rubyType = rubyRuntime.getType("Math").execute()

        // invoke type's static method
        let response = rubyType.invokeStaticMethod("sqrt", 2500).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Ruby_StandardLibrary_GetStaticField_Math_PI_PI`, () => {
        // <StandardLibrary_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        // get type from the runtime
        let rubyType = rubyRuntime.getType("Math").execute()

        // get type's field
        let response = rubyType.getStaticField("PI").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </StandardLibrary_GetStaticField>
        expect(result).toBeCloseTo(Math.PI, 6)
    })


    test(`Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoException`, () => {
        // <TestResources_LoadLibrary>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        //set up variables
        const libraryPath = resourcesDirectory + '/ruby_test_class.rb'

        //load custom library
        rubyRuntime.loadLibrary(libraryPath)
        // </TestResources_LoadLibrary>
    })

    test(`Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50`, () => {
        // <TestResources_InvokeStaticMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        //set up variables
        const libraryPath = resourcesDirectory + '/ruby_test_class.rb'
        const className = 'RubyTestClass::RubyTestClass'

        //load custom library
        rubyRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let rubyType = rubyRuntime.getType(className).execute()

        // invoke type's static method
        let response = rubyType.invokeStaticMethod("multiply_by_two", 25).execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_InvokeStaticMethod>
        expect(result).toBe(50)
    })

    test(`Test_Ruby_TestResources_GetStaticField_StaticValue_3`, () => {
        // <TestResources_GetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        //set up variables
        const libraryPath = resourcesDirectory + '/ruby_test_class.rb'
        const className = 'RubyTestClass::RubyTestClass'

        //load custom library
        rubyRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let rubyType = rubyRuntime.getType(className).execute()

        // get type's static field
        let response = rubyType.getStaticField("static_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetStaticField>
        expect(result).toBe(3)
    })

    test(`Test_Ruby_TestResources_SetStaticField_StaticValue_75`, () => {
        // <TestResources_SetStaticField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        //set up variables
        const libraryPath = resourcesDirectory + '/ruby_test_class.rb'
        const className = 'RubyTestClass::RubyTestClass'

        //load custom library
        rubyRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let rubyType = rubyRuntime.getType(className).execute()

        // set static field's value
        rubyType.setStaticField("static_value", 75).execute()

        // get type's static field
        let response = rubyType.getStaticField("static_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_SetStaticField>
        rubyType.setStaticField("static_value", 3).execute()
        expect(result).toBe(75)
    })

    test(`Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20`, () => {
        // <TestResources_InvokeInstanceMethod>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        //set up variables
        const libraryPath = resourcesDirectory + '/ruby_test_class.rb'
        const className = 'RubyTestClass::RubyTestClass'

        //load custom library
        rubyRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let rubyType = rubyRuntime.getType(className).execute()

        // create type's instance
        let instance = rubyType.createInstance(12, 13).execute()

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

    test(`Test_Ruby_TestResources_GetInstanceField_PublicValue_18`, () => {
        // <TestResources_GetInstanceField>
        // use Activate only once in your app
        Javonet.activate("your-email", "your-license-key")

        // create RUBY runtime context
        let rubyRuntime = Javonet.inMemory().ruby()

        //set up variables
        const libraryPath = resourcesDirectory + '/ruby_test_class.rb'
        const className = 'RubyTestClass::RubyTestClass'

        //load custom library
        rubyRuntime.loadLibrary(libraryPath)

        // get type from the runtime
        let rubyType = rubyRuntime.getType(className).execute()

        // create type's instance
        let instance = rubyType.createInstance(18, 19).execute()

        // get instance's field
        let response = instance.getInstanceField("public_value").execute()

        // get value from response
        let result = response.getValue()

        // write result to console
        console.log(result)
        // </TestResources_GetInstanceField>
        expect(instance.getValue().length).toBe(36)
        expect(result).toBe(18)
    })

})
