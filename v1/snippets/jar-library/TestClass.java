public class TestClass {
    public TestClass() {}
    public static String SayHello(String name) {
        return "Hello " + name;
    }
    public static int MethodExpectingPrimitiveInt(int arg) {
        return arg*2;
    }
    public static int MethodExpectingClassInteger(Integer arg) {
        return arg*2;
    }
}
