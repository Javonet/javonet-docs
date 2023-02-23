public class TestClass {
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

    public int publicValue;
    private int privateValue;
    public static int staticValue = 3;


    public int multiplyTwoNumbers(int a, int b) {
        return a * b;
    }

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

    public String[] get1DArray()
    {
        return new String[] { "one", "two", "three", "four", "five" };
    }

    public Double[] addNumberTo1DArray(Double[] myArray, double myDouble)
    {
        for (int i = 0; i < myArray.length; i++)
        {
            myArray[i] += myDouble;
        }
        return myArray;
    }

    public int[][][] produce3DArray(int MyInt)
    {
        int[][][] responseArray =
        {
            {
                {0 + MyInt, 1 + MyInt},
                {2 + MyInt, 3 + MyInt},
            },
            {
                {4 + MyInt, 5 + MyInt},
                {6 + MyInt, 7 + MyInt}
            }
        };

        return responseArray;
    }

    public int[][] produceJaggedArray(int[] myArray)
    {
        int[][] responseArray = new int[][] { myArray, myArray, myArray };
        return responseArray;
    }
}
