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

	 def get_2d_array
	   return [["S00", "S01"],["S10", "S11"]]
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

	# <PassingNull>
	def self.pass_null(arg)
	 if arg.nil?
		 return "Method called with null"
	 else
		 return "Method not called with null"
	 end
	end

	def self.pass_null_2(arg1, arg2)
	 if arg2.nil?
		 return "Method2 called with null"
	 else
		 return "Method2 not called with null"
	 end
	end
	# </PassingNull>

 # <ReturningNull>
 def self.return_null
	 return nil
 end
 # </ReturningNull>

 # <Multithreading>
 @@cache = {}

 def add_two_numbers(x, y)
	 thread_id = Thread.current.object_id
	 puts "Computing result in thread: #{thread_id}"
	 sleep(1)  # Simulate computation delay
	 result = x + y
	 puts "Saving result in thread: #{thread_id}"
	 sleep(0.05)  # Simulate saving delay
	 @@cache[thread_id] = result
	 puts "Returning result in thread: #{thread_id}"
	 result
 end
 # </Multithreading>

 # <AsyncMethods>
 def create_file_with_content(file_name, file_input)
	 sleep(2)  # Simulate async operation
	 File.open(file_name, "w") do |file|
		 file.write(file_input)
	 end
	 "Input processed"
 end
 # </AsyncMethods>

	# <Empty>
	# empty
	# </Empty>
  end
end