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
my $resources_directory = "${this_file_path}/../../../../testResources/jar-library";

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
    is(0, 0, 'Test_JarLibrary_TestResources_LoadLibrary_LibraryPath_NoException');
}

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
    my $called_runtime_type = $called_runtime->get_type("java.lang.Math")->execute();

    # invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    is($result, 50, 'Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
}

sub Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("java.lang.Math")->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    is($result, pi, 'Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI');
}

sub Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9 {
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("java.util.Random")->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("nextInt", 10)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeInstanceMethod>
    ok($result >= 0 && $result < 10, 'Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9');
}

sub Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name {
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create JVM runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("java.sql.DriverPropertyInfo")->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance("sample value", "sample value2")->execute();

    # get instance's field
    my $response = $instance->get_instance_field("name", 10)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetInstanceField>
    is($result, "sample value", 'Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name');
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
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("multiplyByTwo", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    is($result, 50, 'Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
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
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("staticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    is($result, 3, 'Test_JarLibrary_TestResources_GetStaticField_StaticValue_3')
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
    is($result, 75, 'Test_JarLibrary_TestResources_SetStaticField_StaticValue_75');
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
    is($result, 20, 'Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
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
    is($result, 18, 'Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18');
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
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(18, 19)->execute();

    # set instance's field
    $instance->set_instance_field("publicValue", 44)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("publicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetInstanceField>
    is($result, 44, 'Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44');
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
    is($result, "three", 'Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree');
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
    is($result, 5, 'Test_JarLibrary_TestResources_1DArray_GetSize_5');
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
    is($result, "seven", 'Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven');
}

sub Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException {
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
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
    like($exception, qr/divideByThird/, 'Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException');
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
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke static method
    my $response = $called_runtime_type->
        invoke_generic_static_method("genericSampleStaticMethod", 7, 5)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericStaticMethod>
    is($result, "7 and 5", 'Test_JarLibrary_TestResources_GenericStaticMethod');
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
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # invoke generic method
    my $response = $instance->
        invoke_generic_method("genericSampleMethod", 7, 5)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericMethod>
    is($result, "7 or 5", 'Test_JarLibrary_TestResources_GenericMethod');
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
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # invoke generic method
    my $response = $instance->
        invoke_generic_method("genericSampleMethodWithTwoTypes", 7)->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GenericMethod>
    is($result, "genericSampleMethodWithTwoTypes invoked", 'Test_JarLibrary_TestResources_GenericMethodWithTwoTypes');
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
    my $enum_type = $called_runtime->get_type('TestClass$Fruit')->execute();

    # get enum's items
    my $fruit_1 = $called_runtime->get_enum_item($enum_type, "Mango")->execute();
    my $fruit_2 = $called_runtime->get_enum_item($enum_type, "Orange")->execute();

    # get items' names and values
    my $fruit_1_name = $fruit_1->get_enum_name()->execute()->get_value();
    my $fruit_1_value = $fruit_1->get_enum_value()->execute()->get_value();
    my $fruit_2_name = $fruit_2->get_enum_name()->execute()->get_value();
    my $fruit_2_value = $fruit_2->get_enum_value()->execute()->get_value();

    # write result to console
    my $result = "$fruit_1_name: $fruit_1_value, $fruit_2_name: $fruit_2_value";
    print("$result\n");
    # </TestResources_EnumNameAndValue>
    is($result, "Mango: 3, Orange: 2", 'Test_JarLibrary_TestResources_EnumNameAndValue');
}

Test_JarLibrary_TestResources_LoadLibrary_LibraryPath_NoException();
Test_JarLibrary_StandardLibrary_CreateRuntimeContext();
Test_JarLibrary_StandardLibrary_CreateInvocationContext();
Test_JarLibrary_StandardLibrary_GetValue();
Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI();
Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9();
Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name();
Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
Test_JarLibrary_TestResources_GetStaticField_StaticValue_3();
Test_JarLibrary_TestResources_SetStaticField_StaticValue_75();
Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18();
Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44();
Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException();
Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree();
Test_JarLibrary_TestResources_1DArray_GetSize_5();
Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven();
Test_JarLibrary_TestResources_GenericStaticMethod();
Test_JarLibrary_TestResources_GenericMethod();
Test_JarLibrary_TestResources_GenericMethodWithTwoTypes();
Test_JarLibrary_TestResources_EnumNameAndValue();

done_testing();

