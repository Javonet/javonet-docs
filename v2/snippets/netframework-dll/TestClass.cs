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

		public int MultiplyTwoNumbers(int first, int second)
		{
			return first * second;
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
		public static int DivideBy(int a, int b)
		{
			return DivideBySecond(a, b);
		}

		public static int DivideBySecond(int a, int b)
		{
			return DivideByThird(a, b);
		}

		public static int DivideByThird(int a, int b)
		{
			return a / b;
		}
		// </Exceptions>

		// <Empty>
		// minimal class
		// </Empty>
	}
}
