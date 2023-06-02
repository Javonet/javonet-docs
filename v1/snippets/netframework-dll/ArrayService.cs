namespace TestNamespace
{
	class ArrayService
	{

		public int[] GetIntArray()
		{
			return new int[] { 1, 2, 3, 4 };
		}

		public void UseIntArray(int[] intArray)
		{
			System.Console.WriteLine("[.NET] Contents of primitive-type array:");

			foreach (int intVal in intArray)
			{
				System.Console.WriteLine("{0} ", intVal);
			}
		}

		public int[][] GetArrayOfIntArrays()
		{
			int[][] arrayOfIntArrays = new int[2][];

			arrayOfIntArrays[0] = new int[4] { 1, 2, 3, 4 };
			arrayOfIntArrays[1] = new int[4] { 11, 22, 33, 44 };

			return arrayOfIntArrays;
		}

		public CustomObject[] GetCustomObjectArray()
		{
			return new CustomObject[]{ new CustomObject("A",1),
						new CustomObject("B", 2),
						new CustomObject("C", 3)};
		}

		public void UseCustomObjectArray(CustomObject[] cuArray)
		{
			System.Console.WriteLine("[.NET] Contents of the reference-type array:");

			foreach (CustomObject cu in cuArray)
			{
				System.Console.WriteLine("{0}[{1}] ", cu.Name, cu.Value);
			}
		}

		public CustomObject[][] GetArrayOfCustomObjectArrays()
		{
			CustomObject[][] arrayOfCustomObjectArrays = new CustomObject[2][];

			arrayOfCustomObjectArrays[0] = new CustomObject[]{
					new CustomObject("A1",1),
					new CustomObject("A2", 2),
					new CustomObject("A3", 3)};

			arrayOfCustomObjectArrays[1] = new CustomObject[]{
					new CustomObject("B1",1),
					new CustomObject("B2", 2),
					new CustomObject("B3", 3)};

			return arrayOfCustomObjectArrays;
		}
	}

	class CustomObject
	{

		public string Name { get; set; }
		public int Value { get; set; }

		public CustomObject(string name, int value)
		{
			this.Name = name;
			this.Value = value;
		}
	}
}