import math
from pathlib import Path

from javonet.sdk import Javonet

# <TestResources_TestClassValues>
javonet_src_root = str(Path(__file__).parent.parent.parent.parent)
library_path = javonet_src_root + '/testResources/ruby/ruby_test_class.rb'
class_name = 'RubyTestClass::RubyTestClass'


# </TestResources_TestClassValues>

def test_ruby_standardlibrary_loadlibrary_base64_noexception():
    # <StandardLibrary_LoadLibrary>
    Javonet.in_memory().Ruby().load_library("base64")
    # </StandardLibrary_LoadLibrary>

def test_ruby_standardlibrary_invokestaticmethod_math_sqrt_2500_50():
    # <StandardLibrary_InvokeStaticMethod>
    call = Javonet.in_memory().Ruby().get_type("Math").invoke_static_method("sqrt", 2500).Execute()
    result = call.get_value()
    # </StandardLibrary_InvokeStaticMethod>
    assert (result == 50)


def test_ruby_standardlibrary_getstaticfield_mathpi_pi():
    # <StandardLibrary_GetStaticField>
    call = Javonet.in_memory().Ruby().get_type("Math").get_static_field("PI").Execute()
    result = call.get_value()
    # </StandardLibrary_GetStaticField>
    assert (round(result, 6) == round(math.pi, 6))

def test_ruby_testresources_loadlibrary_librarypath_noexception():
    # <TestResources_LoadLibrary>
    Javonet.in_memory().Ruby().load_library(library_path)
    # </TestResources_LoadLibrary>


def test_ruby_testresources_invokestaticmethod_multiplybytwo_25_50():
    # <TestResources_InvokeStaticMethod>
    Javonet.in_memory().Ruby().load_library(library_path)
    call = Javonet.in_memory().Ruby().get_type(class_name).invoke_static_method("multiply_by_two", 25).Execute()
    result = call.get_value()
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


def test_ruby_testresources_getstaticfield_staticvalue_3():
    # <TestResources_GetStaticField>
    Javonet.in_memory().Ruby().load_library(library_path)
    call = Javonet.in_memory().Ruby().get_type(class_name).get_static_field("static_value").Execute()
    result = call.get_value()
    # </TestResources_GetStaticField>
    assert (result == 3)


def test_ruby_testresources_setstaticfield_staticvalue_75():
    # <TestResources_SetStaticField>
    Javonet.in_memory().Ruby().load_library(library_path)
    Javonet.in_memory().Ruby().get_type(class_name).set_static_field("static_value", 75).Execute()
    call = Javonet.in_memory().Ruby().get_type(class_name).get_static_field("static_value").Execute()
    result = call.get_value()
    # </TestResources_SetStaticField>
    assert (result == 75)
    Javonet.in_memory().Ruby().get_type(class_name).set_static_field("static_value", 3).Execute()


def test_ruby_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    # <TestResources_InvokeInstanceMethod>
    Javonet.in_memory().Ruby().load_library(library_path)
    instance = Javonet.in_memory().Ruby().get_type(class_name).create_instance(3, 4).Execute()
    call = instance.invoke_instance_method("multiply_two_numbers", 2, 25).Execute()
    result = call.get_value()
    # </TestResources_InvokeInstanceMethod>
    assert (result == 50)


def test_ruby_testresources_getinstancefield_publicvalue_3():
    # <TestResources_GetInstanceField>
    Javonet.in_memory().Ruby().load_library(library_path)
    instance = Javonet.in_memory().Ruby().get_type(class_name).create_instance(3, 4).Execute()
    call = instance.get_instance_field("public_value").Execute()
    result = call.get_value()
    # </TestResources_GetInstanceField>
    assert (result == 3)
