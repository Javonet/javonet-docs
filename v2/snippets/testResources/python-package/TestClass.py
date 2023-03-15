# <Test_Resource_All>
class TestClass:
    static_value = 3

    def __init__(self, public_value, private_value):
        self.public_value = public_value
        self.private_value = private_value

    @staticmethod
    def multiply_by_two(value):
        return value * 2

    def multiply_two_numbers(self, first, second):
        return first * second

# </Test_Resource_All>