PluginRegistry.RegisterSendingPlugin<MySendingPlugin>(runtimeContextId);

PluginImplementationRegistry.RegisterPluginTransientImplementation<IMyCustomInterface, ExternalDevImplementation>();

var config = new MyPluginSettings() { };
PluginImplementationRegistry.RegisterPluginConfiguration(config);