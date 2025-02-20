import math
from pathlib import Path
import sys
import pytest

from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent.parent) + '/testResources/nodejs-package'


def test_NodejsPackage_StandardLibrary_CreateRuntimeContext():
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    assert called_runtime is not None


def test_NodejsPackage_StandardLibrary_CreateInvocationContext():
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type("Math").invoke_static_method("abs", -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute()
    # </StandardLibrary_CreateInvocationContext>
    assert response is not None


def test_NodejsPackage_StandardLibrary_GetValue():
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type("Math").invoke_static_method("abs", -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetValue>
    assert result == 50


def test_NodejsPackage_StandardLibrary_GetStaticField():
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("Math").execute()

    # get type's static field
    response = called_runtime_type.get_static_field("PI").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetStaticField>
    assert result == math.pi


def test_NodejsPackage_StandardLibrary_InvokeStaticMethod():
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("Math").execute()

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("abs", -50).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeStaticMethod>
    assert result == 50


def test_NodejsPackage_StandardLibrary_InvokeInstanceMethod():
    # <StandardLibrary_InvokeInstanceMethod>
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("Date").execute()

    # create type's instance with year, month, and day
    instance = called_runtime_type.create_instance(2024, 2, 3).execute()

    # invoke instance method "getFullYear"
    response = instance.invoke_instance_method("getFullYear").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeInstanceMethod>
    assert result == 2024


def test_NodejsPackage_StandardLibrary_GetInstanceField():
    # <StandardLibrary_GetInstanceField>
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("Set").execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # get instance's field "size"
    response = instance.get_instance_field("size").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetInstanceField>
    assert result == 0


def test_NodejsPackage_TestResources_LoadLibrary():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


def test_NodejsPackage_TestResources_GetStaticField():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # get type's static field
    response = called_runtime_type.get_static_field("staticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert result == 3


def test_NodejsPackage_TestResources_SetStaticField():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # set static field value
    called_runtime_type.set_static_field("staticValue", 75).execute()

    # get type's static field
    response = called_runtime_type.get_static_field("staticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    called_runtime_type.set_static_field("staticValue", 3).execute()
    assert result == 75


def test_NodejsPackage_TestResources_GetInstanceField():
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute()

    # get instance's field
    response = instance.get_instance_field("publicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert result == 18


def test_NodejsPackage_TestResources_SetInstanceField():
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute()

    # set instance's field
    instance.set_instance_field("publicValue", 44).execute()

    # get instance's field
    response = instance.get_instance_field("publicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetInstanceField>
    assert result == 44


def test_NodejsPackage_TestResources_InvokeStaticMethod():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke static method
    response = called_runtime_type.invoke_static_method("multiplyByTwo", 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


def test_NodejsPackage_TestResources_InvokeInstanceMethod():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("multiplyTwoNumbers", 2, 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeInstanceMethod>
    assert result == 50


def test_NodejsPackage_TestResources_1DArray_GetIndex():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # get index from array
    response = array.get_index(2).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetIndex>
    assert result == "three"


def test_NodejsPackage_TestResources_1DArray_GetSize():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # get array's size
    response = array.get_size().execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetSize>
    assert result == 5


def test_NodejsPackage_TestResources_1DArray_SetIndex():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # set array's index
    array.set_index(4, "seven").execute()

    # get index from array
    response = array.get_index(4).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetIndex>
    array.set_index(4, "five").execute()
    assert result == "seven"


def test_NodejsPackage_TestResources_1DArray_Iterate():
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # iterate through elements and invoke method on them
    array_values = list()
    for element in array:
        array_values.append(element.execute().get_value())

    # write result to console
    print(array_values)
    # </TestResources_1DArray_Iterate>
    assert array_values == ["one", "two", "three", "four", "five"]


def test_NodejsPackage_TestResources_1DArray_GetElement():
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # get element of array and invoke method on it
    response = array[2].execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetElement>
    assert result == "three"


def test_NodejsPackage_TestResources_1DArray_SetElement():
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # set element of array
    array[2] = "zero"

    # get element of array
    response = array[2].execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetElement>
    assert result == "zero"


def test_NodejsPackage_TestResources_1DArray_PassArrayAsArgument():
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("addArrayElementsAndMultiply",
                                               [12.22, 98.22, -10.44],
                                               9.99).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_PassArrayAsArgument>
    assert round(result, 3) == 999.0


def test_NodejsPackage_TestResources_1DArray_RetrieveArray():
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array_reference = instance.invoke_instance_method("get1DArray").execute()

    # get value from array reference
    result = array_reference.retrieve_array()

    # write result to console
    print(result)
    # </TestResources_1DArray_RetrieveArray>
    assert result == ["one", "two", "three", "four", "five"]


@pytest.mark.skipif(sys.platform == 'darwin', reason="Does not run on macOS")
def test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException():
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    try:
        Javonet.activate("your-license-key")

        # create called runtime context
        called_runtime = Javonet.in_memory().nodejs()

        # set up variables
        library_path = resources_directory + '/TestClass.js'
        class_name = 'TestClass'

        # load custom library
        called_runtime.load_library(library_path)

        # get type from the runtime
        called_runtime_type = called_runtime.get_type(class_name).execute()

        # invoke static method
        response = called_runtime_type.invoke_static_method("divideBy", 10, 0).execute()
    except Exception as e:
        # write exception to console
        print(e)
        # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        assert isinstance(e, Exception)
        assert "divideByThird" in str(e)


def test_NodejsPackage_TestResources_2DArray_GetIndex():
    # <TestResources_2DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get2DArray").execute()

    # three ways to get elements from array
    response1 = array[1][1].execute()
    response2 = array.get_index(1, 0).execute()
    response3 = array.get_index([0, 1]).execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()
    result3 = response3.get_value()

    # write result to console
    print(result1)
    print(result2)
    print(result3)
    # </TestResources_2DArray_GetIndex>
    assert result1 == "S11"
    assert result2 == "S10"
    assert result3 == "S01"


def test_NodejsPackage_TestResources_2DArray_GetSizeAndRank():
    # <TestResources_2DArray_GetSizeAndRank>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get2DArray").execute()

    # get size and rank from array
    response1 = array.get_size().execute()
    response2 = array.get_rank().execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()

    # write result to console
    print(result1)
    print(result2)
    # </TestResources_2DArray_GetSizeAndRank>
    assert result1 == 4
    assert result2 == 2


def test_NodejsPackage_TestResources_2DArray_SetIndex():
    # <TestResources_2DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get2DArray").execute()

    # set element of array
    array.set_index([0, 1], "new value").execute()

    # get element from array
    response = array[0][1].execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_2DArray_SetIndex>
    assert result == "new value"


def test_NodejsPackage_TestResources_PassingNullAsOnlyArg():
    # <TestResources_PassingNullAsOnlyArg>
    Javonet.activate("your-license-key")

    # create called runtime context for Nodejs
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method passing None as only argument
    response = called_runtime_type.invoke_static_method("passNull", None).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_PassingNullAsOnlyArg>
    assert result == "Method called with null"


def test_NodejsPackage_TestResources_PassingNullAsSecondArg():
    # <TestResources_PassingNullAsSecondArg>
    Javonet.activate("your-license-key")

    # create called runtime context for Nodejs
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method with a non-null first argument and None as the second
    response = called_runtime_type.invoke_static_method("passNull2", 5, None).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_PassingNullAsSecondArg>
    assert result == "Method2 called with null"


def test_NodejsPackage_TestResources_ReturningNull():
    # <TestResources_ReturningNull>
    Javonet.activate("your-license-key")

    # create called runtime context for Nodejs
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method that returns null
    response = called_runtime_type.invoke_static_method("returnNull").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_ReturningNull>
    assert result is None


def test_NodejsPackage_TestResources_Multithreading_InvokeInstanceMethod():
    # <TestResources_Multithreading_InvokeInstanceMethod>
    import threading
    Javonet.activate("your-license-key")

    # create called runtime context for Nodejs
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime and create an instance
    called_runtime_type = called_runtime.get_type(class_name).execute()
    instance = called_runtime_type.create_instance().execute()

    # create threads and dictionary to store responses
    responses = {}
    lock = threading.Lock()
    threads = []

    for i in range(5):
        def thread_func(j=i):
            response = instance.invoke_instance_method("addTwoNumbers", j, 5).execute().get_value()
            with lock:
                responses[j] = response

        thread = threading.Thread(target=thread_func)
        threads.append(thread)

    # start threads
    for thread in threads:
        thread.start()

    # wait for threads to finish
    for thread in threads:
        thread.join()

    # write results to console
    for key, value in responses.items():
        print(value)
    # </TestResources_Multithreading_InvokeInstanceMethod>
    for key, value in responses.items():
        assert value == key + 5


def test_NodejsPackage_TestResources_ExecuteAsync_AsyncMethod():
    # <TestResources_ExecuteAsync_AsyncMethod>
    import time
    from pathlib import Path
    Javonet.activate("your-license-key")

    # create called runtime context for Nodejs
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    start_time = time.time()

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute()
    instance = called_runtime_type.create_instance().execute()

    # create file
    file_name = str(Path.home() / "output.txt")
    open(file_name, 'w').close()

    # invoke instance methods asynchronously
    instance.invoke_instance_method("writeToFile", file_name, " This is ").execute_async()
    instance.invoke_instance_method("writeToFile", file_name, " file with ").execute_async()
    instance.invoke_instance_method("writeToFile", file_name, " sample input ").execute_async()

    # wait for async methods to finish
    time.sleep(3)

    end_time = time.time()
    print(f"Time elapsed: {(end_time - start_time) * 1000} milliseconds")
    # </TestResources_ExecuteAsync_AsyncMethod>
    assert end_time - start_time < 4


def test_NodejsPackage_TestResources_ExecuteAsync_SyncMethod():
    # <TestResources_ExecuteAsync_SyncMethod>
    import time
    Javonet.activate("your-license-key")

    # create called runtime context for Nodejs
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    start_time = time.time()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance methods asynchronously
    instance.invoke_instance_method("addThreeNumbers", 11, 12, 13).execute_async()
    instance.invoke_instance_method("addThreeNumbers", 21, 22, 23).execute_async()
    instance.invoke_instance_method("addThreeNumbers", 31, 32, 33).execute_async()

    # sleep to wait for async methods to finish
    time.sleep(3)
    end_time = time.time()
    print(f"Time elapsed: {(end_time - start_time) * 1000} milliseconds")
    # </TestResources_ExecuteAsync_SyncMethod>
    assert (end_time - start_time) < 4


def test_NodejsPackage_TestResources_UseStaticMethodAsDelegate():
    # <TestResources_UseStaticMethodAsDelegate>
    Javonet.activate("your-license-key")

    # create called runtime context for Nodejs
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute()
    instance = called_runtime_type.create_instance().execute()

    # get static method as delegate
    my_func = called_runtime_type.get_static_method_as_delegate("divideBy").execute()

    # invoke instance's method using delegate
    response = instance.invoke_instance_method("useYourFunc", my_func, 30, 6).execute()

    result = response.get_value()
    print(result)
    # </TestResources_UseStaticMethodAsDelegate>
    assert result == 5


def test_Nodejs_TestResources_UseInstanceMethodAsDelegate():
    # <TestResources_UseInstanceMethodAsDelegate>
    Javonet.activate("your-license-key")

    # create called runtime context for Nodejs
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + '/TestClass.js'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute()
    instance = called_runtime_type.create_instance().execute()

    # get instance method as delegate
    my_func = instance.get_instance_method_as_delegate("multiplyTwoNumbers").execute()

    # invoke instance's method using delegate
    response = instance.invoke_instance_method("useYourFunc", my_func, 5, 6).execute()

    result = response.get_value()
    print(result)
    # </TestResources_UseInstanceMethodAsDelegate>
    assert result == 30


def test_NodejsPackage_TestResources_InvokeGlobalFunction():
    # <TestResources_InvokeGlobalFunction>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().nodejs()

    # set up variables
    library_path = resources_directory + "/TestClass.js"

    # load custom library
    called_runtime.load_library(library_path)

    # invoke global function
    response = called_runtime.invoke_global_function("welcome", "John").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeGlobalFunction>
    assert result == "Hello John!"
