import math
from pathlib import Path

from javonet.sdk import Javonet


javonet_src_root = str(Path(__file__).parent.parent.parent.parent)
// <TestResources_TestClassValues>
library_path = javonet_src_root + '/testResources/jvm/JavaTestClass.jar'
class_name = 'javonet.test.resources.jvm.JavaTestClass'
// </TestResources_TestClassValues>


def test_jvm_standardlibrary_invokestaticmethod_javalangmath_abs_minus50_50():
    // <StandardLibrary_InvokeStaticMethod>
    call = Javonet.in_memory().Jvm().get_type("java.lang.Math").invoke_static_method("abs", -50).Execute()
    result = call.get_value()
    // </StandardLibrary_InvokeStaticMethod>
    assert (result == 50)


def test_jvm_standardlibrary_getstaticfield_mathpi_pi():
    // <StandardLibrary_GetStaticField>
    call = Javonet.in_memory().Jvm().get_type("java.lang.Math").get_static_field("PI").Execute()
    result = call.get_value()
    // </StandardLibrary_GetStaticField>
    assert (result == math.pi)


def test_jvm_standardlibrary_invokeinstancemethod_javautilrandom_nextInt_10_inrange1to10():
    // <StandardLibrary_InvokeInstanceMethod>
    instance = Javonet.in_memory().Jvm().get_type("java.util.Random").create_instance().Execute()
    call = instance.invoke_instance_method("nextInt", 10).Execute()
    result = call.get_value()
    // </StandardLibrary_GetStaticField>
    assert (result in range(0, 10))


def test_jvm_testresources_loadlibrary_librarypath_noexception():
    // <TestResources_LoadLibrary>
    Javonet.in_memory().Jvm().load_library(library_path)
    // </TestResources_LoadLibrary>


def test_jvm_testresources_invokestaticmethod_multiplybytwo_25_50():
    // <TestResources_InvokeStaticMethod>
    Javonet.in_memory().Jvm().load_library(library_path)
    call = Javonet.in_memory().Jvm().get_type(class_name).invoke_static_method("multiplyByTwo", 25).Execute()
    result = call.get_value()
    // </TestResources_InvokeStaticMethod>
    assert (result == 50)


def test_jvm_testresources_getstaticfield_staticvalue_3():
    // <TestResources_GetStaticField>
    Javonet.in_memory().Jvm().load_library(library_path)
    call = Javonet.in_memory().Jvm().get_type(class_name).get_static_field("staticValue").Execute()
    result = call.get_value()
    // </TestResources_GetStaticField>
    assert (result == 3)


def test_jvm_testresources_setstaticfield_staticvalue_75():
    // <TestResources_SetStaticField>
    Javonet.in_memory().Jvm().load_library(library_path)
    Javonet.in_memory().Jvm().get_type(class_name).set_static_field("staticValue", 75).Execute()
    call = Javonet.in_memory().Jvm().get_type(class_name).get_static_field("staticValue").Execute()
    result = call.get_value()
    // </TestResources_SetStaticField>
    assert (result == 75)
    Javonet.in_memory().Jvm().get_type(class_name).set_static_field("staticValue", 3).Execute()


def test_jvm_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    // <TestResources_InvokeInstanceMethod>
    Javonet.in_memory().Jvm().load_library(library_path)
    instance = Javonet.in_memory().Jvm().get_type(class_name).create_instance(3, 4).Execute()
    call = instance.invoke_instance_method("multiplyTwoNumbers", 2, 25).Execute()
    result = call.get_value()
    // </TestResources_InvokeInstanceMethod>
    assert (result == 50)


def test_jvm_testresources_getinstancefield_publicvalue_3():
    // <TestResources_GetInstanceField>
    Javonet.in_memory().Jvm().load_library(library_path)
    instance = Javonet.in_memory().Jvm().get_type(class_name).create_instance(3, 4).Execute()
    call = instance.get_instance_field("publicValue").Execute()
    result = call.get_value()
    // </TestResources_GetInstanceField>
    assert (result == 3)
