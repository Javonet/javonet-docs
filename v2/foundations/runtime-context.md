:::options
:title: Runtime Context
:description: The article describes the concept of Runtime Context
:related_articles: foundations/javonet-static-class, foundations/in-memory-channel, foundations/tcp-channel, foundations/invocation-context, foundations/execute-method,foundations/get-value-method
:keywords: Javonet, `{called_technology}` Runtime Context, `{calling_technology}`, Runtime Instance, Memory Space, Communication Channel, In Memory Channel, TCP Channel, Method Invocation, Library Loading, Object Interaction, Process Interaction
:::

# Runtime Context

Runtime Context represents the single context which allows to interact with selected technology.  
  
RuntimeContext refers to single instance of the called runtime within particular target OS process either the local currently running process (inMemory) or particular remote process identified by IP Address and PORT of target Javonet instance.  

:::code
:calling_source: v2/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_CreateRuntimeContext
:display: calling
:::
  
Multiple Runtime Contexts can be initialized within one process.  
  
Calling the same technology on inMemory communication channel will return the existing instance of runtime context.  
  
Calling the same technology on TCP channel but on different nodes will result with unique Runtime Contexts.  
  
Within the runtime context developer can load any number of libraries and interact with any objects from target technology that are aware of each other due to sharing the same memory space and same runtime instance.