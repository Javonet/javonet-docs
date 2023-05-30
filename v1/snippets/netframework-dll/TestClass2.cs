using System;

namespace TestNamespace
{
	public class TestClass2
	{
		public string MethodA(String arg)
		{
			return "Method with String argument called";
		}
		public string MethodA(Object arg)
		{
			return "Method with Object argument called";
		}
		public string MethodA(int? arg)
		{
			return "Method with nullable int argument called";
		}
	}
}
