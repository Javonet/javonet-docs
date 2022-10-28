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
my $library_path = "${javonet_src_root}/testResources/jvm/JavaTestClass.jar";
my $class_name = "javonet.test.resources.jvm.JavaTestClass";
# </TestResources_TestClassValues>


sub Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50 {
    # <StandardLibrary_InvokeStaticMethod>
    my $call = Javonet->in_memory()->jvm()->get_type("java.lang.Math")->invoke_static_method("abs", -50)->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_InvokeStaticMethod>
    return $result;
}

sub Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI {
    # <StandardLibrary_GetStaticField>
    my $call = Javonet->in_memory()->jvm()->get_type("java.lang.Math")->get_static_field("PI")->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_GetStaticField>
    return $result;
}

sub Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9 {
    # <StandardLibrary_InvokeInstanceMethod>
    my $instance = Javonet->in_memory()->jvm()->get_type("java.util.Random")->create_instance()->Execute();
    my $call = $instance->invoke_instance_method("nextInt", 10)->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_InvokeInstanceMethod>
    return $result;
}

sub Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name {
    # <StandardLibrary_GetInstanceField>
    my $instance = Javonet->in_memory()->jvm()->get_type("java.sql.DriverPropertyInfo")->create_instance("sample value", "sample value2")->Execute();
    my $call = $instance->get_instance_field("name")->Execute();
    my $result = $call->get_value();
    # </StandardLibrary_GetInstanceField>
    return $result;
}

sub Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException {
    # <TestResources_LoadLibrary>
    Javonet->in_memory()->jvm()->load_library($library_path);
    # </TestResources_LoadLibrary>
    return 0;
}

sub Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50 {
    # <TestResources_InvokeStaticMethod>
    Javonet->in_memory()->jvm()->load_library($library_path);
    my $call = Javonet->in_memory()->jvm()->get_type($class_name)->invoke_static_method("multiplyByTwo", 25)->Execute();
    my $result = $call->get_value();
    # </TestResources_InvokeStaticMethod>
    return $result;
}

sub Test_Jvm_TestResources_GetStaticField_StaticValue_3 {
    # <TestResources_GetStaticField>
    Javonet->in_memory()->jvm()->load_library($library_path);
    my $call = Javonet->in_memory()->jvm()->get_type($class_name)->get_static_field("staticValue")->Execute();
    my $result = $call->get_value();
    # </TestResources_GetStaticField>
    return $result;
}

sub Test_Jvm_TestResources_SetStaticField_StaticValue_75 {
    # <TestResources_SetStaticField>
    Javonet->in_memory()->jvm()->load_library($library_path);
    Javonet->in_memory()->jvm()->get_type($class_name)->set_static_field("staticValue", 75)->Execute();
    my $call = Javonet->in_memory()->jvm()->get_type($class_name)->get_static_field("staticValue")->Execute();
    my $result = $call->get_value();
    # </TestResources_SetStaticField>
    Javonet->in_memory()->jvm()->get_type($class_name)->set_static_field("staticValue", 3)->Execute();
    return $result;
}

sub Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20 {
    # <TestResources_InvokeInstanceMethod>
    Javonet->in_memory()->jvm()->load_library($library_path);
    my $instance = Javonet->in_memory()->jvm()->get_type($class_name)->create_instance()->Execute();
    my $call = $instance->invoke_instance_method("multiplyTwoNumbers", 5, 4)->Execute();
    my $result = $call->get_value();
    # </TestResources_InvokeInstanceMethod>
    return $result;
}

sub Test_Jvm_TestResources_GetInstanceField_PublicValue_1 {
    # <TestResources_GetInstanceField>
    Javonet->in_memory()->jvm()->load_library($library_path);
    my $instance = Javonet->in_memory()->jvm()->get_type($class_name)->create_instance(1, 2)->Execute();
    my $call = $instance->get_instance_field("publicValue")->Execute();
    my $result = $call->get_value();
    # </TestResources_GetInstanceField>
    return $result;
}

my $test_result_1 = Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50();
my $test_result_2 = Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI();
my $test_result_3 = Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9();
my $test_result_4 = Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name();
my $test_result_5 = Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException();
my $test_result_6 = Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50();
my $test_result_7 = Test_Jvm_TestResources_GetStaticField_StaticValue_3();
my $test_result_8 = Test_Jvm_TestResources_SetStaticField_StaticValue_75();
my $test_result_9 = Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20();
my $test_result_10 = Test_Jvm_TestResources_GetInstanceField_PublicValue_1();


is($test_result_1, 50, 'Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50');
is($test_result_2, pi, 'Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI');
is(($test_result_3 < 10 && $test_result_3 >= 0), 1, 'Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9');
is($test_result_4, "sample value", 'Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name');
is($test_result_5, 0, 'Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException');
is($test_result_6, 50, 'Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50');
is($test_result_7, 3, 'Test_Jvm_TestResources_GetStaticField_StaticValue_3');
is($test_result_8, 75, 'Test_Jvm_TestResources_SetStaticField_StaticValue_3');
is($test_result_9, 20, 'Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20');
is($test_result_10, 1, 'Test_Jvm_TestResources_GetInstanceField_PublicValue_1');

done_testing();

