:::options
:title: Debugging .NET code called from Java
:description: Debugging .NET code called from Java
:related_articles: exceptions-debugging-testing/handling-activation-issues, exceptions-debugging-testing/handling-exceptions, exceptions-debugging-testing/debugging-javonet-enabled-application
:keywords: Javonet, Debugging, .NET, Java, `{called_technology}`, `{calling_name}`, IDE Debugger, Eclipse, Visual Studio, JVM, CLR, Netcore, Windows, Linux, MacOS, Breakpoints, Runtime Debugging
:::

# Debugging .NET code called from Java  
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/exceptions/exceptions">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
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
    
Once our work with debugging Person class is done and normal code execution is resumed in Visual Studio debugger, it'll be transferred back to Java.  
  
![debugging-net-code-called-from-java-8](/v1/images/debugging-net-code-called-from-java-8.png?raw=true "debugging-net-code-called-from-java-8") 

Next, we'll get a returned display name value of our Person object instance.  

![debugging-net-code-called-from-java-9](/v1/images/debugging-net-code-called-from-java-9.png?raw=true "debugging-net-code-called-from-java-9") 

As the program finishes, both debuggers will stop execution.  
  
## Debugging Without .NET Source Project  
  
Presented debugging method is available also in situations when we do not have access to library source code, provided that the related debugging symbols .pdb file for analysed program or library is available on the Javonet classpath at runtime. We would also need to know full namespace, class name and target method, where to put a breakpoint.  
  
Rerun Java code from Java IDE, breaking its execution at line with Javonet.addReference... to launch a new Java CLR-enabled process. In Visual Studio make sure you've closed solution for our previous example. As done before, attach debugger to respective managed java.exe or javaw.exe process.  
  
Our next step would be to insert new breakpoint. As we do not have the source code available, we'll need to specify its location manually. In order to do that we can go either to the breakpoint window **New > Break at function**, go to **Debug > New Breakpoint > Break** at function or use the Ctrl + B shortcut. Any of these paths will result in opening new window where we're asked to put the location of our breakpoint by specifying fully qualified method name.  
  
![debugging-net-code-called-from-java-10](/v1/images/debugging-net-code-called-from-java-10.png?raw=true "debugging-net-code-called-from-java-10")  
   
Once we are happy with our input, Visual Studio might notify us about not being able to find the specified location, which is understandable due to lack of source code. After accepting this notification we should be presented with a breakpoint entry similar to the one in the following picture. The circle will be hollow again, since we've not loaded our .NET library via Javonet API yet.  
  
![debugging-net-code-called-from-java-11](/v1/images/debugging-net-code-called-from-java-11.png?raw=true "debugging-net-code-called-from-java-11")  
  
If we proceed with Java code execution, the breakpoint symbol will again get filled, similarly to how it behaved in previous example. Also, the breakpoint location now contains fully qualified signature of the targeted method.  
  
![debugging-net-code-called-from-java-12](/v1/images/debugging-net-code-called-from-java-12.png?raw=true "debugging-net-code-called-from-java-12")  
  
At this point, we are ready to debug our .NET application, therefore let's proceed with Java code execution. Running line with String displayName = ... will hit our specified breakpoint, returning control to Visual Studio, where we'll be presented with a source code generated based on the supplied debugging symbols file.
  
![debugging-net-code-called-from-java-13](/v1/images/debugging-net-code-called-from-java-13.png?raw=true "debugging-net-code-called-from-java-13") 

## Summary  
  
In this article we've learnt how to properly attach Visual Studio debugger to Java process hosting CLR managed code run by Javonet. The approach has been presented for two scenarios, distinguished by the availability of source code, proving easy access to all of the features offered by Visual Studio debugger that can be used during development of Java application using .NET libraries, drivers or SDKs with Javonet.
