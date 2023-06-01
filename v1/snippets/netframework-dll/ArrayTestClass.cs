using System;

namespace TestNamespace
{
	public class MyItem
	{
		public MyItem(string name) { ItemName = name; }
		public string ItemName { get; set; }
	}
	public class ArrayTestClass
	{
		public string[] GetItems()
		{
			return new string[] { "item1", "item2", "item3" };
		}
		public MyItem[] GetRefItems()
		{
			return new MyItem[] { new MyItem("Item1"), new MyItem("Item2"), new MyItem("Item3") };
		}
		public void DisplayArray(string[] items)
		{
			Console.Out.WriteLine(".NET: Displaying value-typed array");
			foreach (var item in items)
				Console.Out.WriteLine(item);
		}
		public void DisplayArray(MyItem[] items)
		{
			Console.Out.WriteLine(".NET: Displaying ref-typed array");
			foreach (var item in items)
				Console.Out.WriteLine(item.ItemName);
		}
	}
}
