using System.Collections.Generic;

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

		public static List<Fruit> Fruits = new List<Fruit>();

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

        // <Empty>
        // empty
        // </Empty>
    }
}
