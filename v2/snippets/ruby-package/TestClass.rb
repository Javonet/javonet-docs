module TestClass
  class TestClass
     #<Fields>
    @@static_value = 3
    @public_value
    @private_value

    def initialize(public_value = 0, private_value = 0)
      @public_value = public_value
      @private_value = private_value
    end
    # </Fields>

    # <Methods>
    def self.multiply_by_two(a)
      return 2 * a
    end

    def multiply_two_numbers(a, b)
      return a * b
    end

    # </Methods>

    # <Arrays>
    def get_1d_array
      return ["one", "two", "three", "four", "five"]
    end

    def add_array_elements_and_multiply(my_array, my_value)
      return my_array.sum * my_value
    end
    # </Arrays>

    # <Exceptions>
    def self.divide_by(x, y)
      return self.divide_by_second(x, y)
    end

    def self.divide_by_second(x, y)
      return self.divide_by_third(x, y)
    end

    def self.divide_by_third(x, y)
      return x / y
    end
    # </Exceptions>

    # <Empty>
    # empty
    # </Empty>
  end
end