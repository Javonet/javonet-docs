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

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";

    # load custom library
    $called_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_JarLibrary_StandardLibrary_CreateRuntimeContext {
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    return $called_runtime
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
    return $response;
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
    return $result;
}

sub Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
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
    return $result;
}

sub Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
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
    return $result;
}

sub Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9 {
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
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
    return $result;
}

sub Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name {
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
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
    return $result;
}

sub Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load custom library
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
    return $result;
}

sub Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException {
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
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

sub Test_JarLibrary_TestResources_GenericStaticMethod {
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load custom library
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
    return $result;
}

sub Test_JarLibrary_TestResources_GenericMethod {
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load custom library
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
    return $result;
}

sub Test_JarLibrary_TestResources_GenericMethodWithTwoTypes {
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";
    my $class_name = "TestClass";

    # load custom library
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
    return $result;
}

sub Test_JarLibrary_TestResources_EnumAddToList {
    # <TestResources_EnumAddToList>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.jar";
    my $class_name   = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get enum
    my $enum_type = $called_runtime->get_type("TestClass\$Fruit")->execute();

    # create enum items
    my $apple = $called_runtime->get_enum_item($enum_type, "Apple")->execute();
    my $mango = $called_runtime->get_enum_item($enum_type, "Mango")->execute();

    # create fruits array
    my $fruits_list = [ $apple, $mango ];

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("addFruitsToList", $fruits_list)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_EnumAddToList>
    return $result;
}

sub Test_JarLibrary_TestResources_EnumNameAndValue {
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "$resources_directory/TestClass.jar";

    # load custom library
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
    return $result;
}

sub Test_JarLibrary_StandardLibrary_CreateInstanceOfGenericClass {
    # <StandardLibrary_CreateInstanceOfGenericClass>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type from the runtime
    my $list_type = $called_runtime->get_type("java.util.ArrayList")->execute();

    # create instance of generic class
    my $list_instance = $list_type->create_instance()->execute();

    # invoke instance's method "add" with various elements
    $list_instance->invoke_generic_method("add", "one")->execute();
    $list_instance->invoke_generic_method("add", "two")->execute();
    $list_instance->invoke_generic_method("add", "three")->execute();
    $list_instance->invoke_generic_method("add", "four")->execute();
    $list_instance->invoke_generic_method("add", "five")->execute();
    $list_instance->invoke_generic_method("add", "six")->execute();

    # check number of elements in list
    my $response = $list_instance->invoke_generic_method("size")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_CreateInstanceOfGenericClass>
    return $result;
}

sub Test_JarLibrary_StandardLibrary_HandleList {
    # <StandardLibrary_HandleList>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get list from built-in types and create an instance of list
    my $typeList = $called_runtime->get_type("java.util.ArrayList")->execute();
    my $list     = $typeList->create_instance()->execute();

    # invoke instance's method
    $list->invoke_generic_method("add", "one")->execute();
    $list->invoke_generic_method("add", "two")->execute();
    $list->invoke_generic_method("add", "three")->execute();
    $list->invoke_generic_method("add", "four")->execute();
    $list->invoke_generic_method("add", "five")->execute();
    $list->invoke_generic_method("add", "six")->execute();

    # get elements from list
    my $element0 = $list->get_index(0)->execute()->get_value();
    my $element1 = $list->get_index(1)->execute()->get_value();

    # get size of list
    my $size = $list->get_size()->execute()->get_value();

    # write results to console
    print("$element0, $element1, $size\n");
    # </StandardLibrary_HandleList>
    return ($element0, $element1, $size);
}

sub Test_JarLibrary_StandardLibrary_HandleDictionary {
    # <StandardLibrary_HandleDictionary>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get dictionary type and create instance
    my $typeDict   = $called_runtime->get_type("java.util.HashMap")->execute();
    my $dictionary = $typeDict->create_instance()->execute();

    # set elements in dictionary
    use Math::Trig;
    $dictionary->set_index("pi", pi)->execute();
    $dictionary->set_index("e", exp(1))->execute();
    $dictionary->set_index("c", 299792458.0)->execute();

    # get elements from dictionary
    my $response_c = $dictionary->get_index("c")->execute();
    my $response_e = $dictionary->get_index("e")->execute();

    my $c_value = $response_c->get_value();
    my $e_value = $response_e->get_value();

    print("$c_value, $e_value\n");
    # </StandardLibrary_HandleDictionary>
    return ($c_value, $e_value);
}

sub Test_JarLibrary_StandardLibrary_HandleSet {
    # <StandardLibrary_HandleSet>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # get type and create an instance of set
    my $typeSet = $called_runtime->get_type("java.util.HashSet")->execute();
    my $hashSet = $typeSet->create_instance()->execute();

    # invoke instance method "add" with different values
    $hashSet->invoke_generic_method("add", 3.14)->execute();
    $hashSet->invoke_generic_method("add", 9.81)->execute();
    $hashSet->invoke_generic_method("add", 1.44)->execute();

    # get length of set using built-in function len
    my $len_response = $hashSet->invoke_generic_method("size")->execute();
    my $result = $len_response->get_value();

    print("$result\n");
    # </StandardLibrary_HandleSet>
    return $result;
}

sub Test_JarLibrary_TestResources_PassingNullAsOnlyArg {
    # <TestResources_PassingNullAsOnlyArg>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.jar";
    my $class_name   = "TestClass";

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

sub Test_JarLibrary_TestResources_PassingNullAsSecondArg {
    # <TestResources_PassingNullAsSecondArg>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.jar";
    my $class_name   = "TestClass";

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

sub Test_JarLibrary_TestResources_ReturningNull {
    # <TestResources_ReturningNull>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.jar";
    my $class_name   = "TestClass";

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

sub Test_JarLibrary_TestResources_UseStaticMethodAsDelegate {
    # <TestResources_UseStaticMethodAsDelegate>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->jvm();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.jar";
    my $class_name   = "TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type and create instance
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $instance            = $called_runtime_type->create_instance(0, 1)->execute();

    # get static method as delegate
    my $my_func = $called_runtime_type->get_static_method_as_delegate("divideBy", $called_runtime->get_type('int'), $called_runtime->get_type('int'))->execute();

    # invoke instance's method using delegate
    my $response = $instance->invoke_instance_method("useYourFunc", $my_func, 30, 6)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_UseStaticMethodAsDelegate>
    return $result;
}

sub is_between {
    my ($value, $min, $max, $description) = @_;
    ok($value >= $min && $value <= $max, $description);
}

is(Test_JarLibrary_TestResources_LoadLibrary_LibraryPath_NoException(), 0, 'Test_JarLibrary_TestResources_LoadLibrary_LibraryPath_NoException');
ok(defined Test_JarLibrary_StandardLibrary_CreateRuntimeContext(), 'Test_JarLibrary_StandardLibrary_CreateRuntimeContext');
ok(defined Test_JarLibrary_StandardLibrary_CreateInvocationContext(), 'Test_JarLibrary_StandardLibrary_CreateInvocationContext');
is(Test_JarLibrary_StandardLibrary_GetValue(), 50, 'Test_JarLibrary_StandardLibrary_GetValue');
is(Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(), 50, 'Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is(Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI(), pi, 'Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI');
is_between(Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9(), 0, 9, 'Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9');
is(Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name(), "sample value", 'Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name');
is(Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(), 50, 'Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is(Test_JarLibrary_TestResources_GetStaticField_StaticValue_3(), 3, 'Test_JarLibrary_TestResources_GetStaticField_StaticValue_3');
is(Test_JarLibrary_TestResources_SetStaticField_StaticValue_75(), 75, 'Test_JarLibrary_TestResources_SetStaticField_StaticValue_75');
is(Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(), 20, 'Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is(Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18(), 18, 'Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18');
is(Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44(), 44, 'Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44');
is(Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree(), "three", 'Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree');
is(Test_JarLibrary_TestResources_1DArray_GetSize_5(), 5, 'Test_JarLibrary_TestResources_1DArray_GetSize_5');
is(Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven(), "seven", 'Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven');
like(Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException(), qr/divideByThird/, 'Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException');
is(Test_JarLibrary_TestResources_GenericStaticMethod(), "7 and 5", 'Test_JarLibrary_TestResources_GenericStaticMethod');
is(Test_JarLibrary_TestResources_GenericMethod(), "7 or 5", 'Test_JarLibrary_TestResources_GenericMethod');
is(Test_JarLibrary_TestResources_GenericMethodWithTwoTypes(), "genericSampleMethodWithTwoTypes invoked", 'Test_JarLibrary_TestResources_GenericMethodWithTwoTypes');
is(Test_JarLibrary_TestResources_EnumAddToList(), "2 fruits on the list", 'Test_JarLibrary_TestResources_EnumAddToList');
is(Test_JarLibrary_TestResources_EnumNameAndValue(), "Mango: 3, Orange: 2", 'Test_JarLibrary_TestResources_EnumNameAndValue');
is(Test_JarLibrary_StandardLibrary_CreateInstanceOfGenericClass(), 6, 'Test_JarLibrary_StandardLibrary_CreateInstanceOfGenericClass');
is_deeply([ Test_JarLibrary_StandardLibrary_HandleList() ],[ "one", "two", 6 ], 'Test_JarLibrary_StandardLibrary_HandleList');
is_deeply([ Test_JarLibrary_StandardLibrary_HandleDictionary() ], [ 299792458.0, exp(1) ], 'Test_JarLibrary_StandardLibrary_HandleDictionary');
is(Test_JarLibrary_StandardLibrary_HandleSet(), 3, 'Test_JarLibrary_StandardLibrary_HandleSet');
#is(Test_JarLibrary_TestResources_PassingNullAsOnlyArg(), "Method called with null", 'Test_JarLibrary_TestResources_PassingNullAsOnlyArg');
#is(Test_JarLibrary_TestResources_PassingNullAsSecondArg(), "Method2 called with null", 'Test_JarLibrary_TestResources_PassingNullAsSecondArg');
is(Test_JarLibrary_TestResources_ReturningNull(), undef, 'Test_JarLibrary_TestResources_ReturningNull');
is(Test_JarLibrary_TestResources_UseStaticMethodAsDelegate(), 5, 'Test_JarLibrary_TestResources_UseStaticMethodAsDelegate');

done_testing();

