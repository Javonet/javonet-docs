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
my $resources_directory = "${this_file_path}/../../../testResources/ruby-package";

sub Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoException {
    # <StandardLibrary_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    $ruby_runtime->load_library("base64");
    # </StandardLibrary_LoadLibrary>
    return 0;
}

sub Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Abs_Sqrt_2500_50 {
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    # get type from the runtime
    my $ruby_type = $ruby_runtime->get_type("Math")->execute();

    # invoke type's static method
    my $response = $ruby_type->invoke_static_method("sqrt", 2500)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    # get type from the runtime
    my $ruby_type = $ruby_runtime->get_type("Math")->execute();

    # get type's static field
    my $response = $ruby_type->get_static_field("PI")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";

    # load Ruby custom library
    $ruby_runtime->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $ruby_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $ruby_runtime->get_type($class_name)->execute();

    #  invoke type's static method
    my $response = $ruby_type->invoke_static_method("multiply_by_two", 25)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_Ruby_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $ruby_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $ruby_runtime->get_type($class_name)->execute();

    # get type's static field
    my $response = $ruby_type->get_static_field("static_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_Ruby_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $ruby_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $ruby_runtime->get_type($class_name)->execute();

    # set type's static field
    $ruby_type->set_static_field("static_value", 75)->execute();

    # get type's static field
    my $response = $ruby_type->get_static_field("static_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_SetStaticField>
    $ruby_type->set_static_field("static_value", 3)->execute();
    return $result;
}

sub Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $ruby_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $ruby_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $ruby_type->create_instance(12, 13)->execute();

    # invoke instance's method
    my $response = $instance->invoke_instance_method("multiply_two_numbers", 5, 4)->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_Ruby_TestResources_GetInstanceField_PublicValue_18 {
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet->activate("your-email", "your-license-key");

    # create Ruby runtime context
    my $ruby_runtime = Javonet->in_memory()->ruby();

    # set up variables
    my $library_path = "${resources_directory}/TestClass.rb";
    my $class_name = "TestClass::TestClass";

    # load Ruby custom library
    $ruby_runtime->load_library($library_path);

    # get type from the runtime
    my $ruby_type = $ruby_runtime->get_type($class_name)->execute();

    # create type's instance
    my $instance = $ruby_type->create_instance(18, 19)->execute();

    # get instance's field
    my $response = $instance->get_instance_field("public_value")->execute();

    # get value from response
    my $result = $response->get_value();

    # print result to console
    print("$result\n");
    # </TestResources_GetInstanceField>
    return $result;
}

my $test_result_1 = Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoException();
my $test_result_2 = Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Abs_Sqrt_2500_50();
my $test_result_3 = Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI();
my $test_result_4 = Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoException
my $test_result_5 = Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $test_result_6 = Test_Ruby_TestResources_GetStaticField_StaticValue_3();
my $test_result_7 = Test_Ruby_TestResources_SetStaticField_StaticValue_75();
my $test_result_8 = Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $test_result_9 = Test_Ruby_TestResources_GetInstanceField_PublicValue_18();

is($test_result_1, 0, 'Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoException');
is($test_result_2, 50, 'Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Abs_Sqrt_2500_50');
is(sprintf("%.5f", $test_result_3), sprintf("%.5f", pi), 'Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI');
is($test_result_4, 0, 'Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoException');
is($test_result_5, 50, 'Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is($test_result_6, 3, 'Test_Ruby_TestResources_GetStaticField_StaticValue_3');
is($test_result_7, 75, 'Test_Ruby_TestResources_SetStaticField_StaticValue_3');
is($test_result_8, 20, 'Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is($test_result_9, 18, 'Test_Ruby_TestResources_GetInstanceField_PublicValue_18');

done_testing();

