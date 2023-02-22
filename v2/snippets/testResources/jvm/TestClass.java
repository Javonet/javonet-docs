package javonet.test.resources.jvm;

public class JavaTestClass {
    public JavaTestClass() {
        this.publicValue = 1;
        this.privateValue = 2;
    }

    public JavaTestClass(int publicValue, int privateValue) {
        this.publicValue = publicValue;
        this.privateValue = privateValue;
    }

    public static int multiplyByTwo(int a) {
        return 2*a;
    }

    public int publicValue;
    private int privateValue;
    public static int staticValue = 3;


    public int multiplyTwoNumbers(int a, int b) {return a*b;}
    public int getPublicValue() {
        return publicValue;
    }

    public void setPublicValue(int publicValue) {
        this.publicValue = publicValue;
    }

    public int getPrivateValue() {
        return privateValue;
    }

    public void setPrivateValue(int privateValue) {
        this.privateValue = privateValue;
    }
}
