import math
from pathlib import Path

from javonet.sdk import Javonet

# <TestResources_TestClassValues>
javonet_src_root = str(Path(__file__).parent.parent.parent.parent)
library_path = javonet_src_root + '/testResources/netcore/NetcoreTestClass.dll'
class_name = 'NetcoreTestClass.NetcoreTestClass'
# </TestResources_TestClassValues>


def test_netcore_standardlibrary_invokestaticmethod_systemmath_abs_minus50_50():
    # <StandardLibrary_InvokeStaticMethod>
    call = Javonet.in_memory().Netcore().get_type("System.Math").invoke_static_method("Abs", -50).Execute()
    result = call.get_value()
    # </StandardLibrary_InvokeStaticMethod>
    assert (result == 50)


def test_netcore_standardlibrary_getstaticfield_mathpi_pi():
    # <StandardLibrary_GetStaticField>
    call = Javonet.in_memory().Netcore().get_type("System.Math").get_static_field("PI").Execute()
    result = call.get_value()
    # </StandardLibrary_GetStaticField>
    assert (result == math.pi)


def test_netcore_standardlibrary_invokeinstancemethod_systemdatetime_toshortdatestring_contains2022():
    # <StandardLibrary_InvokeInstanceMethod>
    instance = Javonet.in_memory().Netcore().get_type("System.DateTime").create_instance(2022, 9, 2).Execute()
    call = instance.invoke_instance_method("ToShortDateString").Execute()
    result = call.get_value()
    # </StandardLibrary_GetStaticField>
    assert ("2022" in result)


def test_netcore_standardlibrary_getinstancefield_systemdatetime_year_2022():
    # <StandardLibrary_InvokeInstanceMethod>
    instance = Javonet.in_memory().Netcore().get_type("System.DateTime").create_instance(2022, 9, 2).Execute()
    call = instance.get_instance_field("Year").Execute()
    result = call.get_value()
    # </StandardLibrary_GetStaticField>
    assert (result == 2022)


def test_netcore_testresources_loadlibrary_librarypath_noexception():
    # <TestResources_LoadLibrary>
    Javonet.in_memory().Netcore().load_library(library_path)
    # </TestResources_LoadLibrary>


def test_netcore_testresources_invokestaticmethod_multiplybytwo_25_50():
    # <TestResources_InvokeStaticMethod>
    Javonet.in_memory().Netcore().load_library(library_path)
    call = Javonet.in_memory().Netcore().get_type(class_name).invoke_static_method("MultiplyByTwo", 25).Execute()
    result = call.get_value()
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


def test_netcore_testresources_getstaticfield_staticvalue_3():
    # <TestResources_GetStaticField>
    Javonet.in_memory().Netcore().load_library(library_path)
    call = Javonet.in_memory().Netcore().get_type(class_name).get_static_field("StaticValue").Execute()
    result = call.get_value()
    # </TestResources_GetStaticField>
    assert (result == 3)


def test_netcore_testresources_setstaticfield_staticvalue_75():
    # <TestResources_SetStaticField>
    Javonet.in_memory().Netcore().load_library(library_path)
    Javonet.in_memory().Netcore().get_type(class_name).set_static_field("StaticValue", 75).Execute()
    call = Javonet.in_memory().Netcore().get_type(class_name).get_static_field("StaticValue").Execute()
    result = call.get_value()
    # </TestResources_SetStaticField>
    assert (result == 75)
    Javonet.in_memory().Netcore().get_type(class_name).set_static_field("StaticValue", 3).Execute()


def test_netcore_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    # <TestResources_InvokeInstanceMethod>
    Javonet.in_memory().Netcore().load_library(library_path)
    instance = Javonet.in_memory().Netcore().get_type(class_name).create_instance(3, 4).Execute()
    call = instance.invoke_instance_method("MultiplyTwoNumbers", 2, 25).Execute()
    result = call.get_value()
    # </TestResources_InvokeInstanceMethod>
    assert (result == 50)


def test_netcore_testresources_getinstancefield_publicvalue_3():
    # <TestResources_GetInstanceField>
    Javonet.in_memory().Netcore().load_library(library_path)
    instance = Javonet.in_memory().Netcore().get_type(class_name).create_instance(3, 4).Execute()
    call = instance.get_instance_field("PublicValue").Execute()
    result = call.get_value()
    # </TestResources_GetInstanceField>
    assert (result == 3)


def test_netcore_standardlibrary_systemdatetime_passinstanceasargument():
    # <TestResources_GetInstanceField>
    instance = Javonet.in_memory().Netcore().get_type("System.DateTime").create_instance(2022, 9, 13, 8, 24,
                                                                                         22).Execute()
    culture_info_es = Javonet.in_memory().Netcore().get_type("System.Globalization.CultureInfo").create_instance(
        "es-ES",
        False).Execute();
    culture_info_pl = Javonet.in_memory().Netcore().get_type("System.Globalization.CultureInfo").create_instance(
        "pl-PL",
        False).Execute();
    culture_info_de = Javonet.in_memory().Netcore().get_type("System.Globalization.CultureInfo").create_instance(
        "de-De",
        False).Execute();

    result_es = instance.invoke_instance_method("ToString", "F", culture_info_es).Execute().get_value()
    result_pl = instance.invoke_instance_method("ToString", "F", culture_info_pl).Execute().get_value()
    result_de = instance.invoke_instance_method("ToString", "F", culture_info_de).Execute().get_value()

    # </TestResources_GetInstanceField>
    assert (result_es == "martes, 13 de septiembre de 2022 8:24:22")
    assert (result_pl == "wtorek, 13 września 2022 08:24:22")
    assert (result_de == "Dienstag, 13. September 2022 08:24:22")
