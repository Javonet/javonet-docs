module TestClass
  class TestClass
    @@static_value = 3
    @public_value

    private
    @private_value

    def initialize(public_value, private_value)
      @public_value = public_value
      @private_value = private_value
    end

    def self.multiply_by_two(value)
      return value * 2
    end

    def multiply_two_numbers(first, second)
      return first * second
    end
  end
end