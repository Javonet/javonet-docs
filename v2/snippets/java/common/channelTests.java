package common;

import com.javonet.sdk.*;
import com.javonet.utils.connectiondata.TcpConnectionData;
import com.javonet.utils.connectiondata.WsConnectionData;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import utils.ActivationCredentials;

import java.net.UnknownHostException;
import java.nio.file.Paths;


public class channelTests {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString()
            + "/testResources/configuration-file";

    @Test
    @Tag("integration")
    public void Test_Channel_InMemory_Success() {
        // <InMemoryChannel>
        // use Activate only once in your app
        Javonet.activate(ActivationCredentials.yourLicenseKey);

        RuntimeFactory communicationChannel = Javonet.inMemory();
        // use communicationChannel to create runtimes to interact with
        // </InMemoryChannel>
        Assertions.assertNotNull(communicationChannel);
    }

    @Test
    @Tag("integration")
    public void Test_Channel_Tcp_Success() throws UnknownHostException {
        // <TcpChannel>
        // use Activate only once in your app
        Javonet.activate(ActivationCredentials.yourLicenseKey);

        TcpConnectionData connectionData = new TcpConnectionData("127.0.0.1", 8083);
        RuntimeFactory communicationChannel = Javonet.tcp(connectionData);
        // use communicationChannel to create runtimes to interact with
        // </TcpChannel>
        Assertions.assertNotNull(communicationChannel);
    }

    @Test
    @Tag("integration")
    public void Test_Channel_WebSocket_Success() throws UnknownHostException {
        // <WebSocketChannel>
        // use Activate only once in your app
        Javonet.activate(ActivationCredentials.yourLicenseKey);

        WsConnectionData connectionData = new WsConnectionData("ws://127.0.0.1:80/ws");
        RuntimeFactory communicationChanel = Javonet.webSocket(connectionData);
        // use communicationChannel to create runtimes to interact with
        // </WebSocketChannel>
        Assertions.assertNotNull(communicationChannel);
    }

    @Test
    @Tag("integration")
    public void Test_Channel_WithConfigurationFile_Success() {
        // <WithConfigurationFile>
        // use Activate only once in your app
        Javonet.activate(ActivationCredentials.yourLicenseKey);

        // set up variables
        String configFilePath = resourcesDirectory + "/channel-tests-config.json";
        ConfigRuntimeFactory communicationChannel = Javonet.withConfig(configFilePath);
        // use communicationChannel to create runtimes to interact with
        // </WithConfigurationFile>
        Assertions.assertNotNull(communicationChannel);
    }
}
