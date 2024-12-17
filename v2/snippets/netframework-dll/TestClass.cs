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

        public string[,] Get2DArray()
        {
            return new string[,] { { "S00", "S01" }, { "S10", "S11" } };
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
        // </Generics>

        // <Enums>
        public enum Fruit
        {
            Apple,
            Banana,
            Orange,
            Mango
        }

        public static System.Collections.Generic.List<Fruit> Fruits = new System.Collections.Generic.List<Fruit>();

        public static string AddFruitsToList(Fruit[] fruits)
        {
            Fruits.AddRange(fruits);
            return string.Format("{0} fruits on the list", Fruits.Count);
        }
        // </Enums>

        // <Refs>
        public static void RefSampleMethod(ref int x)
        {
            x = x * 2;
        }

        public static void RefSampleMethod2(ref int x, ref double y, ref string z)
        {
            x = x * 2;
            y = y / 2;
            z = "Done";
        }
        // </Refs>

        // <Outs>
        public static void OutSampleMethod(out string outStr)
        {
            outStr = "String from OutSampleMethod";
        }
        // </Outs>

        // <PassingNull>
        public static string PassNull(object arg)
        {
            if (arg == null)
            {
                return "Method called with null";
            }
            else
            {
                return "Method not called with null";
            }
        }

        public static string PassNull2(int arg1, object arg2)
        {
            if (arg2 == null)
            {
                return "Method2 called with null";
            }
            else
            {
                return "Method2 not called with null";
            }
        }
        // </PassingNull>

        // <ReturningNull>
        public static object ReturnNull()
        {
            return null;
        }
        // </ReturningNull>


        //<Nullable>
        public static string MethodWithNullables(int? arg1, double? arg2)
        {
            return "MethodWithNullables called";
        }
        //</Nullable>

        // <OverloadingMethodsWithNulls>
        public static string MethodWithNullArgument(string arg)
        {
            return "MethodWithNullArgument called with string";
        }

        public static string MethodWithNullArgument(TestClass arg)
        {
            return "MethodWithNullArgument called with TestClass";
        }
        // </OverloadingMethodsWithNulls>

        // <Multithreading>
        private static System.Collections.Concurrent.ConcurrentDictionary<int, int> _cache = new System.Collections.Concurrent.ConcurrentDictionary<int, int>();
        public string GetCache()
        {
            // write all values in cache to a string
            string result = "";
            foreach (var item in _cache)
            {
                result += item.Key + " " + item.Value + " ";
            }
            return result;
        }

        public int AddTwoNumbers(int x, int y)
        {
            System.Console.WriteLine("Computing result in thread: " + System.Threading.Thread.CurrentThread.ManagedThreadId);
            System.Threading.Thread.Sleep(1000);
            var result = x + y;
            System.Console.WriteLine("Saving result in thread: " + System.Threading.Thread.CurrentThread.ManagedThreadId);
            System.Threading.Thread.Sleep(50);
            _cache[System.Threading.Thread.CurrentThread.ManagedThreadId] = result;
            System.Console.WriteLine("Returning result in thread: " + System.Threading.Thread.CurrentThread.ManagedThreadId);
            return _cache[System.Threading.Thread.CurrentThread.ManagedThreadId];
        }
        // </Multithreading>

        // <AsyncMethods>
        public async System.Threading.Tasks.Task<string> CreateFileWithContent(string fileName, string input)
        {
            await System.Threading.Tasks.Task.Delay(2000); // Simulate async operation
            using (System.IO.StreamWriter outputFile = new System.IO.StreamWriter(fileName))
            {
                await outputFile.WriteAsync(input);
            }

            return "Input processed";
        }
        // </AsyncMethods>


        // <Delegates>        
        public int UseYourFunc(System.Func<int, int, int> yourFunc, int x, int y)
        {
            return yourFunc(x, y);
        }
        // </Delegates>
        // <Empty>
        // empty
        // </Empty>
    }
}
