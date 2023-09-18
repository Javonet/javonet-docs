# <Import>
require 'javonet-ruby-sdk'
# </Import>

# <WholeSnippet>
# <Activation>
Javonet.activate("your-email", "your-license-key")
# </Activation>

# <RuntimeContextCreation>
python_runtime = Javonet.in_memory.python
# </RuntimeContextCreation>

# <GetType>
python_type = python_runtime.get_type("math").execute
# </GetType>

# <GetStaticField>
response = python_type.get_static_field("pi").execute
# </GetStaticField>

# <GetValue>
result = response.get_value
puts result
# </GetValue>	
# </WholeSnippet>