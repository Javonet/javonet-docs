//<Test_Resource_All>
public class TestClass {

    public int publicValue;
    private int privateValue;
    public static int staticValue = 3;

    public TestClass() {
        this.publicValue = 1;
        this.privateValue = 2;
    }

    public TestClass(int publicValue, int privateValue) {
        this.publicValue = publicValue;
        this.privateValue = privateValue;
    }

    public static int multiplyByTwo(int a) {
        return 2 * a;
    }

    public int multiplyTwoNumbers(int a, int b) {
        return a * b;
    }
}
//</Test_Resource_All>