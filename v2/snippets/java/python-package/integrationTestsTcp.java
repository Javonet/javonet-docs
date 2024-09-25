package pythonpackage;

import com.javonet.sdk.*;
import com.javonet.utils.connectiondata.TcpConnectionData;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import utils.ActivationCredentials;

import java.net.UnknownHostException;
import java.nio.file.Paths;

public class integrationTestsTcp {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/python-package";

    @BeforeAll
    public static void initialization() {
        int result = Javonet.activate(ActivationCredentials.yourLicenseKey);
        Assertions.assertEquals(0, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_Tcp_InvokeStaticMethod_10000times() {
        // <TestResources_Tcp_InvokeStaticMethod_10000times>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        TcpConnectionData tcpConnectionData = null;
        try {
            tcpConnectionData = new TcpConnectionData("127.0.0.1", 8080);
        } catch (UnknownHostException e) {
            throw new RuntimeException(e);
        }
        RuntimeContext calledRuntime = Javonet.tcp(tcpConnectionData).python();
        //RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
        InvocationContext instance = calledRuntimeType.createInstance(11,22);
        long start = System.currentTimeMillis();

        // invoke type's method
        for (int i = 0; i < 1_000_000; i++) {
            InvocationContext response = calledRuntimeType.invokeStaticMethod("multiply_by_two", i).execute();
            Assertions.assertEquals(2*i, (int) response.getValue());

            InvocationContext response2 = instance.invokeInstanceMethod("multiply_two_numbers", 3, i).execute();
            Assertions.assertEquals(3*i, (int) response2.getValue());
        }
        long stop = System.currentTimeMillis();
        double time = (stop - start) / 1000.0;
        System.out.println("Javonet performance test: " + time + " sec.");
        // </TestResources_Tcp_InvokeStaticMethod_10000times>
    }
}