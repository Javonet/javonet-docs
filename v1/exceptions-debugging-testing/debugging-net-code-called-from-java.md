:::options
:title: Debugging .NET code called from Java
:description: Debugging .NET code called from Java
:related_articles: exceptions-debugging-testing/handling-activation-issues, exceptions-debugging-testing/handling-exceptions, exceptions-debugging-testing/debugging-javonet-enabled-application
:::

# Debugging .NET code called from Java  
  
Both for .NET and Java, one of the most important features provided by an IDE is the ability to track code execution at runtime. Either when looking for bugs in the dynamic portion of code or verifying correctness of a complex algorithm - debugging brings unquestionable improvement into development process.  
  
In case of the Javonet users dealing with the debugging task, its importance doubles as relating to both supported domains: .NET and Java. Let's see how easily this can be achieved and applied against any managed assembly.  
  
## Workspace  
  
For the purpose of this example, I'll be using the following .NET class representing a simple Person entity, having two properties Firstname and Lastname, and being able to return a DisplayName, being a trivial concatenation of the former:

:::code source="v1/snippets/netframework-dll/Person.cs":::

The Java code that will interoperate with our Person class is as follows:  
  
:::code source="v1/snippets/java/netframework-dll/Main.java":::

## Debugging Procedure  
  
Since debugging happens at runtime, we'll start by launching our Java code. As already mentioned, it's important to activate Javonet before attempting to place any breakpoint on Java side of our solution, as this
will start CLR within our process. Let's put a breakpoint right after the activate method, as presented below.

![debugging-net-code-called-from-java-1](/v1/images/debugging-net-code-called-from-java-1.png?raw=true "debugging-net-code-called-from-java-1")  
  
Now let's switch to our Visual Studio and attach a debugger to the newly started Java process with CLR. In order to do that, go to **Debug > Attach to Process**, and select appropriate java.exe or javaw.exe process. Notice that its Type value should indicate that it's hosting managed code using .NET version matching the one we've specified in Javonet activate method using JavonetFramework argument.  
  
![debugging-net-code-called-from-java-2](/v1/images/debugging-net-code-called-from-java-2.png?raw=true "debugging-net-code-called-from-java-2")  

We're almost ready to start debugging. Let's put a breakpoint in the body of Person's class DisplayName method. Notice that the breakpoint circle symbol is hollow inside, since the debugging symbols have not been loaded into CLR yet.  
  
![debugging-net-code-called-from-java-3](/v1/images/debugging-net-code-called-from-java-3.png?raw=true "debugging-net-code-called-from-java-3")  
  
On Java side, let's move one step forward by putting a breakpoint on line with NObject person...  
Calling addReference method loads our DLL library which should result in Person class becoming available for debugging in Visual Studio.  
  
![debugging-net-code-called-from-java-4](/v1/images/debugging-net-code-called-from-java-4.png?raw=true "debugging-net-code-called-from-java-4")  
  
As you can see, the circle symbol is now completely filled. At this point our breakpoint will get hit once the DisplayName method is invoked on Java side.  
  
![debugging-net-code-called-from-java-5](/v1/images/debugging-net-code-called-from-java-5.png?raw=true "debugging-net-code-called-from-java-5")  
  
In Java IDE, let's proceed with code execution until line with String displayName is reached. Passing this point will result in hitting breakpoint in Visual Studio.  
  
![debugging-net-code-called-from-java-6](/v1/images/debugging-net-code-called-from-java-6.png?raw=true "debugging-net-code-called-from-java-6")  
  
As you can see, we can now use .NET debugger for all our intended activities, like variables' inspection, runtime values modification etc.  
  
![debugging-net-code-called-from-java-7](/v1/images/debugging-net-code-called-from-java-7.png?raw=true "debugging-net-code-called-from-java-7")  
    
Once our work with debugging Person class is done and normal code execution is resumed in Visual Studdio debugger, it'll be transferred back to Java.  
  
![debugging-net-code-called-from-java-8](/v1/images/debugging-net-code-called-from-java-8.png?raw=true "debugging-net-code-called-from-java-8") 

As the program finishes, we'll get a returned display name value of our Person object instance.  

![debugging-net-code-called-from-java-9](/v1/images/debugging-net-code-called-from-java-9.png?raw=true "debugging-net-code-called-from-java-9") 
  