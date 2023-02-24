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
my $resources_directory = "${this_file_path}/../../../testResources/nodejs-package";

sub Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # get type from the runtime
    my $nodejs_type = $nodejs_runtime->get_type("Math")->execute();

    # invoke type's static method
    my $response = $nodejs_type->invoke_static_method("abs", -50)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # get type from the runtime
    my $nodejs_type = $nodejs_runtime->get_type("Math")->execute();

    # get type's static field
    my $response = $nodejs_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $nodejs_type = $nodejs_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $nodejs_type->invoke_static_method("multiplyByTwo", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_Nodejs_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $nodejs_type = $nodejs_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $nodejs_type->get_static_field("staticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_Nodejs_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $nodejs_type = $nodejs_runtime->get_type($class_name)->execute();

    # set type's static field
    $nodejs_type->set_static_field("staticValue", 75)->execute();

    # get type's static field
    my $response = $nodejs_type->get_static_field("staticValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $nodejs_type->set_static_field("staticValue", 3)->execute();
    return $result;
}

sub Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $nodejs_type = $nodejs_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $nodejs_type->create_instance(12, 13)->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("multiplyTwoNumbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_Nodejs_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Nodejs runtime context
    my $nodejs_runtime = Javonet->in_memory()->nodejs();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.js";
    my $class_name = "TestClass";

    # load Nodejs custom library
    $nodejs_runtime->load_library($library_path);

    # get type from the runtime
    my $nodejs_type = $nodejs_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $nodejs_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("publicValue")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

my $test_result_1 = Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
my $test_result_2 = Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI();
my $test_result_3 = Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoException();
my $test_result_4 = Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $test_result_5 = Test_Nodejs_TestResources_GetStaticField_StaticValue_3();
my $test_result_6 = Test_Nodejs_TestResources_SetStaticField_StaticValue_75();
my $test_result_7 = Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $test_result_8 = Test_Nodejs_TestResources_GetInstanceField_PublicValue_18();

is($test_result_1, 50, 'Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is(sprintf("%.5f", $test_result_2), sprintf("%.5f", pi), 'Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI');
is($test_result_3, 0, 'Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoException');
is($test_result_4, 50, 'Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is($test_result_5, 3, 'Test_Nodejs_TestResources_GetStaticField_StaticValue_3');
is($test_result_6, 75, 'Test_Nodejs_TestResources_SetStaticField_StaticValue_3');
is($test_result_7, 20, 'Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is($test_result_8, 18, 'Test_Nodejs_TestResources_GetInstanceField_PublicValue_18');

done_testing();
