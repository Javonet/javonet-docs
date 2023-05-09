public class TestClass {
    public TestClass() {
    }

    // <Fields>
    public int publicValue;
    private int privateValue;
    public static int staticValue = 3;

    public TestClass(int publicValue, int privateValue) {
        this.publicValue = publicValue;
        this.privateValue = privateValue;
    }
    // </Fields>

    // <Methods>
    public static int multiplyByTwo(int a) {
        return 2 * a;
    }

    public int multiplyTwoNumbers(int a, int b) {
        return a * b;
    }
    // </Methods>

    // <Arrays>
    public String[] get1DArray() {
        return new String[]{"one", "two", "three", "four", "five"};
    }

    public double addArrayElementsAndMultiply(Double[] myArray, double myValue) {
        Double sum = 0.0;
        for (Double value : myArray) {
            sum += value;
        }
        return sum * myValue;
    }
    // </Arrays>

    // <Exceptions>
    public static int divideBy(int a, int b) {
        return divideBySecond(a, b);
    }

    public static int divideBySecond(int a, int b) {
        return divideByThird(a, b);
    }

    public static int divideByThird(int a, int b) {
        return a / b;
    }
    // </Expections>

    // <Empty>
    // empty
    // </Empty>
}
