module TestClass
  class TestClass
    @@static_value = 3
    @public_value
    @private_value

    def initialize(public_value, private_value)
      @public_value = public_value
      @private_value = private_value
    end

    def self.multiply_by_two(value)
      return value * 2
    end

    def get_public_value
      return @public_value
    end

    def set_public_value(public_value)
      @public_value = public_value
    end

    def get_private_value
      return @private_value
    end

    def set_private_value(private_value)
      @private_value = private_value
    end

    def multiply_two_numbers(first, second)
      return first * second
    end

    def get_1D_array
      return ["one", "two", "three", "four", "five"]
    end

    def add_number_to_1D_array(my_array, my_double)
      my_array = my_array.map do |item|
        item += my_double
      end
      return my_array
    end

    def produce_3d_array(my_int)
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
    end

    def produce_jagged_array(my_array)
      response_array = [
        my_array,
        my_array,
        my_array
      ]
      return response_array
    end

  end
end