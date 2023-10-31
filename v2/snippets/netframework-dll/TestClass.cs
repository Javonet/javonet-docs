namespace TestClass
{
    public class TestClass
    {
        public TestClass() { }

        // <Fields>
        public int PublicValue { get; set; }
        private int PrivateValue { get; }
        public static int StaticValue = 3;

        public TestClass(int publicValue, int privateValue)
        {
            PublicValue = publicValue;
            PrivateValue = privateValue;
        }
        // </Fields>

        // <Methods>
        public static int MultiplyByTwo(int a)
        {
            return 2 * a;
        }

        public int MultiplyTwoNumbers(int a, int b)
        {
            return a * b;
        }
        // </Methods>

        // <Arrays>
        public string[] Get1DArray()
        {
            return new string[] { "one", "two", "three", "four", "five" };
        }

        public double AddArrayElementsAndMultiply(double[] myArray, double myValue)
        {
            double sum = 0;
            foreach (double element in myArray)
            {
                sum += element;
            }

            return sum * myValue;
        }
        // </Arrays>

        // <Exceptions>
        public static int DivideBy(int x, int y)
        {
            return DivideBySecond(x, y);
        }

        public static int DivideBySecond(int x, int y)
        {
            return DivideByThird(x, y);
        }

        public static int DivideByThird(int x, int y)
        {
            return x / y;
        }
        // </Exceptions>

        // <Cast>
        public static string CastSampleMethod(System.UInt32 value)
        {
            return "CastSampleMethod with System.UInt32 called";
        }

        public static string CastSampleMethod(System.Single value)
        {
            return "CastSampleMethod with System.Single called";
        }

        public static string CastSampleMethod(System.Double[] value)
        {
            return "CastSampleMethod with System.Double[] called";
        }

        public static string CastSampleMethod(MyVehicles.Vehicle v)
        {
            return "CastSampleMethod with Vehicle called";
        }

        public static string CastSampleMethod(MyVehicles.Car c)
        {
            return "CastSampleMethod with Car called";
        }

        public static string CastSampleMethod(MyVehicles.Boat b)
        {
            return "CastSampleMethod with Boat called";
        }
        // </Cast>

        // <Generics>
        public static string GenericSampleStaticMethod<T>(T x, T y)
        {
            return x + " and " + y;
        }

        public string GenericSampleMethod<T>(T x, T y)
        {
            return x + " or " + y;
        }

        public K GenericSampleMethodWithTwoTypes<T, K>(T x)
        {
            return default(K);
        }

        public string GetValueFromGenericClass<T>(GenericTestClass<T> obj)
        {
            return obj.value.ToString();
        }
        // </Generics>


        // <Empty>
        // empty
        // </Empty>
    }
}
