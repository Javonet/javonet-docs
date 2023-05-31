:::options
:title: Debug .NET code called from Java
:description: Debug .NET code called from Java
:related_articles: exceptions-debugging-testing/handling-activation-issues, exceptions-debugging-testing/handling-exceptions, exceptions-debugging-testing/debugging-javonet-enabled-application
:::

# Debug .NET code called from Java  
  
Both for .NET and Java, one of the most important features provided by an IDE is the ability to track code execution at runtime. Either when looking for bugs in the dynamic portion of code or verifying correctness of a complex algorithm - debugging brings unquestionable improvement into development process.  
  
In case of the Javonet users dealing with the debugging task, its importance doubles as relating to both supported domains: .NET and Java. Let's see how easily this can be achieved and applied against any managed assembly.  
  
## Workspace  
  
For the purpose of this example, I'll be using the following .NET class representing a simple Person entity, having two properties Firstname and Lastname, and being able to return a DisplayName, being a trivial concatenation of the former:

:::code source="v1/snippets/java/netframework-dll/Main.java":::
