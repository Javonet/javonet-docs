import math
from pathlib import Path

from javonet.sdk import Javonet

javonet_src_root = str(Path(__file__).parent.parent.parent.parent)
# <TestResources_TestClassValues>
library_path = javonet_src_root + '/testResources/perl'
fileName = 'PerlTestClass.pm'
class_name = 'PerlTestClass::PerlTestClass'
# </TestResources_TestClassValues>


def test_perl_testresources_loadlibrary_librarypath_noexception():
    # <TestResources_LoadLibrary>
    Javonet.in_memory().Perl().load_library(library_path, fileName)
    # </TestResources_LoadLibrary>


def test_perl_testresources_invokestaticmethod_multiplybytwo_25_50():
    # <TestResources_InvokeStaticMethod>
    Javonet.in_memory().Perl().load_library(library_path, fileName)
    call = Javonet.in_memory().Perl().get_type(class_name).invoke_static_method("multiply_by_two", 25).Execute()
    result = call.get_value()
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


def test_perl_testresources_getstaticfield_staticvalue_3():
    # <TestResources_GetStaticField>
    Javonet.in_memory().Perl().load_library(library_path, fileName)
    call = Javonet.in_memory().Perl().get_type(class_name).get_static_field("static_value").Execute()
    result = call.get_value()
    # </TestResources_GetStaticField>
    assert (result == 3)


def test_perl_testresources_setstaticfield_staticvalue_75():
    # <TestResources_SetStaticField>
    Javonet.in_memory().Perl().load_library(library_path, fileName)
    Javonet.in_memory().Perl().get_type(class_name).set_static_field("static_value", 75).Execute()
    call = Javonet.in_memory().Perl().get_type(class_name).get_static_field("static_value").Execute()
    result = call.get_value()
    # </TestResources_SetStaticField>
    assert (result == 75)
    Javonet.in_memory().Perl().get_type(class_name).set_static_field("static_value", 3).Execute()


def test_perl_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    # <TestResources_InvokeInstanceMethod>
    Javonet.in_memory().Perl().load_library(library_path, fileName)
    instance = Javonet.in_memory().Perl().get_type(class_name).create_instance().Execute()
    call = instance.invoke_instance_method("multiply_two_numbers", 2, 25).Execute()
    result = call.get_value()
    # </TestResources_InvokeInstanceMethod>
    assert (result == 50)


def test_perl_testresources_getinstancefield_publicvalue_1():
    # <TestResources_GetInstanceField>
    Javonet.in_memory().Perl().load_library(library_path, fileName)
    instance = Javonet.in_memory().Perl().get_type(class_name).create_instance().Execute()
    call = instance.get_instance_field("public_value").Execute()
    result = call.get_value()
    # </TestResources_GetInstanceField>
    assert (result == 1)
