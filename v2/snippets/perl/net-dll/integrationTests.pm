use strict;
use warnings;
use Test::More qw(no_plan);
use Math::Trig;
use File::Spec;
use File::Basename;
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';
use ActivationCredentials;

Javonet->activate(ActivationCredentials::YOUR_EMAIL, ActivationCredentials::YOUR_LICENSE_KEY);

my $this_file_path = File::Spec->rel2abs(dirname(__FILE__));
my $resources_directory = "${this_file_path}/../../../../testResources/net-dll";

sub Test_NetDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type("System.Math")->execute();

    # invoke type's static method
    my $response = $netcore_type->invoke_static_method("Abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_NetDll_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type("System.Math")->execute();

    # get type's static field
    my $response = $netcore_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_NetDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022 {
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type("System.DateTime")->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance(2022, 9, 1)->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("ToShortDateString")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeInstanceMethod>
    return $result;
}

sub Test_NetDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022 {
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type("System.DateTime")->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance(2022, 9, 1)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("Year")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetInstanceField>
    return $result;
}

sub Test_NetDll_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";

    # load NETCORE custom library
    $netcore_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_NetDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load NETCORE custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $netcore_type->invoke_static_method("MultiplyByTwo", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_NetDll_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load NETCORE custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $netcore_type->get_static_field("StaticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_NetDll_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load NETCORE custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # set type's static field
    $netcore_type->set_static_field("StaticValue", 75)->execute();

    # get type's static field
    my $response = $netcore_type->get_static_field("StaticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $netcore_type->set_static_field("StaticValue", 3)->execute();
    return $result;
}

sub Test_NetDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load NETCORE custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance()->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("MultiplyTwoNumbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_NetDll_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create NETCORE runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load NETCORE custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("PublicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

sub Test_NetDll_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Netcore runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Netcore custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("Get1DArray")->execute();

    # get array's index
    my $response = $array->get_index(2)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_1DArray_GetIndex>
    return $result;
}

sub Test_NetDll_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Netcore runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Netcore custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("Get1DArray")->execute();

    # get array's size
    my $response = $array->get_size()->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_1DArray_GetSize>
    return $result;
}

sub Test_NetDll_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Netcore runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Netcore custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("Get1DArray")->execute();

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

sub Test_NetDll_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Netcore runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Netcore custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance(18,19)->execute();

    # set instance's field
    $instance->set_instance_field("PublicValue", 44)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("PublicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetInstanceField>
    return $result;
}

sub Test_NetDll_TestResources_GenericStaticMethod {
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Netcore runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Netcore custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # invoke static method
    my $response = $netcore_type->
        invoke_generic_static_method("GenericSampleStaticMethod", "System.Int32", 7, 5)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericStaticMethod>
    return $result;
}

sub Test_NetDll_TestResources_GenericMethod {
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Netcore runtime context
    my $netcore_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Netcore custom library
    $netcore_runtime->load_library($library_path);

    # get type from the runtime
    my $netcore_type = $netcore_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $netcore_type->create_instance()->execute();

    # invoke generic method
    my $response = $instance->
        invoke_generic_method("GenericSampleMethod", "System.Int32", 7, 5)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericMethod>
    return $result;
}

my $test_result_1 = Test_NetDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
my $test_result_2 = Test_NetDll_StandardLibrary_GetStaticField_MathPI_PI();
my $test_result_3 = index(Test_NetDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(), "2022");
my $test_result_4 = Test_NetDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022();
my $test_result_5 = Test_NetDll_TestResources_LoadLibrary_LibraryPath_NoException();
my $test_result_6 = Test_NetDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $test_result_7 = Test_NetDll_TestResources_GetStaticField_StaticValue_3();
my $test_result_8 = Test_NetDll_TestResources_SetStaticField_StaticValue_75();
my $test_result_9 = Test_NetDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $test_result_10 = Test_NetDll_TestResources_GetInstanceField_PublicValue_18();
my $test_result_11 = Test_NetDll_TestResources_1DArray_GetIndex_2_StringThree();
my $test_result_12 = Test_NetDll_TestResources_1DArray_GetSize_5();
my $test_result_13 = Test_NetDll_TestResources_1DArray_SetIndex_StringSeven();
my $test_result_14 = Test_NetDll_TestResources_SetInstanceField_PublicValue_44();
my $test_result_15 = Test_NetDll_TestResources_GenericStaticMethod();
my $test_result_16 = Test_NetDll_TestResources_GenericMethod();

is($test_result_1, 50, 'Test_NetDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is($test_result_2, pi, 'Test_NetDll_StandardLibrary_GetStaticField_MathPI_PI');
isnt($test_result_3, -1, 'Test_NetDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022');
is($test_result_4, 2022, 'Test_NetDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022');
is($test_result_5, 0, 'Test_NetDll_TestResources_LoadLibrary_LibraryPath_NoException');
is($test_result_6, 50, 'Test_NetDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is($test_result_7, 3, 'Test_NetDll_TestResources_GetStaticField_StaticValue_3');
is($test_result_8, 75, 'Test_NetDll_TestResources_SetStaticField_StaticValue_3');
is($test_result_9, 20, 'Test_NetDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is($test_result_10, 18, 'Test_NetDll_TestResources_GetInstanceField_PublicValue_18');
is($test_result_11, "three", 'Test_NetDll_TestResources_1DArray_GetIndex_2_StringThree');
is($test_result_12, 5, 'Test_NetDll_TestResources_1DArray_GetSize_5');
is($test_result_13, "seven", 'Test_NetDll_TestResources_1DArray_SetIndex_StringSeven');
is($test_result_14, 44, 'Test_NetDll_TestResources_SetInstanceField_PublicValue_44');
is($test_result_15, "7 and 5", 'Test_NetDll_TestResources_GenericStaticMethod');
is($test_result_16, "7 or 5", 'Test_NetDll_TestResources_GenericMethod');

done_testing();
