namespace TestClass
{
	public class TestClass
	{
		public TestClass() { }

		public static string SayHello(string name)
		{
			return "Hello " + name;
		}

		public T MyGenericMethod<T>(T arg1)
		{
			return arg1;
		}
		public K MyGenericMethodWithTwoTypes<T, K>(T arg1)
		{
			return default(K);
		}

	}
}
