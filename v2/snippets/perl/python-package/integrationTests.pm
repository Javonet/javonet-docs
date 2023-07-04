use strict;
use warnings;
use Test::More qw(no_plan);
use Math::Trig;
use File::Spec;
use File::Basename;
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';
use ActivationCredentials;

my $osname = $^O;

Javonet->activate(ActivationCredentials::YOUR_EMAIL, ActivationCredentials::YOUR_LICENSE_KEY);

my $this_file_path = File::Spec->rel2abs(dirname(__FILE__));
my $resources_directory = "${this_file_path}/../../../testResources/python-package";

sub Test_Python_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # get type from the runtime
    my $python_type = $python_runtime->get_type("builtins")->execute();

    # invoke type's static method
    my $response = $python_type->invoke_static_method("abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_Python_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # get type from the runtime
    my $python_type = $python_runtime->get_type("math")->execute();

    # get type's static field
    my $response = $python_type->get_static_field("pi")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_Python_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;

    # load Python custom library
    $python_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load Python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $python_type->invoke_static_method("multiply_by_two", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_Python_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load Python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $python_type->get_static_field("static_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_Python_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = ${resources_directory};
    my $class_name = "TestClass.TestClass";

    # load Python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    # set type's static field
    $python_type->set_static_field("static_value", 75)->execute();

    # get type's static field
    my $response = $python_type->get_static_field("static_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $python_type->set_static_field("static_value", 3)->execute();
    return $result;
}

sub Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load Python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $python_type->create_instance(12, 13)->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("multiply_two_numbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_Python_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load Python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $python_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("public_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

sub Test_Python_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load Python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $python_type->create_instance(0, 1)->execute();

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

sub Test_Python_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load Python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $python_type->create_instance(0, 1)->execute();

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

sub Test_Python_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load Python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $python_type->create_instance(0, 1)->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("get_1d_array")->execute();

    # set array's index
    $array->set_index("seven", 4)->execute();

    # get array's index
    my $response = $array->get_index(4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_1DArray_SetIndex>
    $array->set_index("five", 4)->execute();
    return $result;
}

if ("$osname" ne 'darwin') {
    my $test_result_1 = Test_Python_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
    my $test_result_2 = Test_Python_StandardLibrary_GetStaticField_MathPI_PI();
    my $test_result_3 = Test_Python_TestResources_LoadLibrary_LibraryPath_NoException();
    my $test_result_4 = Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
    my $test_result_5 = Test_Python_TestResources_GetStaticField_StaticValue_3();
    my $test_result_6 = Test_Python_TestResources_SetStaticField_StaticValue_75();
    my $test_result_7 = Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
    my $test_result_8 = Test_Python_TestResources_GetInstanceField_PublicValue_18();
    my $test_result_11 = Test_Python_TestResources_1DArray_GetIndex_2_StringThree();
    my $test_result_12 = Test_Python_TestResources_1DArray_GetSize_5();
    my $test_result_13 = Test_Python_TestResources_1DArray_SetIndex_StringSeven();

    is($test_result_1, 50, 'Test_Python_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
    is(sprintf("%.5f", $test_result_2), sprintf("%.5f", pi), 'Test_Python_StandardLibrary_GetStaticField_MathPI_PI');
    is($test_result_3, 0, 'Test_Python_TestResources_LoadLibrary_LibraryPath_NoException');
    is($test_result_4, 50, 'Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
    is($test_result_5, 3, 'Test_Python_TestResources_GetStaticField_StaticValue_3');
    is($test_result_6, 75, 'Test_Python_TestResources_SetStaticField_StaticValue_3');
    is($test_result_7, 20, 'Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
    is($test_result_8, 18, 'Test_Python_TestResources_GetInstanceField_PublicValue_18');
    is($test_result_11, "three", 'Test_Python_TestResources_1DArray_GetIndex_2_StringThree');
    is($test_result_12, 5, 'Test_Python_TestResources_1DArray_GetSize_5');
    is($test_result_13, "seven", 'Test_Python_TestResources_1DArray_SetIndex_StringSeven');
}
else {
    is(0, 0, 'Python not implemented on MacOs yet');
}

done_testing();
