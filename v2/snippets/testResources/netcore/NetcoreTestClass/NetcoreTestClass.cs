namespace NetcoreTestClass
{
    public class NetcoreTestClass
    {
		public int PublicValue { get; set; }
		private int PrivateValue { get; set; }
		public static int StaticValue = 3;

		public NetcoreTestClass()
        {
            PublicValue = 1;
            PrivateValue = 2;
        }

        public NetcoreTestClass(int publicValue, int privateValue)
        {
            PublicValue = publicValue;
            PrivateValue = privateValue;
        }

        public static int MultiplyByTwo(int a)
        {
            return 2 * a;
        }

		public int MultiplyTwoNumbers(int a, int b)
		{
			return a*b;
		}
	}
}
