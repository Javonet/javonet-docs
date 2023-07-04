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
my $resources_directory = "${this_file_path}/../../../testResources/jar-library";


sub Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type("java.lang.Math")->execute();

    # invoke type's static method
    my $response = $jvm_type->invoke_static_method("abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type("java.lang.Math")->execute();

    # get type's static field
    my $response = $jvm_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9 {
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type("java.util.Random")->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance()->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("nextInt", 10)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeInstanceMethod>
    return $result;
}

sub Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name {
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type("java.sql.DriverPropertyInfo")->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance("sample value", "sample value2")->execute();

    # get instance's field
    my $response = $instance->get_instance_field("name", 10)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetInstanceField>
    return $result;
}

sub Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";

    # load JVM custom library
    $jvm_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $jvm_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $jvm_type->invoke_static_method("multiplyByTwo", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_Jvm_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $jvm_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response  = $jvm_type->get_static_field("staticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_Jvm_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $jvm_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type($class_name)->execute();

    # set type's static field
    $jvm_type->set_static_field("staticValue", 75)->execute();

    # get type's static field
    my $response  = $jvm_type->get_static_field("staticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $jvm_type->set_static_field("staticValue", 3)->execute();
    return $result;
}

sub Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $jvm_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance()->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("multiplyTwoNumbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_Jvm_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create JVM runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $jvm_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("publicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

sub Test_Jvm_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Jvm runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load Jvm custom library
    $jvm_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance()->execute();

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

sub Test_Jvm_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Jvm runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load Jvm custom library
    $jvm_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance()->execute();

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

sub Test_Jvm_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Jvm runtime context
    my $jvm_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load Jvm custom library
    $jvm_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $jvm_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance()->execute();

    # invoke instance's method
    my $array = $instance->invoke_instance_method("get1DArray")->execute();

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

my $test_result_1 = Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
my $test_result_2 = Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI();
my $test_result_3 = Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9();
my $test_result_4 = Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name();
my $test_result_5 = Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException();
my $test_result_6 = Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $test_result_7 = Test_Jvm_TestResources_GetStaticField_StaticValue_3();
my $test_result_8 = Test_Jvm_TestResources_SetStaticField_StaticValue_75();
my $test_result_9 = Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $test_result_10 = Test_Jvm_TestResources_GetInstanceField_PublicValue_18();
my $test_result_11 = Test_Jvm_TestResources_1DArray_GetIndex_2_StringThree();
my $test_result_12 = Test_Jvm_TestResources_1DArray_GetSize_5();
my $test_result_13 = Test_Jvm_TestResources_1DArray_SetIndex_StringSeven();


is($test_result_1, 50, 'Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is($test_result_2, pi, 'Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI');
is(($test_result_3 < 10 && $test_result_3 >= 0), 1, 'Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9');
is($test_result_4, "sample value", 'Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name');
is($test_result_5, 0, 'Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException');
is($test_result_6, 50, 'Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is($test_result_7, 3, 'Test_Jvm_TestResources_GetStaticField_StaticValue_3');
is($test_result_8, 75, 'Test_Jvm_TestResources_SetStaticField_StaticValue_3');
is($test_result_9, 20, 'Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is($test_result_10, 18, 'Test_Jvm_TestResources_GetInstanceField_PublicValue_18');
is($test_result_11, "three", 'Test_Jvm_TestResources_1DArray_GetIndex_2_StringThree');
is($test_result_12, 5, 'Test_Jvm_TestResources_1DArray_GetSize_5');
is($test_result_13, "seven", 'Test_Jvm_TestResources_1DArray_SetIndex_StringSeven');

done_testing();

