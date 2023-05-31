:::options
:title: Debugging Javonet enabled application
:description: Debugging Javonet enabled application
:related_articles: exceptions-debugging-testing/handling-activation-issues, exceptions-debugging-testing/handling-exceptions, exceptions-debugging-testing/debug-net-code-called-from-java
:::

# Debugging Javonet enabled application  
  
Using Javonet both the Java and .NET code could be debugged and measured in very easy and convenient way. First you must understand the concept that Javonet loads the .NET process within the java process. Weather your application is hosted as standalone Java application, applet or web application both .NET and Java worlds will be combined either in javaw.exe, jUnit test runner process, Apache, jBoss or other host process.
  
Of course the Java part could be debugged with attached IDE debugger like Eclipse. To debug .NET code all you have to do is attach .NET debugger to your Java process. If your Java process lives very shortly you can set a break point just after the call to Javonet activate method and when your Java debugger hits that point then attach your .NET debugger. For example you can use Visual Studio environment by opening your .NET code project and choosing menu "Debug > Attach to process" and selecting the Java process to start debugging.  
  
Using this approach both debuggers will allow you to go step by step through Java or .NET part of your code. The same solution might be applied for performance or memory measurements using any .NET and Java profiler of your choice.  
  
This possibility gives you and your team very effective way of tracing the issues in your code and improves the quality of your solution.  
  