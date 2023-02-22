namespace ClrTestClass
{
	public class ClrTestClass
	{
		public int PublicValue { get; set; }
		private int PrivateValue { get; }
		public static int StaticValue = 3;

		public ClrTestClass()
		{
			PublicValue = 1;
			PrivateValue = 2;
		}

		public ClrTestClass(int publicValue, int privateValue)
		{
			PublicValue = publicValue;
			PrivateValue = privateValue;
		}

		public static int MultiplyByTwo(int a)
		{
			return 2 * a;
		}

		public int MultiplyTwoNumbers(int first, int second)
		{
			return first*second;
		}
	}
}
