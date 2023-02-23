class TestClass:
    static_value = 3

    def __init__(self, public_value, private_value):
        self.public_value = public_value
        self.private_value = private_value

    @staticmethod
    def multiply_by_two(value):
        return value * 2

    def get_public_value(self):
        return self.public_value

    def set_public_value(self, public_value):
        self.public_value = public_value

    def get_private_value(self):
        return self.private_value

    def set_private_value(self, private_value):
        self.private_value = private_value

    def multiply_two_numbers(self, first, second):
        return first * second

    def get_1D_array(self):
        return ["one", "two", "three", "four", "five"]

    def add_number_to_1D_array(self, myArray, myDouble):
        for i in range(len(myArray)):
            myArray[i] += myDouble
        return myArray

    def produce_3d_array(self, my_int):
        response_array = [
            [
                [0 + my_int, 1 + my_int],
                [2 + my_int, 3 + my_int]
            ],
            [
                [4 + my_int, 5 + my_int],
                [6 + my_int, 7 + my_int]
            ]
        ]
        return response_array

    def produce_jagged_array(self, my_array):
        response_array = [
            my_array,
            my_array,
            my_array
        ]
        return response_array
