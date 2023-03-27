// <Import>
const { Javonet } = require('javonet-nodejs-sdk/lib/Javonet')
// </Import>

// use Activate only once in your app
Javonet.activate("your-email", "your-license-key")

// create PYTHON runtime context
let pythonRuntime = Javonet.inMemory().python()

// get type from the runtime
let pythonType = pythonRuntime.getType('math').execute()

// get type's field
let response = pythonType.getStaticField("pi").execute()

// get value from response
let result = response.getValue()
