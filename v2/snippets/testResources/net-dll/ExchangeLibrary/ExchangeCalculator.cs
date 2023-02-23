using System;

namespace ExchangeLibrary
{
	public class ExchangeCalculator
	{
		public ExchangeCalculator() { }
		public float GetExchangeRate(string currency)
		{
			switch(currency)
			{
				case "PLNEUR":
					return 4.6f;
				case "PLNUSD":
					return 4.0f;
				default:
					throw new ArgumentException("No such currency");
			}
		}
	}
}
