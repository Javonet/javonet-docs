// <WholeSnippet>
// <Import>
const {Javonet} = require('javonet-nodejs-sdk')
// </Import>

// <Activation>
Javonet.activate("your-license-key")
// </Activation>

// <RuntimeContextCreation>
let pythonRuntime = Javonet.inMemory().python()
// </RuntimeContextCreation>

// <GetType>
let pythonType = pythonRuntime.getType('math').execute()
// </GetType>

// <GetStaticField>
let response = pythonType.getStaticField("pi").execute()
// </GetStaticField>

// <GetValue>
let result = response.getValue()
console.log(result)
// </GetValue>	
// </WholeSnippet>