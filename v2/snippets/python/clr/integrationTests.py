import math
import platform
from pathlib import Path

import pytest
from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent) + '/testResources/clr'


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_standardlibrary_invokestaticmethod_systemmath_abs_minus50_50():
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # get type from the runtime
    clr_type = clr_runtime.get_type("System.Math").execute()

    # invoke type's static method
    response = clr_type.invoke_static_method("Abs", -50).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeStaticMethod>
    assert (result == 50)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_standardlibrary_getstaticfield_mathpi_pi():
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # get type from the runtime
    clr_type = clr_runtime.get_type("System.Math").execute()

    # get type's static field
    response = clr_type.get_static_field("PI").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetStaticField>
    assert (result == math.pi)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_standardlibrary_invokeinstancemethod_systemdatetime_toshortdatestring_contains2022():
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # get type from the runtime
    clr_type = clr_runtime.get_type("System.DateTime").execute()

    # create type's instance
    instance = clr_type.create_instance(2022, 9, 2).execute()

    # invoke instance's method
    response = instance.invoke_instance_method("ToShortDateString").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeInstanceMethod>
    assert ("2022" in result)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_standardlibrary_getinstancefield_systemdatetime_year_2022():
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # get type from the runtime
    clr_type = clr_runtime.get_type("System.DateTime").execute()

    # create type's instance
    instance = clr_type.create_instance(2022, 9, 2).execute()

    # get instance's field
    response = instance.get_instance_field("Year").execute()

    # get value from response
    result = response.get_value()
    # </StandardLibrary_GetInstanceField>
    assert (result == 2022)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_testresources_loadlibrary_librarypath_noexception():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/ClrTestClass.dll'

    # load custom library
    clr_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_testresources_invokestaticmethod_multiplybytwo_25_50():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/ClrTestClass.dll'
    class_name = 'ClrTestClass.ClrTestClass'

    # load custom library
    clr_runtime.load_library(library_path)

    # get type from the runtime
    clr_type = clr_runtime.get_type(class_name).execute()

    # invoke type's static method
    response = clr_type.invoke_static_method("MultiplyByTwo", 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_testresources_getstaticfield_staticvalue_3():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/ClrTestClass.dll'
    class_name = 'ClrTestClass.ClrTestClass'

    # load custom library
    clr_runtime.load_library(library_path)

    # get type from the runtime
    clr_type = clr_runtime.get_type(class_name).execute()

    # get type's static field
    response = clr_type.get_static_field("StaticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert (result == 3)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_testresources_setstaticfield_staticvalue_75():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/ClrTestClass.dll'
    class_name = 'ClrTestClass.ClrTestClass'

    # load custom library
    clr_runtime.load_library(library_path)

    # get type from the runtime
    clr_type = clr_runtime.get_type(class_name).execute()

    # set static field value
    clr_type.set_static_field("StaticValue", 75).execute()

    # get type's static field
    response = clr_type.get_static_field("StaticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    clr_type.set_static_field("StaticValue", 3).execute()
    assert (result == 75)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/ClrTestClass.dll'
    class_name = 'ClrTestClass.ClrTestClass'

    # load custom library
    clr_runtime.load_library(library_path)

    # get type from the runtime
    clr_type = clr_runtime.get_type(class_name).execute()

    # create type's instance
    instance = clr_type.create_instance(13, 14).execute()

    # invoke instance's method
    response = instance.invoke_instance_method("MultiplyTwoNumbers", 2, 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeInstanceMethod>
    assert (result == 50)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_testresources_getinstancefield_publicvalue_18():
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create clr runtime context
    clr_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/ClrTestClass.dll'
    class_name = 'ClrTestClass.ClrTestClass'

    # load custom library
    clr_runtime.load_library(library_path)

    # get type from the runtime
    clr_type = clr_runtime.get_type(class_name).execute()

    # create type's instance
    instance = clr_type.create_instance(18, 19).execute()

    # get instance's field
    response = instance.get_instance_field("PublicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert (result == 18)


@pytest.mark.skipif(platform.system() != 'Windows', reason="CLR implemented only on Windows")
def test_clr_standardlibrary_systemdatetime_passinstanceasargument():
    instance = Javonet.in_memory().clr().get_type("System.DateTime").create_instance(2022, 9, 13, 8, 24,
                                                                                     22).execute()
    culture_info_es = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").create_instance(
        "es-ES",
        False).execute();
    culture_info_pl = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").create_instance(
        "pl-PL",
        False).execute();
    culture_info_de = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").create_instance(
        "de-De",
        False).execute();
    culture_info_ja = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").create_instance(
        "ja-JP",
        False).execute();
    culture_info_uk = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").invoke_static_method(
        "GetCultureInfo", "uk-Ua").execute();

    result_es = instance.invoke_instance_method("ToString", "F", culture_info_es).execute().get_value()
    result_pl = instance.invoke_instance_method("ToString", "F", culture_info_pl).execute().get_value()
    result_de = instance.invoke_instance_method("ToString", "F", culture_info_de).execute().get_value()
    result_ja = instance.invoke_instance_method("ToString", "F", culture_info_ja).execute().get_value()
    result_uk = instance.invoke_instance_method("ToString", "F", culture_info_uk).execute().get_value()

    assert (result_es == "martes, 13 de septiembre de 2022 8:24:22")
    assert (result_pl == "wtorek, 13 września 2022 08:24:22")
    assert (result_de == "Dienstag, 13. September 2022 08:24:22")
    assert (result_ja == "2022年9月13日 8:24:22")
    assert (result_uk == "13 вересня 2022 р. 8:24:22")
