public class TestClass {
    public TestClass() {
    }

    public static int MyStaticField;

    public int MyInstanceField;

    public static String SayHello(String name) {
        return "Hello " + name;
    }

    public static int MethodExpectingPrimitiveInt(int arg) {
        return arg * 2;
    }

    public static int MethodExpectingClassInteger(Integer arg) {
        return arg * 2;
    }

    public int MultiplyByTwo(Integer arg) {
        return arg * 2;
    }

    public <T> T MyGenericMethod(T arg1)
    {
        return arg1;
    }
}
