module TestClass
  class TestClass
    #<Fields>
    @@static_value = 3
    @public_value
    @private_value

    def initialize(public_value, private_value)
      @public_value = public_value
      @private_value = private_value
    end

    #</Fields>

    #<Methods>
    def self.multiply_by_two(value)
      return value * 2
    end

    def multiply_two_numbers(first, second)
      return first * second
    end

    #</Methods>

    #<Arrays>
    def get_1d_array
      return ["one", "two", "three", "four", "five"]
    end

    def add_array_elements_and_multiply(my_array, my_value)
      return my_array.sum * my_value
    end

    #</Arrays>

    #<Empty>
    # minimal class
    #</Empty>
  end
end