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