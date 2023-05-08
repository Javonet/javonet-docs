namespace TestClass {
	public class TestClass {
		// <All>
		public int PublicValue { get; set; }
		private int PrivateValue;
		public static int StaticValue = 3;

		public TestClass() {
			PublicValue = 1;
			PrivateValue = 2;
		}

		public TestClass(int publicValue, int privateValue) {
			PublicValue = publicValue;
			PrivateValue = privateValue;
		}

		public static int MultiplyByTwo(int a) {
			return 2 * a;
		}

		public int MultiplyTwoNumbers(int first, int second) {
			return first * second;
		}
	}
	// </All>
}
