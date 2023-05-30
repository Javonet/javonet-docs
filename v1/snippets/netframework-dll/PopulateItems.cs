namespace TestNamespace
{
	class Item
	{
		public string ItemName { get; set; }
	}
	class PopulateItems
	{
		public void Populate(out Item[] items)
		{
			items = new Item[5];
			for (int i = 0; i < 5; i++)
			{
				items[i] = new Item();
				items[i].ItemName = "Item " + i.ToString();
			}
		}
	}
}

