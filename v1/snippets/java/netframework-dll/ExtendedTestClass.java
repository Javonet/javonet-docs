// <All>
import com.javonet.JavonetException;
import com.javonet.api.NObject;

public class ExtendedTestClass extends NObject {

    public ExtendedTestClass() throws JavonetException
    {
        super("TestClass.TestClass");
    }

    public int MultiplyByTwo(int arg) throws JavonetException
    {
        return this.invoke("MultiplyByTwo", arg);
    }
}
// </All>