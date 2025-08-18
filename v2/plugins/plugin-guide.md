:::options
:title: Plugin .NET Introduction
:description: This article provides general information about Javonet Plugins mechanism
:keywords: Javonet, `{called_name}` About, `{calling_name}`, Language Integration, Cross-Language Communication, .NET Core, Plugin, Plugins, Authentication, Authorization, 
Runtime
:::

# Create custom auth plugin (.NET CORE 3.1+)

## Overview
This guide explains how to create a custom authentication plugin using Javonet.Netcore.Plugins.
The plugin can be dynamically loaded by the host application and configured without recompiling the host.

The process consists of two main parts:

* **Sending plugin** – used on the host side to provide payloads for authentication.
* **Receiving plugin** – used on the called side to process incoming commands.

## Calling side

### 1. Create the plugin skeleton
```bash
mkdir MyApp
cd MyApp
mkdir MyPlugin
cd MyPlugin
dotnet new classlib
```
**What this does?**

You are creating a .NET Class Library project that serves as your plugin.
Because it’s a library, the host application can load it dynamically whenever the plugin changes.

### 2. Install `Javonet.Netcore.Plugins` nuget package.
   
Why this package is needed
`Javonet.Netcore.Plugins` provides runtime mechanisms for:

* Loading plugin assemblies dynamically
* Resolving plugin implementations by interface
* Retrieving plugin configuration provided by the host application

The `PluginImplementationRegistry` class (used later) comes from this package.

### 3. Implement the sending plugin

```csharp
using System;

namespace MyApp
{
    public class MySendingPlugin : ICommunitySendingPlugin
    {
        public object Execute()
        {
            // 1) Get an external developer’s implementation of your custom interface.
            //    This implementation is provided in another part of your app, registered with the plugin system.
            var customImplementation =
                PluginImplementationRegistry
                    .ResolvePluginTransientImplementation<IMyCustomInterface>();
            // Transient means: a new instance will be created every time you request it,
            // no shared state is kept between calls.

            // 2) Retrieve the plugin’s configuration settings
            //    (usually provided by the host or from a config file)
            var config =
                PluginImplementationRegistry
                    .GetPluginConfiguration<MyPluginSettings>();

            // 3) Use both the implementation and configuration to build the payload.
            //    If data cannot be created, throw an exception.
            object payload = GetAuthDataOrThrowException(customImplementation, config);

            // 4) Return the payload to the host application.
            return payload;
        }
    }
}
```

**Explanation:**

1. Resolve an external developer’s implementation of your custom interface.
2. Retrieve plugin configuration (host-provided or from a config file).
3. Build and return the payload to the host application.

### 4. Registering plugin
Somewhare in you app you need to register your sending plugin. You can do it by:

```csharp
PluginRegistry.RegisterSendingPlugin<MySendingPlugin>(runtimeContextId);

PluginImplementationRegistry.RegisterPluginTransientImplementation<IMyCustomInterface, ExternalDevImplementation>();

var config = new MyPluginSettings() { ... }
PluginImplementationRegistry.RegisterPluginConfiguration(config);
```

**Notes:**

* `runtimeContextId` comes from the `RuntimeContext` object.
* Your `MySendingPlugin` class must inherit from `Javonet.Netcore.Plugins.Settings.BasePluginSettings`.

## Called side
### 1. Create the ISetup implementation

In your app create the `ISetup` interface implementation:

```csharp
namespace MyApp
{
    public class MySetup : ISetup
    {
        public void Execute()
        {
            PluginImplementationRegistry
                .RegisterPluginTransientImplementation<IMyCustomCalledInterface, MyCalledImplementation>();

            var config = GetSomeConfig();

            PluginImplementationRegistry
                .RegisterPluginConfiguration(config);

            PluginRegistry.RegisterReceivingPlugin<MyReceivingPlugin>();
        }
    }
}
```

**What happens here?**
* Register transient implementations of interfaces required by your plugin.
* Register configuration.
* Register the receiving plugin.

### 2. Add plugin implementation

```csharp
namespace MyApp
{
    public class MyCalledImplementation : IMyCustomCalledInterface
    {
        public MyPluginData DoWhatYouNeed(...)
        {
            {...}
        }
    }
}
```

### 3. Implement the receiving plugin

```csharp
namespace MyApp
{
    public class MyReceivingPlugin : ICommunityReceivingPlugin
    {
        public IExecutionContext Execute(object commandPayload)
        {
            var externalDevCode = PluginImplementationRegistry.ResolvePluginTransientImplementation<IMyCustomCalledInterface>();
			
			MyPluginData result = externalDevCode.DoWhatYouNeed(commandPayload)

            return result;
        }
    }
}
```

**Explanation:**

* The receiving plugin resolves the required implementation.
* Executes external developer code.
* Returns execution context with the result.

### 4. Access plugin data in host code

```csharp
public object MyMethod(object commandPayload)
{
    var ctx = (MyPluginContext)ExecutionContextRegistry.GetContext();
}
```

**Note:** `MyPluginContext` must implement `Javonet.Netcore.Plugins.ExecutionContexts.IExecutionContext`.





