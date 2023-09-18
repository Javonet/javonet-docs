# <Import>
from javonet.sdk import Javonet
# </Import>

# <WholeSnippet>
# <Activation>
Javonet.activate("your-license-key")
# </Activation>

# <RuntimeContextCreation>
netcore_runtime = Javonet.in_memory().netcore()
# </RuntimeContextCreation>

# <GetType>
netcore_type = netcore_runtime.get_type("System.Math").execute()
# </GetType>

# <GetStaticField>
response = netcore_type.get_static_field("PI").execute()
# </GetStaticField>

# <GetValue>
result = response.get_value()
print(result)
# </GetValue>	
# </WholeSnippet>