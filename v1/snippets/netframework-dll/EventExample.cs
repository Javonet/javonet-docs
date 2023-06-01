namespace TestNamespace
{
	public delegate void EventExampleHandler(object sender, string e);

	public class EventExample
	{
		public event EventExampleHandler SampleEvent;

		public void EventInvoke()
		{
			if (SampleEvent != null)
				SampleEvent(this, "Called from .NET!");
		}
	}
}
