namespace MyApp
{
    public class MyReceivingPlugin : ICommunityReceivingPlugin
    {
        public IExecutionContext Execute(object commandPayload)
        {
            var externalDevCode = PluginImplementationRegistry.ResolvePluginTransientImplementation<IMyCustomCalledInterface>();

            MyPluginData result = externalDevCode.DoWhatYouNeed(commandPayload);

            return result;
        }
    }
}