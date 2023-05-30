namespace TestClass
{
	public class TestClass
	{
		public TestClass() { }
		public static int MyStaticField { get; set; }
		public int MyInstanceField { get; set; }

		public static string SayHello(string name)
		{
			return "Hello " + name;
		}

		public int MultiplyByTwo(int arg)
		{
			return arg * 2;
		}

		public T MyGenericMethod<T>(T arg1)
		{
			return arg1;
		}
		public K MyGenericMethodWithTwoTypes<T, K>(T arg1)
		{
			return default(K);
		}

		public void MethodWithRefArg(ref int arg)
		{
			arg = arg + 44;
		}
	}
}
