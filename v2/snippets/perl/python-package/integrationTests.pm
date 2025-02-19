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

my $osname = $^O;

Javonet->activate(ActivationCredentials::YOUR_LICENSE_KEY);

my $this_file_path = File::Spec->rel2abs(dirname(__FILE__));
my $resources_directory = "${this_file_path}/../../../../testResources/python-package";

sub Test_PythonPackage_StandardLibrary_CreateRuntimeContext {
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    return $called_runtime;
}

sub Test_PythonPackage_StandardLibrary_CreateInvocationContext {
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # construct an invocation context - this invocationContext in non-materialized
    my $invocation_context = $called_runtime->get_type("builtins")->invoke_static_method("abs", -50);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();
    # </StandardLibrary_CreateInvocationContext>
    return $response;
}

sub Test_PythonPackage_StandardLibrary_GetValue {
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # construct an invocation context - this invocationContext in non-materialized
    my $invocation_context = $called_runtime->get_type("builtins")->invoke_static_method("abs", -50);

    # execute invocation context - this will materialize the invocationContext
    my $response = $invocation_context->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </StandardLibrary_GetValue>
    return $result;
}

sub Test_PythonPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type("builtins")->execute();

    # invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_PythonPackage_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type("math")->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("pi")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_PythonPackage_StandardLibrary_InvokeInstanceMethod_BuiltIn_String_Upcase {
    # <StandardLibrary_InvokeInstanceMethod>
    Javonet->activate("your-license-key");
  
    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();
  
    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("builtins.str")->execute();
  
    # create type's instance
    my $instance = $called_runtime_type->create_instance("hello world")->execute();
  
    # invoke instance's method "upper"
    my $response = $instance->invoke_instance_method("upper")->execute();
  
    # get value from response
    my $result = $response->get_value();
  
    # write result to console
    print("$result\n");
    # </StandardLibrary_InvokeInstanceMethod>
    return $result;
}
  
sub Test_PythonPackage_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022 {
    # <StandardLibrary_GetInstanceField>
    Javonet->activate("your-license-key");
  
    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();
  
    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type("datetime.datetime")->execute();
  
    # create type's instance with year 2023, month 2, day 3, hour 12, minute 0, second 0
    my $instance = $called_runtime_type->create_instance(2023, 2, 3, 12, 0, 0)->execute();
  
    # get instance's field "year"
    my $response = $instance->get_instance_field("year")->execute();
  
    # get value from response
    my $result = $response->get_value();
  
    # write result to console
    print("$result\n");
    # </StandardLibrary_GetInstanceField>
    return $result;
}

