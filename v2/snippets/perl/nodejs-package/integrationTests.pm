use strict;
use warnings;
use Test::More qw(no_plan);
use Math::Trig;
use File::Spec;
use File::Basename;
use Nice::Try;
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';
use ActivationCredentials;

Javonet->activate(ActivationCredentials::YOUR_LICENSE_KEY);

my $this_file_path = File::Spec->rel2abs(dirname(__FILE__));
my $resources_directory = "${this_file_path}/../../../../testResources/nodejs-package";

sub Test_NodejsPackage_StandardLibrary_CreateRuntimeContext {
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    return $called_runtime;
}

sub Test_NodejsPackage_StandardLibrary_CreateInvocationContext {
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # construct an invocation context - this invocationContext in non-materialized
    my $invocation_context = $called_runtime->get_type("Math")->invoke_static_method("abs", -50);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();
    # </StandardLibrary_CreateInvocationContext>
    return $response;
}

sub Test_NodejsPackage_StandardLibrary_GetValue {
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # construct an invocation context - this invocationContext in non-materialized
    my $invocation_context = $called_runtime->get_type("Math")->invoke_static_method("abs", -50);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_GetValue>
    return $result;
}

sub Test_NodejsPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("Math")->execute();

    # invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_NodejsPackage_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("Math")->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_NodejsPackage_StandardLibrary_InvokeInstanceMethod {
    # <StandardLibrary_InvokeInstanceMethod>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("Date")->execute();

    # create type's instance with year, month, and day
    my $instance = $called_runtime_type->create_instance(2024, 2, 3)->execute();

    # invoke instance method "getFullYear"
    my $response = $instance->invoke_instance_method("getFullYear")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_InvokeInstanceMethod>
    return $result;
}

sub Test_NodejsPackage_StandardLibrary_GetInstanceField {
    # <StandardLibrary_GetInstanceField>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("Set")->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # get instance's field "size"
    my $response = $instance->get_instance_field("size")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_GetInstanceField>
    return $result;
}

