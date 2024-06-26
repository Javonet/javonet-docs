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
my $resources_directory = "${this_file_path}/../../../../TestResources/jar-library";

sub Test_JarLibrary_StandardLibrary_CreateRuntimeContext {
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    ok(defined $called_runtime, 'Test_JarLibrary_StandardLibrary_CreateRuntimeContext');
}

sub Test_JarLibrary_StandardLibrary_CreateInvocationContext {
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # construct an invocation context - this invocationContext in non-materialized
    my $invocation_context = $called_runtime->get_type("java.lang.Math")->invoke_static_method("abs", -50);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();
    # </StandardLibrary_CreateInvocationContext>
    ok(defined $response, 'Test_JarLibrary_StandardLibrary_CreateInvocationContext');
}

sub Test_JarLibrary_StandardLibrary_GetValue {
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # construct an invocation context - this invocationContext in non-materialized
    my $invocation_context = $called_runtime->get_type("java.lang.Math")->invoke_static_method("abs", -50);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_GetValue>
    is($result, 50, 'Test_JarLibrary_StandardLibrary_GetValue');
}

sub Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type("java.lang.Math")->execute();

    # invoke type's static method
    my $response = $jvm_type->invoke_static_method("abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type("java.lang.Math")->execute();

    # get type's static field
    my $response = $jvm_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9 {
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type("java.util.Random")->execute();

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

sub Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name {
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type("java.sql.DriverPropertyInfo")->execute();

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

sub Test_JarLibrary_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";

    # load JVM custom library
    $called_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $jvm_type->invoke_static_method("multiplyByTwo", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_JarLibrary_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response  = $jvm_type->get_static_field("staticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_JarLibrary_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

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

sub Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

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

sub Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load JVM custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

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

sub Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load Jvm custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

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

sub Test_JarLibrary_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load Jvm custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

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

sub Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load Jvm custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance()->execute();

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

sub Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load jvm custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance(18,19)->execute();

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

sub Test_JarLibrary_TestResources_GenericStaticMethod {
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load jvm custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

    # invoke static method
    my $response = $jvm_type->
        invoke_generic_static_method("genericSampleStaticMethod", 7, 5)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericStaticMethod>
    return $result;
}

sub Test_JarLibrary_TestResources_GenericMethod {
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load jvm custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance()->execute();

    # invoke generic method
    my $response = $instance->
        invoke_generic_method("genericSampleMethod", 7, 5)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericMethod>
    return $result;
}

sub Test_JarLibrary_TestResources_GenericMethodWithTwoTypes {
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load jvm custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $jvm_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $jvm_type->create_instance()->execute();

    # invoke generic method
    my $response = $instance->
        invoke_generic_method("genericSampleMethodWithTwoTypes", 7)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericMethod>
    return $result;
}

sub Test_JarLibrary_TestResources_EnumNameAndValue {
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";

    # load jvm custom library
    $called_runtime->load_library($library_path);

    # get enum
    my $enum_type = $called_runtime->get_type("TestClass\$Fruit");

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

my $Test_result_1 = Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
my $Test_result_2 = Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI();
my $Test_result_3 = Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9();
my $Test_result_4 = Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name();
my $Test_result_5 = Test_JarLibrary_TestResources_LoadLibrary_LibraryPath_NoException();
my $Test_result_6 = Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $Test_result_7 = Test_JarLibrary_TestResources_GetStaticField_StaticValue_3();
my $Test_result_8 = Test_JarLibrary_TestResources_SetStaticField_StaticValue_75();
my $Test_result_9 = Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $Test_result_10 = Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18();
my $Test_result_11 = Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree();
my $Test_result_12 = Test_JarLibrary_TestResources_1DArray_GetSize_5();
my $Test_result_13 = Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven();
my $Test_result_14 = Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44();
my $Test_result_15 = Test_JarLibrary_TestResources_GenericStaticMethod();
my $Test_result_16 = Test_JarLibrary_TestResources_GenericMethod();
my $Test_result_17 = Test_JarLibrary_TestResources_GenericMethodWithTwoTypes();
my $Test_result_18 = Test_JarLibrary_TestResources_EnumNameAndValue();

Test_JarLibrary_StandardLibrary_CreateRuntimeContext();
Test_JarLibrary_StandardLibrary_CreateInvocationContext();
Test_JarLibrary_StandardLibrary_GetValue();

is($Test_result_1, 50, 'Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is($Test_result_2, pi, 'Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI');
is(($Test_result_3 < 10 && $Test_result_3 >= 0), 1, 'Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9');
is($Test_result_4, "sample value", 'Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name');
is($Test_result_5, 0, 'Test_JarLibrary_TestResources_LoadLibrary_LibraryPath_NoException');
is($Test_result_6, 50, 'Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is($Test_result_7, 3, 'Test_JarLibrary_TestResources_GetStaticField_StaticValue_3');
is($Test_result_8, 75, 'Test_JarLibrary_TestResources_SetStaticField_StaticValue_3');
is($Test_result_9, 20, 'Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is($Test_result_10, 18, 'Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18');
is($Test_result_11, "three", 'Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree');
is($Test_result_12, 5, 'Test_JarLibrary_TestResources_1DArray_GetSize_5');
is($Test_result_13, "seven", 'Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven');
is($Test_result_14, 44, 'Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44');
is($Test_result_15, "7 and 5", 'Test_JarLibrary_TestResources_GenericStaticMethod');
is($Test_result_16, "7 or 5", 'Test_JarLibrary_TestResources_GenericMethod');
is($Test_result_17, "genericSampleMethodWithTwoTypes invoked", 'Test_JarLibrary_TestResources_GenericMethodWithTwoTypes');
is($Test_result_18, "Mango: 3, Orange: 2", 'Test_JarLibrary_TestResources_EnumNameAndValue');

done_Testing();

