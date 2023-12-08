use strict;
use warnings;
use Test::More qw(no_plan);
use Math::Trig;
use File::Spec;
use File::Basename;
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';
use ActivationCredentials;

Javonet->activate(ActivationCredentials::YOUR_LICENSE_KEY);

my $this_file_path = File::Spec->rel2abs(dirname(__FILE__));
my $resources_directory = "${this_file_path}/../../../../testResources/netframework-dll";

my $osname = $^O;

sub Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # get type from the runtime
    my $clr_type = $called_runtime->get_type("System.Math")->execute();

    # invoke type's static method
    my $response = $clr_type->invoke_static_method("Abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_NetframeworkDll_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # get type from the runtime
    my $clr_type = $called_runtime->get_type("System.Math")->execute();

    # get type's static field
    my $response = $clr_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022 {
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # get type from the runtime
    my $clr_type = $called_runtime->get_type("System.DateTime")->execute();

    # create type's instance
    my $instance = $clr_type->create_instance(2022, 9, 1)->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("ToShortDateString")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeInstanceMethod>
    return $result;
}

sub Test_NetframeworkDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022 {
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # get type from the runtime
    my $clr_type = $called_runtime->get_type("System.DateTime")->execute();

    # create type's instance
    my $instance = $clr_type->create_instance(2022, 9, 1)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("Year")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetInstanceField>
    return $result;
}

sub Test_NetframeworkDll_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";

    # load Clr custom library
    $called_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_NetframeworkDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $clr_type->invoke_static_method("MultiplyByTwo", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_NetframeworkDll_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $clr_type->get_static_field("StaticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_NetframeworkDll_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # set type's static field
    $clr_type->set_static_field("StaticValue", 75)->execute();

    # get type's static field
    my $response = $clr_type->get_static_field("StaticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $clr_type->set_static_field("StaticValue", 3)->execute();
    return $result;
}

sub Test_NetframeworkDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $clr_type->create_instance(12,13)->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("MultiplyTwoNumbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_NetframeworkDll_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $clr_type->create_instance(18,19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("PublicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

sub Test_NetframeworkDll_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $clr_type->create_instance()->execute();

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

sub Test_NetframeworkDll_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $clr_type->create_instance()->execute();

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

sub Test_NetframeworkDll_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $clr_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("Get1DArray")->execute();

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

sub Test_NetframeworkDll_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $clr_type->create_instance(18,19)->execute();

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

sub Test_NetframeworkDll_TestResources_GenericStaticMethod {
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # get type for generic method
    my $target_type = $called_runtime->get_type("System.Int32")->execute();

    # invoke static method
    my $response = $clr_type->
        invoke_generic_static_method("GenericSampleStaticMethod", $target_type, 7, 5)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericStaticMethod>
    return $result;
}

sub Test_NetframeworkDll_TestResources_GenericMethod {
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Clr runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load Clr custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $clr_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $clr_type->create_instance()->execute();

    # get type for generic method
    my $target_type = $called_runtime->get_type("System.Int32")->execute();

    # invoke generic method
    my $response = $instance->
        invoke_generic_method("GenericSampleMethod", $target_type, 7, 5)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericMethod>
    return $result;
}

sub Test_NetframeworkDll_TestResources_EnumNameAndValue {
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->clr();

    # set up variables
    my $library_path = "$resources_directory/TestClass.dll";

    # load jvm custom library
    $called_runtime->load_library($library_path);

    # get enum
    my $enum_type = $called_runtime->get_type("TestClass.TestClass+Fruit");

    # get enum's items
    my $fruit_1 = $called_runtime->get_enum_item($enum_type, "Mango");
    my $fruit_2 = $called_runtime->get_enum_item($enum_type, "Orange");

    # get items' names and values
    my $fruit_1_name = $fruit_1->get_enum_name()->execute()->get_value();
    my $fruit_1_value = $fruit_1->get_enum_value()->execute()->get_value();
    my $fruit_2_name = $fruit_2->get_enum_name()->execute()->get_value();
    my $fruit_2_value = $fruit_2->get_enum_value()->execute()->get_value();

    # write result to console
    my $result = "$fruit_1_name: $fruit_1_value, $fruit_2_name: $fruit_2_value";
    print("$result\n");
    # </TestResources_EnumNameAndValue>
    return $result;
}

if ("$osname" eq 'MSWin32') {
    my $test_result_1 = Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
    my $test_result_2 = Test_NetframeworkDll_StandardLibrary_GetStaticField_MathPI_PI();
    my $test_result_3 = index(Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(), "2022");
    my $test_result_4 = Test_NetframeworkDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022();
    my $test_result_5 = Test_NetframeworkDll_TestResources_LoadLibrary_LibraryPath_NoException();
    my $test_result_6 = Test_NetframeworkDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
    my $test_result_7 = Test_NetframeworkDll_TestResources_GetStaticField_StaticValue_3();
    my $test_result_8 = Test_NetframeworkDll_TestResources_SetStaticField_StaticValue_75();
    my $test_result_9 = Test_NetframeworkDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
    my $test_result_10 = Test_NetframeworkDll_TestResources_GetInstanceField_PublicValue_18();
    my $test_result_11 = Test_NetframeworkDll_TestResources_1DArray_GetIndex_2_StringThree();
    my $test_result_12 = Test_NetframeworkDll_TestResources_1DArray_GetSize_5();
    my $test_result_13 = Test_NetframeworkDll_TestResources_1DArray_SetIndex_StringSeven();
    my $test_result_14 = Test_NetframeworkDll_TestResources_SetInstanceField_PublicValue_44();
    my $test_result_15 = Test_NetframeworkDll_TestResources_GenericStaticMethod();
    my $test_result_16 = Test_NetframeworkDll_TestResources_GenericMethod();
    my $test_result_17 = Test_NetframeworkDll_TestResources_EnumNameAndValue();

    is($test_result_1, 50, 'Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
    is($test_result_2, pi, 'Test_NetframeworkDll_StandardLibrary_GetStaticField_MathPI_PI');
    isnt($test_result_3, -1, 'Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022');
    is($test_result_4, 2022, 'Test_NetframeworkDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022');
    is($test_result_5, 0, 'Test_NetframeworkDll_TestResources_LoadLibrary_LibraryPath_NoException');
    is($test_result_6, 50, 'Test_NetframeworkDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
    is($test_result_7, 3, 'Test_NetframeworkDll_TestResources_GetStaticField_StaticValue_3');
    is($test_result_8, 75, 'Test_NetframeworkDll_TestResources_SetStaticField_StaticValue_3');
    is($test_result_9, 20, 'Test_NetframeworkDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
    is($test_result_10, 18, 'Test_NetframeworkDll_TestResources_GetInstanceField_PublicValue_18');
    is($test_result_11, "three", 'Test_NetframeworkDll_TestResources_1DArray_GetIndex_2_StringThree');
    is($test_result_12, 5, 'Test_NetframeworkDll_TestResources_1DArray_GetSize_5');
    is($test_result_13, "seven", 'Test_NetframeworkDll_TestResources_1DArray_SetIndex_StringSeven');
    is($test_result_14, 44, 'Test_NetframeworkDll_TestResources_SetInstanceField_PublicValue_44');
    is($test_result_15, "7 and 5", 'Test_NetframeworkDll_TestResources_GenericStaticMethod');
    is($test_result_16, "7 or 5", 'Test_NetframeworkDll_TestResources_GenericMethod');
    is($test_result_17, "Mango: 3, Orange: 2", 'Test_NetframeworkDll_TestResources_EnumNameAndValue');
}
else {
    is(0, 0, 'Clr supported on Windows only');
}

done_testing();
