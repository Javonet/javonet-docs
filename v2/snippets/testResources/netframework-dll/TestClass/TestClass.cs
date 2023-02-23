namespace TestClass {
	public class TestClass {
		public int PublicValue { get; set; }
		private int PrivateValue { get; }
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

		public string[] Get1DArray() {
			return new string[] { "one", "two", "three", "four", "five" };
		}

		public double[] AddNumberTo1DArray(double[] myArray, double myDouble) {
			for (int i = 0; i < myArray.Length; i++) {
				myArray[i] += myDouble;
			}
			return myArray;
		}

		public int[,,] Produce3DArray(int MyInt) {
			int[,,] responseArray = new int[2, 2, 2]
				{
					{
						{0 + MyInt, 1 + MyInt},
						{2 + MyInt, 3 + MyInt},
					},
					{
						{4 + MyInt, 5 + MyInt},
						{6 + MyInt, 7 + MyInt}
					}
				};

			return responseArray;
		}

		public int[][] ProduceJaggedArray(int[] myArray) {
			int[][] responseArray = new int[3][] { myArray, myArray, myArray };
			return responseArray;
		}
	}
}
