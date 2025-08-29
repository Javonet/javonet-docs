:::options
:title: Plugin `{calling_name}` Introduction
:description: This article provides general information about Javonet Plugins mechanism
:keywords: Javonet, `{called_name}` About, `{calling_name}`, Language Integration, Cross-Language Communication, .NET Core, Plugin, Plugins, Authentication, Authorization, 
Runtime
:::

# Create custom auth plugin

## Overview
This guide explains how to create a custom authentication plugin using Javonet.Netcore.Plugins.
The plugin can be dynamically loaded by the host application and configured without recompiling the host.

The process consists of two main parts:

* **Sending plugin** – used on the host side to provide payloads for authentication.
* **Receiving plugin** – used on the called side to process incoming commands.

## Calling side

### 1. Create the plugin skeleton

:::code :called_source/v2/snippets//{called_technology}/createPluginProject_terminal

**What this does?**

You are creating a .NET Class Library project that serves as your plugin.
Because it’s a library, the host application can load it dynamically whenever the plugin changes.

### 2. Install Plugins package.
   
Why this package is needed
It provides runtime mechanisms for:

* Loading plugin assemblies dynamically
* Resolving plugin implementations by interface
* Retrieving plugin configuration provided by the host application

The `PluginImplementationRegistry` class (used later) comes from this package.

### 3. Implement the sending plugin

:::code :called_source/v2/snippets//{called_technology}/MySendingPlugin.{called_ext}

**Explanation:**

1. Resolve an external developer’s implementation of your custom interface.
2. Retrieve plugin configuration (host-provided or from a config file).
3. Build and return the payload to the host application.

### 4. Registering plugin
Somewhare in you app you need to register your sending plugin. You can do it by:

:::code :called_source/v2/snippets//{called_technology}/Registration.{called_ext}

**Notes:**

* `runtimeContextId` comes from the `RuntimeContext` object.
* Your `MySendingPlugin` class must inherit from `Javonet.Netcore.Plugins.Settings.BasePluginSettings`.

## Called side
### 1. Create the ISetup implementation

In your app create the `ISetup` interface implementation:

:::code :called_source/v2/snippets//{called_technology}/MySetup.{called_ext}

**What happens here?**
* Register transient implementations of interfaces required by your plugin.
* Register configuration.
* Register the receiving plugin.

### 2. Add plugin implementation

:::code :called_source/v2/snippets//{called_technology}/MyCalledImplementation.{called_ext}

### 3. Implement the receiving plugin

:::code :called_source/v2/snippets//{called_technology}/MyReceivingPlugin.{called_ext}

**Explanation:**

* The receiving plugin resolves the required implementation.
* Executes external developer code.
* Returns execution context with the result.

### 4. Access plugin data in host code

:::code :called_source/v2/snippets//{called_technology}/CallPlugin.{called_ext}

**Note:** `MyPluginContext` must implement `Javonet.Netcore.Plugins.ExecutionContexts.IExecutionContext`.





