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

    #<Empty>
    # empty
    #/Empty>