sub Test_PythonPackage_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;

    # load custom library
    $python_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_PythonPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("multiply_by_two", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_PythonPackage_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("static_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_PythonPackage_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = ${resources_directory};
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # set type's static field
    $called_runtime_type->set_static_field("static_value", 75)->execute();

    # get type's static field
    my $response = $called_runtime_type->get_static_field("static_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $called_runtime_type->set_static_field("static_value", 3)->execute();
    return $result;
}

sub Test_PythonPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(0, 1)->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("multiply_two_numbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_PythonPackage_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("public_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

sub Test_PythonPackage_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(18, 19)->execute();

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

sub Test_PythonPackage_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(0, 1)->execute();

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

sub Test_PythonPackage_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(0, 1)->execute();

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

sub Test_PythonPackage_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $called_runtime_type->create_instance(0, 1)->execute();

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

sub Test_PythonPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException {
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $python_runtime->get_type($class_name)->execute();

    # #invoke type's static method which throws exception
    my $exception = "";
    try {
        my $response = $called_runtime_type->invoke_static_method("divide_by", 10, 0)->execute();
    }
    catch ($ex) {
        $exception = $ex;
    };
    print("Exception: $exception\n");
    # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    return $exception;
}

sub Test_PythonPackage_TestResources_EnumAddToList {
    # <TestResources_EnumAddToList>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name   = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # create enum items
    my $apple = $called_runtime->get_enum_item($called_runtime_type, "Fruit", "Apple")->execute();
    my $mango = $called_runtime->get_enum_item($called_runtime_type, "Fruit", "Mango")->execute();

    # create fruits array
    my $fruits = [ $apple, $mango ];

    # invoke type's static method
    my $response = $called_runtime_type->invoke_static_method("add_fruits_to_list", $fruits)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_EnumAddToList>
    return $result;
}

sub Test_PythonPackage_TestResources_EnumNameAndValue {
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = "$resources_directory";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # get enum's items
    my $fruit_1 = $called_runtime->get_enum_item($called_runtime_type, "Fruit", "Mango");
    my $fruit_2 = $called_runtime->get_enum_item($called_runtime_type, "Fruit", "Orange");

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

sub Test_PythonPackage_StandardLibrary_HandleList {
    # <StandardLibrary_HandleList>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # get list from built-in types and create an instance of list
    my $typeList = $called_runtime->get_type("builtins.list")->execute();
    my $list     = $typeList->create_instance()->execute();

    # invoke instance method "extend" with an array of strings
    $list->invoke_instance_method("extend", [ "one", "two", "three", "four", "five", "six" ])->execute();

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

sub Test_PythonPackage_StandardLibrary_HandleDictionary {
    # <StandardLibrary_HandleDictionary>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # get dictionary type and create instance
    my $typeDict   = $called_runtime->get_type("builtins.dict")->execute();
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

sub Test_PythonPackage_StandardLibrary_HandleSet {
    # <StandardLibrary_HandleSet>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # get type and create an instance of set
    my $typeSet = $called_runtime->get_type("builtins.set")->execute();
    my $hashSet = $typeSet->create_instance()->execute();

    # invoke instance method "add" with different values
    $hashSet->invoke_instance_method("add", 3.14)->execute();
    $hashSet->invoke_instance_method("add", 9.81)->execute();
    $hashSet->invoke_instance_method("add", 1.44)->execute();

    # get length of set using built-in function len
    my $len_response = $called_runtime->get_type("builtins")
                            ->invoke_static_method("len", $hashSet)->execute();
    my $result = $len_response->get_value();

    print("$result\n");
    # </StandardLibrary_HandleSet>
    return $result;
}

sub Test_PythonPackage_TestResources_PassingNullAsOnlyArg {
    # <TestResources_PassingNullAsOnlyArg>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = "$resources_directory";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method with undef as only argument
    my $response = $called_runtime_type->invoke_static_method("pass_null", undef)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_PassingNullAsOnlyArg>
    return $result;
}

sub Test_PythonPackage_TestResources_PassingNullAsSecondArg {
    # <TestResources_PassingNullAsSecondArg>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = "$resources_directory";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method with first argument 5 and undef as second argument
    my $response = $called_runtime_type->invoke_static_method("pass_null_2", 5, undef)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_PassingNullAsSecondArg>
    return $result;
}

sub Test_PythonPackage_TestResources_ReturningNull {
    # <TestResources_ReturningNull>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = "$resources_directory";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();

    # invoke type's static method that returns null
    my $response = $called_runtime_type->invoke_static_method("return_null")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print(defined $result ? "$result\n" : "undef\n");
    # </TestResources_ReturningNull>
    return $result;
}

sub Test_PythonPackage_TestResources_UseStaticMethodAsDelegate {
    # <TestResources_UseStaticMethodAsDelegate>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = "$resources_directory";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type and create instance
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $instance            = $called_runtime_type->create_instance(0, 1)->execute();

    # get static method as delegate
    my $my_func = $called_runtime_type->get_static_method_as_delegate("divide_by")->execute();

    # invoke instance's method using delegate
    my $response = $instance->invoke_instance_method("use_your_func", $my_func, 30, 6)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_UseStaticMethodAsDelegate>
    return $result;
}

sub Test_PythonPackage_TestResources_UseInstanceMethodAsDelegate {
    # <TestResources_UseInstanceMethodAsDelegate>
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = "$resources_directory";
    my $class_name = "TestClass.TestClass";

    # load custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime and create instance
    my $called_runtime_type = $called_runtime->get_type($class_name)->execute();
    my $instance            = $called_runtime_type->create_instance(0, 1)->execute();

    # get instance method as delegate
    my $my_func = $instance->get_instance_method_as_delegate("multiply_two_numbers")->execute();

    # invoke instance's method using delegate
    my $response = $instance->invoke_instance_method("use_your_func", $my_func, 5, 6)->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_UseInstanceMethodAsDelegate>
    return $result;
}

sub Test_PythonPackage_TestResources_InvokeGlobalFunction {
    # <TestResources_InvokeGlobalFunction>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create called runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = "${resources_directory}";

    # load custom library
    $called_runtime->load_library($library_path);

    # invoke global function
    my $response = $called_runtime->invoke_global_function("TestClass.welcome", "John")->execute();

    # get value from response
    my $result = $response->get_value();

    # write result to console
    print("$result\n");
    # </TestResources_InvokeGlobalFunction>
    return $result;
}

ok(defined Test_PythonPackage_StandardLibrary_CreateRuntimeContext(), 'Test_PythonPackage_StandardLibrary_CreateRuntimeContext');
ok(defined Test_PythonPackage_StandardLibrary_CreateInvocationContext(), 'Test_PythonPackage_StandardLibrary_CreateInvocationContext');
is(Test_PythonPackage_StandardLibrary_GetValue(), 50, 'Test_PythonPackage_StandardLibrary_GetValue');
is(Test_PythonPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(), 50, 'Test_PythonPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is(Test_PythonPackage_StandardLibrary_GetStaticField_MathPI_PI(), pi, 'Test_PythonPackage_StandardLibrary_GetStaticField_MathPI_PI');
is(Test_PythonPackage_StandardLibrary_InvokeInstanceMethod_BuiltIn_String_Upcase(), "HELLO WORLD", 'Test_PythonPackage_StandardLibrary_InvokeInstanceMethod_BuiltIn_String_Upcase');
is(Test_PythonPackage_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022(), 2023, 'Test_PythonPackage_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022');
is(Test_PythonPackage_TestResources_LoadLibrary_LibraryPath_NoException(), 0, 'Test_PythonPackage_TestResources_LoadLibrary_LibraryPath_NoException');
is(Test_PythonPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(), 50, 'Test_PythonPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is(Test_PythonPackage_TestResources_GetStaticField_StaticValue_3(), 3, 'Test_PythonPackage_TestResources_GetStaticField_StaticValue_3');
is(Test_PythonPackage_TestResources_SetStaticField_StaticValue_75(), 75, 'Test_PythonPackage_TestResources_SetStaticField_StaticValue_3');
is(Test_PythonPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(), 20, 'Test_PythonPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is(Test_PythonPackage_TestResources_GetInstanceField_PublicValue_18(), 18, 'Test_PythonPackage_TestResources_GetInstanceField_PublicValue_18');
is(Test_PythonPackage_TestResources_SetInstanceField_PublicValue_44(), 44, 'Test_PythonPackage_TestResources_SetInstanceField_PublicValue_44');
is(Test_PythonPackage_TestResources_1DArray_GetIndex_2_StringThree(), "three", 'Test_PythonPackage_TestResources_1DArray_GetIndex_2_StringThree');
is(Test_PythonPackage_TestResources_1DArray_GetSize_5(), 5, 'Test_PythonPackage_TestResources_1DArray_GetSize_5');
is(Test_PythonPackage_TestResources_1DArray_SetIndex_StringSeven(), "seven", 'Test_PythonPackage_TestResources_1DArray_SetIndex_StringSeven');
like(Test_PythonPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException(), qr/divide_by_third/, 'Test_PythonPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException');
is(Test_PythonPackage_TestResources_EnumAddToList(), "2 fruits on the list", 'Test_PythonPackage_TestResources_EnumAddToList');
is(Test_PythonPackage_TestResources_EnumNameAndValue(), "Mango: 4, Orange: 3", 'Test_PythonPackage_TestResources_EnumNameAndValue');
is_deeply([ Test_PythonPackage_StandardLibrary_HandleList() ],[ "one", "two", 6 ], 'Test_PythonPackage_StandardLibrary_HandleList');
is_deeply([ Test_PythonPackage_StandardLibrary_HandleDictionary() ], [ 299792458.0, exp(1) ], 'Test_PythonPackage_StandardLibrary_HandleDictionary');
is(Test_PythonPackage_StandardLibrary_HandleSet(), 3, 'Test_PythonPackage_StandardLibrary_HandleSet');
#is(Test_PythonPackage_TestResources_PassingNullAsOnlyArg(), "Method called with null", 'Test_PythonPackage_TestResources_PassingNullAsOnlyArg');
#is(Test_PythonPackage_TestResources_PassingNullAsSecondArg(), "Method2 called with null", 'Test_PythonPackage_TestResources_PassingNullAsSecondArg');
is(Test_PythonPackage_TestResources_ReturningNull(), undef, 'Test_PythonPackage_TestResources_ReturningNull');
is(Test_PythonPackage_TestResources_UseStaticMethodAsDelegate(), 5, 'Test_PythonPackage_TestResources_UseStaticMethodAsDelegate');
is(Test_PythonPackage_TestResources_UseInstanceMethodAsDelegate(), 30, 'Test_PythonPackage_TestResources_UseInstanceMethodAsDelegate');
#is(Test_PythonPackage_TestResources_InvokeGlobalFunction(), "Hello John!", 'Test_PythonPackage_TestResources_InvokeGlobalFunction');

done_testing();
