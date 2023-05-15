class TestClass:

    def __init__(self, public_value, private_value):
        self.public_value = public_value
        self.private_value = private_value

    # <Fields>
    static_value = 3
    # </Fields>

    # <Methods>
    @staticmethod
    def multiply_by_two(value):
        return value * 2

    def multiply_two_numbers(self, first, second):
        return first * second
    # </Methods>

    # <Arrays>
    def get_1d_array(self):
        return ["one", "two", "three", "four", "five"]

    def add_array_elements_and_multiply(self, my_array, my_value):
        return sum(my_array) * my_value
    # </Arrays>

    # <Exceptions>
    @staticmethod
    def divideby(first, second):
        return TestClass.divideby_second(first, second)

    @staticmethod
    def divideby_second(first, second):
        return TestClass.divideby_third(first, second)

    @staticmethod
    def divideby_third(first, second):
        return first / second
    # </Exceptions>

    #<Empty>
    # empty
    #/Empty>