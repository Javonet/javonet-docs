import threading
import time


class TestClass:

    def __init__(self, public_value, private_value):
        self.public_value = public_value
        self.private_value = private_value

    # <Fields>
    static_value = 3

    # </Fields>

    # <Methods>
    @staticmethod
    def multiply_by_two(a):
        return 2 * a

    def multiply_two_numbers(self, a, b):
        return a * b

    # </Methods>

    # <Arrays>
    def get_1d_array(self):
        return ["one", "two", "three", "four", "five"]

    def get_2d_array(self):
        return [["S00", "S01"], ["S10", "S11"]]

    def add_array_elements_and_multiply(self, my_array, my_value):
        return sum(my_array) * my_value

    # </Arrays>

    # <Exceptions>
    @staticmethod
    def divide_by(x, y):
        return TestClass.divide_by_second(x, y)

    @staticmethod
    def divide_by_second(x, y):
        return TestClass.divide_by_third(x, y)

    @staticmethod
    def divide_by_third(x, y):
        return x / y

    # </Exceptions>

    # <Enums>
    from enum import Enum
    class Fruit(Enum):
        Apple = 1
        Banana = 2
        Orange = 3
        Mango = 4

    Fruits = []

    @staticmethod
    def add_fruits_to_list(fruits):
        TestClass.Fruits.extend(fruits)
        return "{0} fruits on the list".format(len(TestClass.Fruits))

    # </Enums>

    # <PassingNull>
    @staticmethod
    def pass_null(arg):
        if arg is None:
            return "Method called with null"
        else:
            return "Method not called with null"

    @staticmethod
    def pass_null_2(arg1, arg2):
        if arg2 is None:
            return "Method2 called with null"
        else:
            return "Method2 not called with null"

    # </PassingNull>

    # <ReturningNull>
    @staticmethod
    def return_null():
        return None

    # </ReturningNull>

    # <Multithreading>
    cache = {}

    def add_two_numbers(self, x, y):
        thread_id = threading.get_ident()
        print(f"Computing result in thread: {thread_id}")
        time.sleep(1)  # Simulate computation delay
        result = x + y
        print(f"Saving result in thread: {thread_id}")
        time.sleep(0.05)  # Simulate saving delay
        self.cache[thread_id] = result
        print(f"Returning result in thread: {thread_id}")
        return result

    # </Multithreading>

    # <AsyncMethods>
    def create_file_with_content(self, file_name, file_input):
        time.sleep(2)  # Simulate async operation
        with open(file_name, "w") as file:
            file.write(file_input)
        return "Input processed"

    # </AsyncMethods>

    # <Delegates>
    @staticmethod
    def use_your_func(your_func, x, y):
        return your_func(x, y)

    # </Delegates>

    # <Empty>
    # empty
    # </Empty>
