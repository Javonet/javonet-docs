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