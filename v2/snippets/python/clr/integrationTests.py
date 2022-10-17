import math
import platform
from pathlib import Path

from javonet.sdk import Javonet

javonet_src_root = str(Path(__file__).parent.parent.parent.parent)
// <TestResources_TestClassValues>
library_path = javonet_src_root + '/testResources/clr/ClrTestClass.dll'
class_name = 'ClrTestClass.ClrTestClass'
// </TestResources_TestClassValues>


def test_clr_standardlibrary_invokestaticmethod_systemmath_abs_minus50_50():
    if platform.system() == 'Windows':
        // <StandardLibrary_InvokeStaticMethod>
        call = Javonet.in_memory().Clr().get_type("System.Math").invoke_static_method("Abs", -50).Execute()
        result = call.get_value()
        // </StandardLibrary_InvokeStaticMethod>
        assert (result == 50)
    else:
        pass


def test_clr_standardlibrary_getstaticfield_mathpi_pi():
    if platform.system() == 'Windows':
        // <StandardLibrary_GetStaticField>
        call = Javonet.in_memory().Clr().get_type("System.Math").get_static_field("PI").Execute()
        result = call.get_value()
        // </StandardLibrary_GetStaticField>
        assert (result == math.pi)
    else:
        pass


def test_clr_standardlibrary_invokeinstancemethod_systemdatetime_toshortdatestring_contains2022():
    if platform.system() == 'Windows':
        // <StandardLibrary_InvokeInstanceMethod>
        instance = Javonet.in_memory().Clr().get_type("System.DateTime").create_instance(2022, 9, 2).Execute()
        call = instance.invoke_instance_method("ToShortDateString").Execute()
        result = call.get_value()
        // </StandardLibrary_InvokeInstanceMethod>
        assert ("2022" in result)
    else:
        pass


def test_clr_standardlibrary_getinstancefield_systemdatetime_year_2022():
    if platform.system() == 'Windows':
        // <StandardLibrary_GetInstanceField>
        instance = Javonet.in_memory().Clr().get_type("System.DateTime").create_instance(2022, 9, 2).Execute()
        call = instance.get_instance_field("Year").Execute()
        result = call.get_value()
        // </StandardLibrary_GetInstanceField>
        assert (result == 2022)
    else:
        pass


def test_clr_testresources_loadlibrary_librarypath_noexception():
    if platform.system() == 'Windows':
        // <TestResources_LoadLibrary>
        Javonet.in_memory().Clr().load_library(library_path)
        // </TestResources_LoadLibrary>
    else:
        pass


def test_clr_testresources_invokestaticmethod_multiplybytwo_25_50():
    if platform.system() == 'Windows':
        // <TestResources_InvokeStaticMethod>
        Javonet.in_memory().Clr().load_library(library_path)
        call = Javonet.in_memory().Clr().get_type(class_name).invoke_static_method("MultiplyByTwo", 25).Execute()
        result = call.get_value()
        // </TestResources_InvokeStaticMethod>
        assert (result == 50)
    else:
        pass


def test_clr_testresources_getstaticfield_staticvalue_3():
    if platform.system() == 'Windows':
        // <TestResources_GetStaticField>
        Javonet.in_memory().Clr().load_library(library_path)
        call = Javonet.in_memory().Clr().get_type(class_name).get_static_field("StaticValue").Execute()
        result = call.get_value()
        // </TestResources_GetStaticField>
        assert (result == 3)
    else:
        pass


def test_clr_testresources_setstaticfield_staticvalue_75():
    if platform.system() == 'Windows':
        // <TestResources_SetStaticField>
        Javonet.in_memory().Clr().load_library(library_path)
        Javonet.in_memory().Clr().get_type(class_name).set_static_field("StaticValue", 75).Execute()
        call = Javonet.in_memory().Clr().get_type(class_name).get_static_field("StaticValue").Execute()
        result = call.get_value()
        // </TestResources_SetStaticField>
        assert (result == 75)
        Javonet.in_memory().Clr().get_type(class_name).set_static_field("StaticValue", 3).Execute()
    else:
        pass


def test_clr_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    if platform.system() == 'Windows':
        // <TestResources_InvokeInstanceMethod>
        Javonet.in_memory().Clr().load_library(library_path)
        instance = Javonet.in_memory().Clr().get_type(class_name).create_instance(3, 4).Execute()
        call = instance.invoke_instance_method("MultiplyTwoNumbers", 2, 25).Execute()
        result = call.get_value()
        // </TestResources_InvokeInstanceMethod>
        assert (result == 50)
    else:
        pass


def test_clr_testresources_getinstancefield_publicvalue_3():
    if platform.system() == 'Windows':
        // <TestResources_GetInstanceField>
        Javonet.in_memory().Clr().load_library(library_path)
        instance = Javonet.in_memory().Clr().get_type(class_name).create_instance(3, 4).Execute()
        call = instance.get_instance_field("PublicValue").Execute()
        result = call.get_value()
        // </TestResources_GetInstanceField>
        assert (result == 3)
    else:
        pass


def test_clr_standardlibrary_systemdatetime_passinstanceasargument():
    if platform.system() == 'Windows':
        instance = Javonet.in_memory().Clr().get_type("System.DateTime").create_instance(2022, 9, 13, 8, 24,
                                                                                         22).Execute()
        culture_info_es = Javonet.in_memory().Clr().get_type("System.Globalization.CultureInfo").create_instance("es-ES",
                                                                                                               False).Execute();
        culture_info_pl = Javonet.in_memory().Clr().get_type("System.Globalization.CultureInfo").create_instance("pl-PL",
                                                                                                               False).Execute();
        culture_info_de = Javonet.in_memory().Clr().get_type("System.Globalization.CultureInfo").create_instance("de-De",
                                                                                                               False).Execute();
        culture_info_ja = Javonet.in_memory().Clr().get_type("System.Globalization.CultureInfo").create_instance("ja-JP",
                                                                                                               False).Execute();
        culture_info_uk = Javonet.in_memory().Clr().get_type("System.Globalization.CultureInfo").invoke_static_method(
            "GetCultureInfo", "uk-Ua").Execute();

        result_es = instance.invoke_instance_method("ToString", "F", culture_info_es).Execute().get_value()
        result_pl = instance.invoke_instance_method("ToString", "F", culture_info_pl).Execute().get_value()
        result_de = instance.invoke_instance_method("ToString", "F", culture_info_de).Execute().get_value()
        result_ja = instance.invoke_instance_method("ToString", "F", culture_info_ja).Execute().get_value()
        result_uk = instance.invoke_instance_method("ToString", "F", culture_info_uk).Execute().get_value()

        assert (result_es == "martes, 13 de septiembre de 2022 8:24:22")
        assert (result_pl == "wtorek, 13 września 2022 08:24:22")
        assert (result_de == "Dienstag, 13. September 2022 08:24:22")
        assert (result_ja == "2022年9月13日 8:24:22")
        assert (result_uk == "13 вересня 2022 р. 8:24:22")
    else:
        pass
