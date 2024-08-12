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
    ok(defined $called_runtime, 'Test_NodejsPackage_StandardLibrary_CreateRuntimeContext');
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
    ok(defined $response, 'Test_NodejsPackage_StandardLibrary_CreateInvocationContext');
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
    is($result, 50, 'Test_NodejsPackage_StandardLibrary_GetValue');
}

sub Test_NodejsPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type("Math")->execute();

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

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type("Math")->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_NodejsPackage_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_NodejsPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

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

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

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

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

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

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

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

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

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

sub Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException {
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

    # #invoke type's static method which throws exception
    my $exception = "";
    try {
        my $response = $called_runtime_type->invoke_static_method("divideBy", 10, 0)->execute();
    } catch ($ex) {
        $exception = $ex;
    };
    print("Exception: $exception\n");
    # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    like($exception, qr/ZeroDivisionException/, 'Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException');
}

sub Test_NodejsPackage_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

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

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

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

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $nodejs_runtime->get_type($class_name)->execute();

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

    # create Nodejs runtime context
    my $clr_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Clr custom library
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

Test_NodejsPackage_StandardLibrary_CreateRuntimeContext();
Test_NodejsPackage_StandardLibrary_CreateInvocationContext();
Test_NodejsPackage_StandardLibrary_GetValue();

my $test_result_1 = Test_NodejsPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
my $test_result_2 = Test_NodejsPackage_StandardLibrary_GetStaticField_MathPI_PI();
my $test_result_3 = Test_NodejsPackage_TestResources_LoadLibrary_LibraryPath_NoException();
my $test_result_4 = Test_NodejsPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $test_result_5 = Test_NodejsPackage_TestResources_GetStaticField_StaticValue_3();
my $test_result_6 = Test_NodejsPackage_TestResources_SetStaticField_StaticValue_75();
my $test_result_7 = Test_NodejsPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $test_result_8 = Test_NodejsPackage_TestResources_GetInstanceField_PublicValue_18();
my $test_result_11 = Test_NodejsPackage_TestResources_1DArray_GetIndex_2_StringThree();
my $test_result_12 = Test_NodejsPackage_TestResources_1DArray_GetSize_5();
my $test_result_13 = Test_NodejsPackage_TestResources_1DArray_SetIndex_StringSeven();
my $test_result_14 = Test_NodejsPackage_TestResources_SetInstanceField_PublicValue_44();

is($test_result_1, 50, 'Test_NodejsPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is(sprintf("%.5f", $test_result_2), sprintf("%.5f", pi), 'Test_NodejsPackage_StandardLibrary_GetStaticField_MathPI_PI');
is($test_result_3, 0, 'Test_NodejsPackage_TestResources_LoadLibrary_LibraryPath_NoException');
is($test_result_4, 50, 'Test_NodejsPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is($test_result_5, 3, 'Test_NodejsPackage_TestResources_GetStaticField_StaticValue_3');
is($test_result_6, 75, 'Test_NodejsPackage_TestResources_SetStaticField_StaticValue_3');
is($test_result_7, 20, 'Test_NodejsPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is($test_result_8, 18, 'Test_NodejsPackage_TestResources_GetInstanceField_PublicValue_18');
is($test_result_14, 44, 'Test_NodejsPackage_TestResources_SetInstanceField_PublicValue_44');
Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException
is($test_result_11, "three", 'Test_NodejsPackage_TestResources_1DArray_GetIndex_2_StringThree');
is($test_result_12, 5, 'Test_NodejsPackage_TestResources_1DArray_GetSize_5');
is($test_result_13, "seven", 'Test_NodejsPackage_TestResources_1DArray_SetIndex_StringSeven');


done_testing();