sub Test_NodejsPackage_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";

    # load custom library
    $called_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_NodejsPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("multiplyByTwo", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_NodejsPackage_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("staticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_NodejsPackage_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # set type's static field
    $called_runtime_type->set_static_field("staticValue", 75)->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("staticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $called_runtime_type->set_static_field("staticValue", 3)->execute();
    return $result;
}

sub Test_NodejsPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("multiplyTwoNumbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_NodejsPackage_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("publicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

sub Test_NodejsPackage_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("get1DArray")->execute();

    # get array's index
    my $response = $array->get_index(2)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_1DArray_GetIndex>
    return $result;
}

sub Test_NodejsPackage_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("get1DArray")->execute();

    # get array's size
    my $response = $array->get_size()->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_1DArray_GetSize>
    return $result;
}

sub Test_NodejsPackage_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("get1DArray")->execute();

    # set array's index
    $array->set_index(4, "seven")->execute();

    # get array's index
    my $response = $array->get_index(4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_1DArray_SetIndex>
    $array->set_index(4, "five")->execute();
    return $result;
}

sub Test_NodejsPackage_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $clr_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $clr_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $clr_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $clr_type->create_instance(18,19)->execute();

    # set instance's field
    $instance->set_instance_field("publicValue", 44)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("publicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetInstanceField>
    return $result;
}

sub Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException {
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # #invoke type's static method which throws exception
    my $exception = "";
    try {
        my $response = $called_runtime_type->invoke_static_method("divideBy", 10, 0)->execute();
    } catch ($ex) {
        $exception = $ex;
    };
    print("Exception: $exception\n");
    # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    return $exception;
}

sub Test_NodejsPackage_TestResources_PassingNullAsOnlyArg {
    # <TestResources_PassingNullAsOnlyArg>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method with undef as only argument
    my $response = $called_runtime_type->invoke_static_method("passNull", undef)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_PassingNullAsOnlyArg>
    return $result;
}

sub Test_NodejsPackage_TestResources_PassingNullAsSecondArg {
    # <TestResources_PassingNullAsSecondArg>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method with first argument 5 and undef as second argument
    my $response = $called_runtime_type->invoke_static_method("passNull2", 5, undef)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_PassingNullAsSecondArg>
    return $result;
}

sub Test_NodejsPackage_TestResources_ReturningNull {
    # <TestResources_ReturningNull>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method that returns null
    my $response = $called_runtime_type->invoke_static_method("returnNull")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print(defined $result ? "$result\n" : "undef\n");
    # </TestResources_ReturningNull>
    return $result;
}

sub Test_NodejsPackage_TestResources_UseStaticMethodAsDelegate {
    # <TestResources_UseStaticMethodAsDelegate>
    Javonet->activate("your-license-key");

    # create called runtime context for Nodejs
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name   = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type and create instance
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $instance            = $called_runtime_type->create_instance()->execute();

    # get static method as delegate
    my $my_func = $called_runtime_type->get_static_method_as_delegate("divideBy")->execute();

    # invoke instance's method using delegate
    my $response = $instance->invoke_instance_method("useYourFunc", $my_func, 30, 6)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_UseStaticMethodAsDelegate>
    return $result;
}

sub Test_NodejsPackage_TestResources_UseInstanceMethodAsDelegate {
    # <TestResources_UseInstanceMethodAsDelegate>
    Javonet->activate("your-license-key");

    # create called runtime context for Nodejs
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name   = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime and create instance
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $instance            = $called_runtime_type->create_instance()->execute();

    # get instance method as delegate
    my $my_func = $instance->get_instance_method_as_delegate("multiplyTwoNumbers")->execute();

    # invoke instance's method using delegate
    my $response = $instance->invoke_instance_method("useYourFunc", $my_func, 5, 6)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_UseInstanceMethodAsDelegate>
    return $result;
}

sub Test_NodejsPackage_TestResources_InvokeGlobalFunction {
    # <TestResources_InvokeGlobalFunction>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";

    # load custom library
    $called_runtime->load_library($library_path);

    # invoke global function
    my $response = $called_runtime->invoke_global_function("welcome", "John")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_InvokeGlobalFunction>
    return $result;
}

ok(defined Test_NodejsPackage_StandardLibrary_CreateRuntimeContext(), 'Test_NodejsPackage_StandardLibrary_CreateRuntimeContext');
ok(defined Test_NodejsPackage_StandardLibrary_CreateInvocationContext(), 'Test_NodejsPackage_StandardLibrary_CreateInvocationContext');
is(Test_NodejsPackage_StandardLibrary_GetValue(), 50, 'Test_NodejsPackage_StandardLibrary_GetValue');
is(Test_NodejsPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(), 50, 'Test_NodejsPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Sqrt_2500_50');
is(Test_NodejsPackage_StandardLibrary_GetStaticField_MathPI_PI(), pi, 'Test_NodejsPackage_StandardLibrary_GetStaticField_MathPI_PI');
is(Test_NodejsPackage_StandardLibrary_InvokeInstanceMethod(), 2024, 'Test_NodejsPackage_StandardLibrary_InvokeInstanceMethod');
is(Test_NodejsPackage_StandardLibrary_GetInstanceField(), 0, 'Test_NodejsPackage_StandardLibrary_GetInstanceField');
is(Test_NodejsPackage_TestResources_LoadLibrary_LibraryPath_NoException(), 0, 'Test_NodejsPackage_TestResources_LoadLibrary_LibraryPath_NoException');
is(Test_NodejsPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(), 50, 'Test_NodejsPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is(Test_NodejsPackage_TestResources_GetStaticField_StaticValue_3(), 3, 'Test_NodejsPackage_TestResources_GetStaticField_StaticValue_3');
is(Test_NodejsPackage_TestResources_SetStaticField_StaticValue_75(), 75, 'Test_NodejsPackage_TestResources_SetStaticField_StaticValue_3');
is(Test_NodejsPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(), 20, 'Test_NodejsPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is(Test_NodejsPackage_TestResources_GetInstanceField_PublicValue_18(), 18, 'Test_NodejsPackage_TestResources_GetInstanceField_PublicValue_18');
is(Test_NodejsPackage_TestResources_SetInstanceField_PublicValue_44(), 44, 'Test_NodejsPackage_TestResources_SetInstanceField_PublicValue_44');
is(Test_NodejsPackage_TestResources_1DArray_GetIndex_2_StringThree(), "three", 'Test_NodejsPackage_TestResources_1DArray_GetIndex_2_StringThree');
is(Test_NodejsPackage_TestResources_1DArray_GetSize_5(), 5, 'Test_NodejsPackage_TestResources_1DArray_GetSize_5');
is(Test_NodejsPackage_TestResources_1DArray_SetIndex_StringSeven(), "seven", 'Test_NodejsPackage_TestResources_1DArray_SetIndex_StringSeven');
like(Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException(), qr/ZeroDivisionException/, 'Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException');
#is(Test_NodejsPackage_TestResources_PassingNullAsOnlyArg(), "Method called with null", 'Test_NodejsPackage_TestResources_PassingNullAsOnlyArg');
#is(Test_NodejsPackage_TestResources_PassingNullAsSecondArg(), "Method2 called with null", 'Test_NodejsPackage_TestResources_PassingNullAsSecondArg');
is(Test_NodejsPackage_TestResources_ReturningNull(), undef, 'Test_NodejsPackage_TestResources_ReturningNull');
is(Test_NodejsPackage_TestResources_UseStaticMethodAsDelegate(), 5, 'Test_NodejsPackage_TestResources_UseStaticMethodAsDelegate');
is(Test_NodejsPackage_TestResources_UseInstanceMethodAsDelegate(), 30, 'Test_NodejsPackage_TestResources_UseInstanceMethodAsDelegate');
is(Test_NodejsPackage_TestResources_InvokeGlobalFunction(), "Hello John!", 'Test_NodejsPackage_TestResources_InvokeGlobalFunction');


done_testing();
