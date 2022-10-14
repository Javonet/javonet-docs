module RubyTestClass
    class RubyTestClass
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
        return first*second
      end
    end
end