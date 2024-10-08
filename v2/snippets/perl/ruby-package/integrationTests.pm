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
my $resources_directory = "${this_file_path}/../../../../testResources/ruby-package";

my $osname = $^O;

sub Test_RubyPackage_StandardLibrary_CreateRuntimeContext {
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    ok(defined $called_runtime, 'Test_RubyPackage_StandardLibrary_CreateRuntimeContext');
}

sub Test_RubyPackage_StandardLibrary_CreateInvocationContext {
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # construct an invocation context - this invocationContext in non-materialized
    my $invocation_context = $called_runtime->get_type("Math")->invoke_static_method("sqrt", 2500);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();
    # </StandardLibrary_CreateInvocationContext>
    ok(defined $response, 'Test_RubyPackage_StandardLibrary_CreateInvocationContext');
}

sub Test_RubyPackage_StandardLibrary_GetValue {
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # construct an invocation context - this invocationContext in non-materialized
    my $invocation_context = $called_runtime->get_type("Math")->invoke_static_method("sqrt", 2500);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_GetValue>
    is($result, 50, 'Test_RubyPackage_StandardLibrary_GetValue');
}

sub Test_RubyPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Sqrt_2500_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type("Math")->execute();

    # invoke type's static method
    my $response = $ruby_type->invoke_static_method("sqrt", 2500)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_RubyPackage_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type("Math")->execute();

    # get type's static field
    my $response = $ruby_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_RubyPackage_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";

    # load Ruby custom library
    $called_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_RubyPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $ruby_type->invoke_static_method("multiply_by_two", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_RubyPackage_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $ruby_type->get_static_field("static_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_RubyPackage_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    # set type's static field
    $ruby_type->set_static_field("static_value", 75)->execute();

    # get type's static field
    my $response = $ruby_type->get_static_field("static_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $ruby_type->set_static_field("static_value", 3)->execute();
    return $result;
}

sub Test_RubyPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $ruby_type->create_instance()->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("multiply_two_numbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_RubyPackage_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $ruby_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("public_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

sub Test_RubyPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException {
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";
    
    # load Nodejs custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # #invoke type's static method which throws exception
    my $exception = "";
    try {
        my $response = $called_runtime_type->invoke_static_method("divide_by", 10, 0)->execute();
    } catch ($ex) {
        $exception = $ex;
    };
    print("Exception: $exception\n");
    # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    like($exception, qr/divide_by_third/, 'Test_RubyPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException');
}

sub Test_RubyPackage_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $ruby_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("get_1d_array")->execute();

    # get array's index
    my $response = $array->get_index(2)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_1DArray_GetIndex>
    return $result;
}

sub Test_RubyPackage_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $ruby_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("get_1d_array")->execute();

    # get array's size
    my $response = $array->get_size()->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_1DArray_GetSize>
    return $result;
}

sub Test_RubyPackage_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $ruby_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("get_1d_array")->execute();

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

sub Test_RubyPackage_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Ruby runtime context
    my $called_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load ruby custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $ruby_type->create_instance(18, 19)->execute();

    # set instance's field
    $instance->set_instance_field("public_value", 44)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("public_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetInstanceField>
    return $result;
}

my $test_result_2 = Test_RubyPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Sqrt_2500_50();
my $test_result_3 = Test_RubyPackage_StandardLibrary_GetStaticField_MathPI_PI();
my $test_result_4 = Test_RubyPackage_TestResources_LoadLibrary_LibraryPath_NoException
my $test_result_5 = Test_RubyPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $test_result_6 = Test_RubyPackage_TestResources_GetStaticField_StaticValue_3();
my $test_result_7 = Test_RubyPackage_TestResources_SetStaticField_StaticValue_75();
my $test_result_8 = Test_RubyPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $test_result_9 = Test_RubyPackage_TestResources_GetInstanceField_PublicValue_18();
my $test_result_11 = Test_RubyPackage_TestResources_1DArray_GetIndex_2_StringThree();
my $test_result_12 = Test_RubyPackage_TestResources_1DArray_GetSize_5();
my $test_result_13 = Test_RubyPackage_TestResources_1DArray_SetIndex_StringSeven();
my $test_result_14 = Test_RubyPackage_TestResources_SetInstanceField_PublicValue_44();

if ("$osname" ne 'Linux') {
    is(Test_RubyPackage_StandardLibrary_CreateRuntimeContext(), 1, 'Test_RubyPackage_StandardLibrary_CreateRuntimeContext');
    is(Test_RubyPackage_StandardLibrary_CreateInvocationContext(), 1, 'Test_RubyPackage_StandardLibrary_CreateInvocationContext');
    is(Test_RubyPackage_StandardLibrary_GetValue(), 1, 'Test_RubyPackage_StandardLibrary_GetValue');
    is($test_result_2, 50, 'Test_RubyPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Sqrt_2500_50');
    is(sprintf("%.5f", $test_result_3), sprintf("%.5f", pi), 'Test_RubyPackage_StandardLibrary_GetStaticField_MathPI_PI');
    is($test_result_4, 0, 'Test_RubyPackage_TestResources_LoadLibrary_LibraryPath_NoException');
    is($test_result_5, 50, 'Test_RubyPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
    is($test_result_6, 3, 'Test_RubyPackage_TestResources_GetStaticField_StaticValue_3');
    is($test_result_7, 75, 'Test_RubyPackage_TestResources_SetStaticField_StaticValue_3');
    is($test_result_8, 20, 'Test_RubyPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
    is($test_result_9, 18, 'Test_RubyPackage_TestResources_GetInstanceField_PublicValue_18');
    Test_RubyPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException();
    is($test_result_11, "three", 'Test_RubyPackage_TestResources_1DArray_GetIndex_2_StringThree');
    is($test_result_12, 5, 'Test_RubyPackage_TestResources_1DArray_GetSize_5');
    is($test_result_13, "seven", 'Test_RubyPackage_TestResources_1DArray_SetIndex_StringSeven');
    is($test_result_14, 44, 'Test_RubyPackage_TestResources_SetInstanceField_PublicValue_44');
}
else {
    is(0, 0, 'Ruby fails on linux, skipping tests...');
}

done_testing();

