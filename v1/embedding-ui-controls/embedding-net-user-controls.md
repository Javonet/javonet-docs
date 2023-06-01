:::options
:title: Embedding .NET User Controls in Java AWT, Swing or JavaFX
:description: Introduction to Using .NET Back-end and UI Components in Java
:related_articles: embedding-ui-controls/using-backend-and-ui-components
:::

# Embedding .NET User Controls in Java AWT, Swing or JavaFX  
  
With Javonet you can very easily embed any .NET WinForms or WPF user control in Java. Embedded control can be placed within any Java layout component like Panels, Borders, Frames etc… in order to present the control side by side within the Java desktop application.  
  
You can easily fully interact with all the features of .NET UI control invoking any methods, retrieving results or subscribing the events and callbacks which will be triggered when user interacts with .NET control.  
  
The control will automatically move and scale with Java window. The user experience is completely seamless and transparent for end-user. Due to the fact that .NET controls are rendered and executed by .NET framework the performance of the control is native like using regular .NET application.  
  
You can see the sample project in action on [this video](https://www.youtube.com/watch?v=L1GY5d8ZbLY)  
  
## Examples  
  
To embed user control in Java UI you need to wrap the control in NControlContainer class and add to your layout:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_EmbedNetUserControl1
:display: calling
:::

In order to subscribe any event expose by the control just reference to the control instance NObject class:

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_EmbedNetUserControl2
:display: calling
:::

Starting 1.4hf34 we have exposed updated revalidate method which allows you to refresh the control layout after programmatic changes of layout or control size

:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: StandardLibrary_EmbedNetUserControl3
:display: calling
:::