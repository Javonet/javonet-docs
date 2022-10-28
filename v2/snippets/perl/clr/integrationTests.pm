use strict;
use warnings;
use Test::More qw(no_plan);
use Math::Trig;
use File::Basename;
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';
use ActivationCredentials;

Javonet->activate(ActivationCredentials::YOUREMAIL, ActivationCredentials::YOURLICENCEKEY);

my $osname = $^O;

my $this_file_path = dirname(__FILE__);
my $javonet_src_root = "${this_file_path}/../../..";

# <TestResources_TestClassValues>
my $library_path = "${javonet_src_root}/testResources/clr/ClrTestClass.dll";
my $class_name = "ClrTestClass.ClrTestClass";
# </TestResources_TestClassValues>


sub Test_Clr_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    my $call = Javonet->in_memory()->clr()->get_type("System.Math")->invoke_static_method("Abs", -50)->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_Clr_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    my $call = Javonet->in_memory()->clr()->get_type("System.Math")->get_static_field("PI")->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022 {
    # <StandardLibrary_InvokeInstanceMethod>
    my $instance = Javonet->in_memory()->clr()->get_type("System.DateTime")->create_instance(2022, 9, 1)->Execute();
    my $call = $instance->invoke_instance_method("ToShortDateString")->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_InvokeInstanceMethod>
    return $result;
}

sub Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022 {
    # <StandardLibrary_GetInstanceField>
    my $instance = Javonet->in_memory()->clr()->get_type("System.DateTime")->create_instance(2022, 9, 1)->Execute();
    my $call = $instance->get_instance_field("Year")->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_GetInstanceField>
    return $result;
}

sub Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    Javonet->in_memory()->clr()->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    Javonet->in_memory()->clr()->load_library($library_path);
    my $call = Javonet->in_memory()->clr()->get_type($class_name)->invoke_static_method("MultiplyByTwo", 25)->Execute();
    my $result = $call->get_value();
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_Clr_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    Javonet->in_memory()->clr()->load_library($library_path);
    my $call = Javonet->in_memory()->clr()->get_type($class_name)->get_static_field("StaticValue")->Execute();
    my $result = $call->get_value();
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_Clr_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    Javonet->in_memory()->clr()->load_library($library_path);
    Javonet->in_memory()->clr()->get_type($class_name)->set_static_field("StaticValue", 75)->Execute();
    my $call = Javonet->in_memory()->clr()->get_type($class_name)->get_static_field("StaticValue")->Execute();
    my $result = $call->get_value();
    # </TestResources_SetStaticField>
    Javonet->in_memory()->clr()->get_type($class_name)->set_static_field("StaticValue", 3)->Execute();
    return $result;
}

sub Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    Javonet->in_memory()->clr()->load_library($library_path);
    my $instance = Javonet->in_memory()->clr()->get_type($class_name)->create_instance()->Execute();
    my $call = $instance->invoke_instance_method("MultiplyTwoNumbers", 5, 4)->Execute();
    my $result = $call->get_value();
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_Clr_TestResources_GetInstanceField_PublicValue_1 {
    # <TestResources_GetInstanceField>
    Javonet->in_memory()->clr()->load_library($library_path);
    my $instance = Javonet->in_memory()->clr()->get_type($class_name)->create_instance(1, 2)->Execute();
    my $call = $instance->get_instance_field("PublicValue")->Execute();
    my $result = $call->get_value();
    # </TestResources_GetInstanceField>
    return $result;
}

if ("$osname" eq 'MSWin32') {
    my $test_result_1 = Test_Clr_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
    my $test_result_2 = Test_Clr_StandardLibrary_GetStaticField_MathPI_PI();
    my $test_result_3 = index(Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(), "2022");
    my $test_result_4 = Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022();
    my $test_result_5 = Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException();
    my $test_result_6 = Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
    my $test_result_7 = Test_Clr_TestResources_GetStaticField_StaticValue_3();
    my $test_result_8 = Test_Clr_TestResources_SetStaticField_StaticValue_75();
    my $test_result_9 = Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
    my $test_result_10 = Test_Clr_TestResources_GetInstanceField_PublicValue_1();

    is($test_result_1, 50, 'Test_Clr_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
    is($test_result_2, pi, 'Test_Clr_StandardLibrary_GetStaticField_MathPI_PI');
    isnt($test_result_3, -1, 'Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022');
    is($test_result_4, 2022, 'Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022');
    is($test_result_5, 0, 'Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException');
    is($test_result_6, 50, 'Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
    is($test_result_7, 3, 'Test_Jvm_TestResources_GetStaticField_StaticValue_3');
    is($test_result_8, 75, 'Test_Clr_TestResources_SetStaticField_StaticValue_3');
    is($test_result_9, 20, 'Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
    is($test_result_10, 1, 'Test_Clr_TestResources_GetInstanceField_PublicValue_1');
}

done_testing();
