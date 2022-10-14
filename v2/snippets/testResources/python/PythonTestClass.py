
class PythonTestClass:

    static_value = 3

    def __init__(self, public_value, private_value):
        self.public_value = public_value
        self.private_value = private_value

    def get_public_value(self):
        return self.public_value

    def set_public_value(self, public_value):
        self.public_value = public_value

    def get_private_value(self):
        return self.private_value

    def set_private_value(self, private_value):
        self.private_value = private_value

    def multiply_two_numbers(self, first, second):
        return first*second

    @staticmethod
    def multiply_by_two(value):
        return value * 2

