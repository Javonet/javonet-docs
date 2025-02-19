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
my $resources_directory = "${this_file_path}/../../../../testResources/net-dll";

sub Test_NetDll_StandardLibrary_CreateRuntimeContext {
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    return $called_runtime
}

sub Test_NetDll_StandardLibrary_CreateInvocationContext {
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # construct an invocation context - this invocationContext in non-materialized 
    my $invocation_context = $called_runtime->get_type("System.Math")->invoke_static_method("Abs", -50);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();
    # </StandardLibrary_CreateInvocationContext>
    return $response;
}

sub Test_NetDll_StandardLibrary_GetValue {
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # construct an invocation context - this invocationContext in non-materialized 
    my $invocation_context = $called_runtime->get_type("System.Math")->invoke_static_method("Abs", -50);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_GetValue>
    return $result;
}

sub Test_NetDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("System.Math")->execute();

    # invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("Abs", -50)->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("System.Math")->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("PI")->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("System.DateTime")->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(2022, 9, 1)->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("System.DateTime")->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(2022, 9, 1)->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";

    # load custom library
    $called_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_NetDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("MultiplyByTwo", 25)->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("StaticValue")->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # set type's static field
    $called_runtime_type->set_static_field("StaticValue", 75)->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("StaticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $called_runtime_type->set_static_field("StaticValue", 3)->execute();
    return $result;
}

