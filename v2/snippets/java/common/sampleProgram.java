// <WholeSnippet>
// <Import>
import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.internal.RuntimeContext;
import com.javonet.sdk.java.Javonet;
// </Import>

public class SampleProgram {

    public static void main(String[] args) {
		// <Activation>
        Javonet.activate("your-license-key");
		// </Activation>

		// <RuntimeContextCreation>
        RuntimeContext pythonRuntime = Javonet.inMemory().python();
		// </RuntimeContextCreation>

		// <GetType>
        InvocationContext pythonType = pythonRuntime.getType("math").execute();
        // </GetType>

		// <GetStaticField>
        InvocationContext response = pythonType.getStaticField("pi").execute();
		// </GetStaticField>

		// <GetValue>
        float result = (float) response.getValue();
        System.out.println(result);
		// </GetValue>
    }
}
// </WholeSnippet>