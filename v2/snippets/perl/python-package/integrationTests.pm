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
    ok(defined $called_runtime, 'Test_PythonPackage_StandardLibrary_CreateRuntimeContext');
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
    ok(defined $response, 'Test_PythonPackage_StandardLibrary_CreateInvocationContext');
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
    is($result, 50, 'Test_PythonPackage_StandardLibrary_GetValue');
}

sub Test_PythonPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;

    # load Python custom library
    $python_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_PythonPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_TestResources_1DArray_GetIndex_2_StringThree {
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_TestResources_1DArray_GetSize_5 {
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_TestResources_1DArray_SetIndex_StringSeven {
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet->activate("your-license-key");

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

sub Test_PythonPackage_TestResources_SetInstanceField_PublicValue_44 {
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Python runtime context
    my $python_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = $resources_directory;
    my $class_name = "TestClass.TestClass";

    # load python custom library
    $python_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $python_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $python_type->create_instance(18, 19)->execute();

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

sub Test_PythonPackage_TestResources_EnumNameAndValue {
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet->activate("your-license-key");

    # create Jvm runtime context
    my $called_runtime = Javonet->in_memory()->python();

    # set up variables
    my $library_path = "$resources_directory";
    my $class_name = "TestClass.TestClass";

    # load jvm custom library
    $called_runtime->load_library($library_path);

    # get type from the runtime
    my $python_type = $called_runtime->get_type($class_name)->execute();

    # get enum's items
    my $fruit_1 = $called_runtime->get_enum_item($python_type, "Fruit", "Mango");
    my $fruit_2 = $called_runtime->get_enum_item($python_type, "Fruit", "Orange");

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

if ("$osname" ne 'darwin') {
    is(Test_PythonPackage_StandardLibrary_CreateRuntimeContext(), 1, 'Test_PythonPackage_StandardLibrary_CreateRuntimeContext');
    is(Test_PythonPackage_StandardLibrary_CreateInvocationContext(), 1, 'Test_PythonPackage_StandardLibrary_CreateInvocationContext');
    is(Test_PythonPackage_StandardLibrary_GetValue(), 1, 'Test_PythonPackage_StandardLibrary_GetValue');
    is(Test_PythonPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(), 50, 'Test_PythonPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
    is(sprintf("%.5f", Test_PythonPackage_StandardLibrary_GetStaticField_MathPI_PI()), sprintf("%.5f", pi), 'Test_PythonPackage_StandardLibrary_GetStaticField_MathPI_PI');
    is(Test_PythonPackage_TestResources_LoadLibrary_LibraryPath_NoException(), 0, 'Test_PythonPackage_TestResources_LoadLibrary_LibraryPath_NoException');
    is(Test_PythonPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(), 50, 'Test_PythonPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
    is(Test_PythonPackage_TestResources_GetStaticField_StaticValue_3(), 3, 'Test_PythonPackage_TestResources_GetStaticField_StaticValue_3');
    is(Test_PythonPackage_TestResources_SetStaticField_StaticValue_75(), 75, 'Test_PythonPackage_TestResources_SetStaticField_StaticValue_3');
    is(Test_PythonPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(), 20, 'Test_PythonPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
    is(Test_PythonPackage_TestResources_GetInstanceField_PublicValue_18(), 18, 'Test_PythonPackage_TestResources_GetInstanceField_PublicValue_18');
    is(Test_PythonPackage_TestResources_1DArray_GetIndex_2_StringThree(), "three", 'Test_PythonPackage_TestResources_1DArray_GetIndex_2_StringThree');
    is(Test_PythonPackage_TestResources_1DArray_GetSize_5(), 5, 'Test_PythonPackage_TestResources_1DArray_GetSize_5');
    is(Test_PythonPackage_TestResources_1DArray_SetIndex_StringSeven(), "seven", 'Test_PythonPackage_TestResources_1DArray_SetIndex_StringSeven');
    is(Test_PythonPackage_TestResources_SetInstanceField_PublicValue_44(), 44, 'Test_PythonPackage_TestResources_SetInstanceField_PublicValue_44');
    is(Test_PythonPackage_TestResources_EnumNameAndValue(), "Mango: 4, Orange: 3", 'Test_PythonPackage_TestResources_EnumNameAndValue');
}
else {
    is(0, 0, 'Python not implemented on MacOs yet');
}

done_testing();
