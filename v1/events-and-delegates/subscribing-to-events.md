:::options
:title: Subscribing to events
:description: Subscribing to events
:::

# Subscribing to events

Subscribe to any .NET event with Javonet. Event subscription works the same way as listening Java events. The performance of event subscription is extremely high and allows you to interact with .NET code like it was native Java code. When the event occurs, your Java listener callback is called in a separate thread.  

The simplest way to subscribe an event is to use an anonymous Java class.  
  
To create a .NET button and listen for a "Click" event::

:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_SubscribeToEvent
:display: calling
:::

The anonymous class should implement special **INEventListener** interface. Alternatively you can write a separate class as the event listener by extending **NEventListener** and overriding the **eventOccurred** method, or by implementing the ((INEventListener)) interface.  

:::code
:called_source: v1/snippets/`{calling_technology}`/`{called_technology}`/MyEventListener.`{calling_ext}`
:display: called
:::

Usage of your listener class:


:::code
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_SubscribeToEvent2
:display: calling
:::
