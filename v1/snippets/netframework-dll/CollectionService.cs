using System;
using System.Collections.Generic;

namespace TestNamespace
{
	class CollectionService
	{
		public IList<string> GetList()
		{
			return new List<string> { "strings", "in", "list", "from", ".NET" };
		}

		public void UseList(List<string> list)
		{
			Console.WriteLine("[.NET] List contents:");

			foreach (string element in list)
			{
				Console.Write("{0} ", element);
			}
		}

		public HashSet<string> GetSet()
		{
			return new HashSet<string> { "strings", "in", "set", "from", ".NET" };
		}

		public void UseSet(ISet<string> set)
		{
			Console.WriteLine("[.NET] Set contents:");

			foreach (string element in set)
			{
				Console.Write("{0} ", element);
			}
		}

		public IDictionary<string, string> GetDictionary()
		{
			return new Dictionary<string, string>()
		  {
			{"key1","value1"},
			{"key2","value2"},
			{"key3","value3"}
		  };
		}

		public void UseDictionary(IDictionary<string, string> dictionary)
		{
			Console.WriteLine("[.NET] Dictionary contents:");

			foreach (string key in dictionary.Keys)
			{
				Console.Write("'{0}' = '{1}';  ", key, dictionary[key]);
			}
		}
	}
}