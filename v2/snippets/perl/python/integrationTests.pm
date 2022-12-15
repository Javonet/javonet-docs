use strict;
use warnings;
use Test::More qw(no_plan);
use Math::Trig;
use File::Basename;
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';
use ActivationCredentials;

Javonet->activate(ActivationCredentials::YOUREMAIL, ActivationCredentials::YOURLICENCEKEY);


my $this_file_path = dirname(__FILE__);
my $javonet_src_root = "${this_file_path}/../../..";

# <TestResources_TestClassValues>
my $library_path = "${javonet_src_root}/testResources/python";
my $class_name = "PythonTestClass.PythonTestClass";
# </TestResources_TestClassValues>


sub Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    my $call = Javonet->in_memory()->python()->get_type("builtins")->invoke_static_method("abs", -50)->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_Python_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    my $call = Javonet->in_memory()->python()->get_type("math")->get_static_field("pi")->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_Python_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    Javonet->in_memory()->python()->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    Javonet->in_memory()->python()->load_library($library_path);
    my $call = Javonet->in_memory()->python()->get_type($class_name)->invoke_static_method("multiply_by_two", 25)->Execute();
    my $result = $call->get_value();
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_Python_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    Javonet->in_memory()->python()->load_library($library_path);
    my $call = Javonet->in_memory()->python()->get_type($class_name)->get_static_field("static_value")->Execute();
    my $result = $call->get_value();
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_Python_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    Javonet->in_memory()->python()->load_library($library_path);
    Javonet->in_memory()->python()->get_type($class_name)->set_static_field("static_value", 75)->Execute();
    my $call = Javonet->in_memory()->python()->get_type($class_name)->get_static_field("static_value")->Execute();
    my $result = $call->get_value();
    # </TestResources_SetStaticField>
    Javonet->in_memory()->python()->get_type($class_name)->set_static_field("static_value", 3)->Execute();
    return $result;
}

sub Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    Javonet->in_memory()->python()->load_library($library_path);
    my $instance = Javonet->in_memory()->python()->get_type($class_name)->create_instance(3,4)->Execute();
    my $call = $instance->invoke_instance_method("multiply_two_numbers", 5, 4)->Execute();
    my $result = $call->get_value();
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_Python_TestResources_GetInstanceField_PublicValue_1 {
    # <TestResources_GetInstanceField>
    Javonet->in_memory()->python()->load_library($library_path);
    my $instance = Javonet->in_memory()->python()->get_type($class_name)->create_instance(1, 2)->Execute();
    my $call = $instance->get_instance_field("public_value")->Execute();
    my $result = $call->get_value();
    # </TestResources_GetInstanceField>
    return $result;
}

my $test_result_1 = Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50();
my $test_result_2 = Test_Python_StandardLibrary_GetStaticField_MathPI_PI();
my $test_result_3 = Test_Python_TestResources_LoadLibrary_LibraryPath_NoException
my $test_result_4 = Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $test_result_5 = Test_Python_TestResources_GetStaticField_StaticValue_3();
my $test_result_6 = Test_Python_TestResources_SetStaticField_StaticValue_75();
my $test_result_7 = Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $test_result_8 = Test_Python_TestResources_GetInstanceField_PublicValue_1();

is($test_result_1, 50, 'Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50');
is(sprintf("%.5f", $test_result_2), sprintf("%.5f", pi), 'Test_Python_StandardLibrary_GetStaticField_MathPI_PI');
is($test_result_3, 0, 'Test_Python_TestResources_LoadLibrary_LibraryPath_NoException');
is($test_result_4, 50, 'Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is($test_result_5, 3, 'Test_Python_TestResources_GetStaticField_StaticValue_3');
is($test_result_6, 75, 'Test_Python_TestResources_SetStaticField_StaticValue_3');
is($test_result_7, 20, 'Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is($test_result_8, 1, 'Test_Python_TestResources_GetInstanceField_PublicValue_1');

done_testing();