sub Test_NetDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("PublicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

sub Test_NetDll_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(18, 19)->execute();

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

sub Test_NetDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException {
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # #invoke type's static method which throws exception
    my $exception = "";
    try {
        my $response = $called_runtime_type->invoke_static_method("DivideBy", 10, 0)->execute();
    }
    catch ($ex) {
        $exception = $ex;
    };
    print("Exception: $exception\n");
    # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    return $exception;
}

sub Test_NetDll_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

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

sub Test_NetDll_TestResources_Cast_ToUInt32 {
    # <TestResources_Cast_ToUInt>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # get type for casting
    my $target_type = $called_runtime->get_type("System.UInt32")->execute();

    # invoke static method
    my $response = $called_runtime_type->
        invoke_generic_static_method("CastSampleMethod",
            $called_runtime->cast($target_type, 5.2))->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_Cast_ToUInt>
    return $result;
}

sub Test_NetDll_TestResources_Cast_ToFloat {
    # <TestResources_Cast_ToFloat>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # get type for casting
    my $target_type = $called_runtime->get_type("System.Float")->execute();

    # invoke static method
    my $response = $called_runtime_type->
        invoke_generic_static_method("CastSampleMethod",
            $called_runtime->cast($target_type, 5))->
        execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_Cast_ToFloat>
    return $result;
}

sub Test_NetDll_TestResources_GenericStaticMethod {
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # get type for generic method
    my $target_type = $called_runtime->get_type("System.Int32")->execute();

    # invoke static method
    my $response = $called_runtime_type->
        invoke_generic_static_method("GenericSampleStaticMethod", $target_type, 7, 5)->
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
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

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

sub Test_NetDll_TestResources_GenericMethodWithTwoTypes {
    # <TestResources_GenericMethodWithTwoTypes>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance()->execute();

    # get types for generic method
    my $target_type1 = $called_runtime->get_type("System.String")->execute();
    my $target_type2 = $called_runtime->get_type("System.Int32")->execute();

    # invoke type's generic method
    my $response = $instance->invoke_generic_method("GenericSampleMethodWithTwoTypes", [ $target_type1, $target_type2 ], "test")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_GenericMethodWithTwoTypes>
    return $result;
}

sub Test_NetDll_TestResources_EnumAddToList {
    # <TestResources_EnumAddToList>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "$resources_directory/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get enum
    my $enum_type = $called_runtime->get_type("TestClass.TestClass+Fruit")->execute();

    # create enum items
    my $apple = $called_runtime->get_enum_item($enum_type, "Apple")->execute();
    my $mango = $called_runtime->get_enum_item($enum_type, "Mango")->execute();

    # create fruits array
    my $fruits_list = [ $apple, $mango ];

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("AddFruitsToList", $fruits_list)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_EnumAddToList>
    return $result;
}

sub Test_NetDll_TestResources_EnumNameAndValue {
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "$resources_directory/TestClass.dll";

    # load custom library
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

sub Test_NetDll_StandardLibrary_CreateInstanceOfGenericClass {
    # <StandardLibrary_CreateInstanceOfGenericClass>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # get string type
    my $string_type = $called_runtime->get_type("System.String");

    # get generic class with string type as parameter
    my $typeList = $called_runtime->get_type("System.Collections.Generic.List`1", $string_type)->execute();

    # create instance of generic class
    my $list = $typeList->create_instance()->execute();

    # invoke instance methods
    $list->invoke_instance_method("Add", "one")->execute();
    $list->invoke_instance_method("Add", "two")->execute();
    $list->invoke_instance_method("Add", "three")->execute();
    $list->invoke_instance_method("AddRange", [ "four", "five", "six" ])->execute();

    # check number of elements in list
    my $response = $list->get_instance_field("Count")->execute();
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_CreateInstanceOfGenericClass>
    return $result;
}

sub Test_NetDll_StandardLibrary_HandleList {
    # <StandardLibrary_HandleList>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # get string type
    my $string_type = $called_runtime->get_type("System.String");

    # get generic class with string type as parameter
    my $typeList = $called_runtime->get_type("System.Collections.Generic.List`1", $string_type)->execute();

    # create instance of generic class
    my $list = $typeList->create_instance()->execute();

    # invoke instance method "AddRange" with an array of strings
    $list->invoke_instance_method("AddRange", [ "one", "two", "three", "four", "five", "six" ])->execute();

    # get elements from list
    my $element0 = $list->get_index(0)->execute()->get_value();
    my $element1 = $list->get_index(1)->execute()->get_value();

    # get size of list
    my $size = $list->get_instance_field("Count")->execute()->get_value();

    # write results to console
    print("$element0, $element1, $size\n");
    # </StandardLibrary_HandleList>
    return ($element0, $element1, $size);
}

sub Test_NetDll_StandardLibrary_HandleDictionary {
    # <StandardLibrary_HandleDictionary>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # get types
    my $string_type = $called_runtime->get_type("System.String");
    my $double_type = $called_runtime->get_type("System.Double");

    # get generic class with string and double as parameters
    my $typeDictionary = $called_runtime
        ->get_type("System.Collections.Generic.Dictionary`2", $string_type, $double_type)
        ->execute();

    # create instance of generic class
    my $dictionary = $typeDictionary->create_instance()->execute();

    # invoke instance method "Add" for the keys and values
    $dictionary->invoke_instance_method("Add", "pi", pi)->execute();
    $dictionary->invoke_instance_method("Add", "e", exp(1))->execute();
    $dictionary->invoke_instance_method("Add", "c", 299792458.0)->execute();

    # get elements from dictionary
    my $c_value = $dictionary->get_index("c")->execute()->get_value();
    my $e_value = $dictionary->get_index("e")->execute()->get_value();

    # write results to console
    print("$c_value, $e_value\n");
    # </StandardLibrary_HandleDictionary>
    return ($c_value, $e_value);
}

sub Test_NetDll_StandardLibrary_HandleSet {
    # <StandardLibrary_HandleSet>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # get type for double
    my $double_type = $called_runtime->get_type("System.Double");

    # get generic class for HashSet with double as parameter
    my $hashSetType = $called_runtime->get_type("System.Collections.Generic.HashSet`1", $double_type)
        ->execute();

    # create instance of generic class
    my $hashSet = $hashSetType->create_instance()->execute();

    # invoke instance method "Add" with various double values
    $hashSet->invoke_instance_method("Add", 3.14)->execute();
    $hashSet->invoke_instance_method("Add", 9.81)->execute();
    $hashSet->invoke_instance_method("Add", 1.44)->execute();

    # get size of set via instance field "Count"
    my $response = $hashSet->get_instance_field("Count")->execute();
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_HandleSet>
    return $result;
}

sub Test_NetDll_TestResources_Refs_OneArg {
    # <TestResources_Refs>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create values for ref

    # first way - pass only value
    my $ref_value1 = $called_runtime->as_ref(10)->execute();

    # second way - pass value and type
    my $int_type = $called_runtime->get_type("System.Int32")->execute();
    my $ref_value2 = $called_runtime->as_ref(20.0, $int_type)->execute();

    # invoke type's static method with ref values
    $called_runtime_type->invoke_static_method("RefSampleMethod", $ref_value1)->execute();
    $called_runtime_type->invoke_static_method("RefSampleMethod", $ref_value2)->execute();

    # get ref values
    my $result1 = $ref_value1->get_ref_value()->execute()->get_value();
    my $result2 = $ref_value2->get_ref_value()->execute()->get_value();

    # write result to console
    print("$result1\n");
    print("$result2\n");
    # </TestResources_Refs>
    return ($result1, $result2);
}

sub Test_NetDll_TestResources_Refs_MultipleArgs {
    # <TestResources_Refs_MultipleArgs>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $double_type = $called_runtime->get_type("System.Double")->execute();

    # create values for ref with specific types
    my $ref_to_int = $called_runtime->as_ref(10)->execute();
    my $ref_to_double = $called_runtime->as_ref(5, $double_type)->execute();
    my $ref_to_string = $called_runtime->as_ref("Before execution")->execute();

    # invoke type's static method with ref values
    $called_runtime_type->invoke_static_method("RefSampleMethod2", $ref_to_int, $ref_to_double, $ref_to_string)->execute();

    # get ref values
    my $result1 = $ref_to_int->get_ref_value()->execute()->get_value();
    my $result2 = $ref_to_double->get_ref_value()->execute()->get_value();
    my $result3 = $ref_to_string->get_ref_value()->execute()->get_value();

    # write results to console
    print("$result1,, $result2,, $result3\n");
    # </TestResources_Refs_MultipleArgs>
    return ($result1, $result2, $result3);
}

sub Test_NetDll_TestResources_Outs {
    # <TestResources_Outs>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name   = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get types from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $string_type         = $called_runtime->get_type("System.String")->execute();

    # create values for outs
    # first way - pass only type
    my $outValue_1 = $called_runtime->as_out($string_type)->execute();
    # second way - pass initial value and type to cast on
    my $outValue_2 = $called_runtime->as_out('c', $string_type)->execute();
    # third way - pass initial value without specific type
    my $outValue_3 = $called_runtime->as_out("Test string")->execute();

    # invoke type's static method with out values
    $called_runtime_type->invoke_static_method("OutSampleMethod", $outValue_1)->execute();
    $called_runtime_type->invoke_static_method("OutSampleMethod", $outValue_2)->execute();
    $called_runtime_type->invoke_static_method("OutSampleMethod", $outValue_3)->execute();

    # get outs' values
    my $result1 = $outValue_1->get_ref_value()->execute()->get_value();
    my $result2 = $outValue_2->get_ref_value()->execute()->get_value();
    my $result3 = $outValue_3->get_ref_value()->execute()->get_value();

    # write results to console
    print("$result1\n");
    print("$result2\n");
    print("$result3\n");
    # </TestResources_Outs>
    return ($result1, $result2, $result3);
}

sub Test_NetDll_TestResources_PassingNullAsOnlyArg {
    # <TestResources_PassingNullAsOnlyArg>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name   = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method with undef as only argument
    my $response = $called_runtime_type->invoke_static_method("PassNull", undef)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_PassingNullAsOnlyArg>
    return $result;
}

sub Test_NetDll_TestResources_PassingNullAsSecondArg {
    # <TestResources_PassingNullAsSecondArg>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name   = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method with first argument 5 and undef as second argument
    my $response = $called_runtime_type->invoke_static_method("PassNull2", 5, undef)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_PassingNullAsSecondArg>
    return $result;
}

sub Test_NetDll_TestResources_ReturningNull {
    # <TestResources_ReturningNull>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name   = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method that returns null
    my $response = $called_runtime_type->invoke_static_method("ReturnNull")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print(defined $result ? "$result\n" : "undef\n");
    # </TestResources_ReturningNull>
    return $result;
}

sub Test_NetDll_TestResources_MethodWithNullArgument {
    # <TestResources_MethodWithNullArgument>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name   = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get types from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $string_type         = $called_runtime->get_type("System.String")->execute();

    # invoke type's static method with null arguments
    my $response1 = $called_runtime_type
        ->invoke_static_method("MethodWithNullArgument", $string_type->create_null())
        ->execute();
    my $response2 = $called_runtime_type
        ->invoke_static_method("MethodWithNullArgument", $called_runtime_type->create_null())
        ->execute();

    # get values from responses
    my $result1 = $response1->get_value();
    my $result2 = $response2->get_value();

    # write results to console
    print("$result1\n");
    print("$result2\n");
    # </TestResources_MethodWithNullArgument>
    return ($result1, $result2);
}

sub Test_NetDll_TestResources_UseStaticMethodAsDelegate {
    # <TestResources_UseStaticMethodAsDelegate>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name   = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type and create instance
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $instance            = $called_runtime_type->create_instance()->execute();

    # get static method as delegate
    my $my_func = $called_runtime_type->get_static_method_as_delegate("DivideBy")->execute();

    # invoke instance's method using delegate
    my $response = $instance->invoke_instance_method("UseYourFunc", $my_func, 30, 6)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_UseStaticMethodAsDelegate>
    return $result;
}

sub Test_NetDll_TestResources_UseInstanceMethodAsDelegate {
    # <TestResources_UseInstanceMethodAsDelegate>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->netcore();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.dll";
    my $class_name   = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime and create instance
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $instance            = $called_runtime_type->create_instance()->execute();

    # get instance method as delegate
    my $my_func = $instance->get_instance_method_as_delegate("MultiplyTwoNumbers")->execute();

    # invoke instance's method using delegate
    my $response = $instance->invoke_instance_method("UseYourFunc", $my_func, 5, 6)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_UseInstanceMethodAsDelegate>
    return $result;
}

ok(defined Test_NetDll_StandardLibrary_CreateRuntimeContext(), 'Test_NetDll_StandardLibrary_CreateRuntimeContext');
ok(defined Test_NetDll_StandardLibrary_CreateInvocationContext(), 'Test_NetDll_StandardLibrary_CreateInvocationContext');
is(Test_NetDll_StandardLibrary_GetValue(), 50, 'Test_NetDll_StandardLibrary_GetValue');
is(Test_NetDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(), 50, 'Test_NetDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is(Test_NetDll_StandardLibrary_GetStaticField_MathPI_PI(), pi, 'Test_NetDll_StandardLibrary_GetStaticField_MathPI_PI');
isnt(index(Test_NetDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(), "2022"), -1, 'Test_NetDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022');
is(Test_NetDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022(), 2022, 'Test_NetDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022');
is(Test_NetDll_TestResources_LoadLibrary_LibraryPath_NoException(), 0, 'Test_NetDll_TestResources_LoadLibrary_LibraryPath_NoException');
is(Test_NetDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(), 50, 'Test_NetDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is(Test_NetDll_TestResources_GetStaticField_StaticValue_3(), 3, 'Test_NetDll_TestResources_GetStaticField_StaticValue_3');
is(Test_NetDll_TestResources_SetStaticField_StaticValue_75(), 75, 'Test_NetDll_TestResources_SetStaticField_StaticValue_3');
is(Test_NetDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(), 20, 'Test_NetDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is(Test_NetDll_TestResources_GetInstanceField_PublicValue_18(), 18, 'Test_NetDll_TestResources_GetInstanceField_PublicValue_18');
is(Test_NetDll_TestResources_SetInstanceField_PublicValue_44(), 44, 'Test_NetDll_TestResources_SetInstanceField_PublicValue_44');
like(Test_NetDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException(), qr/DivideByThird/, 'Test_NetDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException');
is(Test_NetDll_TestResources_1DArray_GetIndex_2_StringThree(), "three", 'Test_NetDll_TestResources_1DArray_GetIndex_2_StringThree');
is(Test_NetDll_TestResources_1DArray_GetSize_5(), 5, 'Test_NetDll_TestResources_1DArray_GetSize_5');
is(Test_NetDll_TestResources_1DArray_SetIndex_StringSeven(), "seven", 'Test_NetDll_TestResources_1DArray_SetIndex_StringSeven');
#is(Test_NetDll_TestResources_Cast_ToUInt32(), "CastSampleMethod with System.UInt32 called", 'Test_NetDll_TestResources_Cast_ToUInt32');
#is(Test_NetDll_TestResources_Cast_ToFloat(), "CastSampleMethod with System.Float called", 'Test_NetDll_TestResources_Cast_ToFloat');
is(Test_NetDll_TestResources_GenericStaticMethod(), "7 and 5", 'Test_NetDll_TestResources_GenericStaticMethod');
is(Test_NetDll_TestResources_GenericMethod(), "7 or 5", 'Test_NetDll_TestResources_GenericMethod');
is(Test_NetDll_TestResources_GenericMethodWithTwoTypes(), 0, 'Test_NetDll_TestResources_GenericMethodWithTwoTypes');
is(Test_NetDll_TestResources_EnumAddToList(), "2 fruits on the list", 'Test_NetDll_TestResources_EnumAddToList');
is(Test_NetDll_TestResources_EnumNameAndValue(), "Mango: 3, Orange: 2", 'Test_NetDll_TestResources_GenericMethod');
is(Test_NetDll_StandardLibrary_CreateInstanceOfGenericClass(), 6, 'Test_NetDll_StandardLibrary_CreateInstanceOfGenericClass');
is_deeply([ Test_NetDll_StandardLibrary_HandleList() ], [ "one", "two", 6 ], 'Test_JarLibrary_StandardLibrary_HandleList');
is_deeply([ Test_NetDll_StandardLibrary_HandleDictionary() ], [ 299792458.0, exp(1) ], 'Test_JarLibrary_StandardLibrary_HandleDictionary');
is(Test_NetDll_StandardLibrary_HandleSet(), 3, 'Test_JarLibrary_StandardLibrary_HandleSet');
is_deeply([ Test_NetDll_TestResources_Refs_OneArg() ], [ 20, 40 ], 'Test_NetDll_TestResources_Refs_OneArg');
is_deeply([ Test_NetDll_TestResources_Refs_MultipleArgs() ], [ 20, 2.5, "Done" ], 'Test_NetDll_TestResources_Refs_MultipleArgs');
is_deeply([ Test_NetDll_TestResources_Outs() ],
    [ "String from OutSampleMethod", "String from OutSampleMethod", "String from OutSampleMethod" ],
    'Test_NetDll_TestResources_Outs');
#is(Test_NetDll_TestResources_PassingNullAsOnlyArg(), "Method called with null", 'Test_NetDll_TestResources_PassingNullAsOnlyArg');
#is(Test_NetDll_TestResources_PassingNullAsSecondArg(), "Method2 called with null", 'Test_NetDll_TestResources_PassingNullAsSecondArg');
is(Test_NetDll_TestResources_ReturningNull(), undef, 'Test_NetDll_TestResources_ReturningNull');
is_deeply([ Test_NetDll_TestResources_MethodWithNullArgument() ],
    [ "MethodWithNullArgument called with string", "MethodWithNullArgument called with TestClass" ],
    'Test_NetDll_TestResources_MethodWithNullArgument');
is(Test_NetDll_TestResources_UseStaticMethodAsDelegate(), 5, 'Test_NetDll_TestResources_UseStaticMethodAsDelegate');
is(Test_NetDll_TestResources_UseInstanceMethodAsDelegate(), 30, 'Test_NetDll_TestResources_UseInstanceMethodAsDelegate');

done_testing();
