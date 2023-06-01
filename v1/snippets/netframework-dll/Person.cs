namespace TestNamespace
{
	public class Person
	{
		public string Firstname { get; set; }
		public string Lastname { get; set; }

		public string DisplayName()
		{
			return Firstname + " " + Lastname;
		}

	}
}