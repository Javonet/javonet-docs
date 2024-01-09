:::options
:title: Batching GC with DelayGcContext
:description: Batching GC with DelayGcContext
:related_articles: disposing-and-garbage-collection/disposing-of-objects
:keywords: Javonet, `{called_technology}` Batching GC, `{calling_technology}`, DelayGcContext, Garbage Collection, Memory Management, Performance Optimization, Legacy Javonet 1.5, Static Methods, Method Invocation, Reflection, Value-Type Conversion, Reference-Type Conversion
:::

# Batching GC with DelayGcContext 
  <div style="padding: 24px; background: #F0F5FF; border-radius: 8px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: flex">
  <div style="justify-content: flex-start; align-items: center; gap: 24px; display: inline-flex">
    <div style="color: #353D5A; font-size: 17px; font-weight: 400; line-height: 27px; letter-spacing: 0.03px; word-wrap: break-word">
You are browsing legacy Javonet 1.5 (Java<>.NET bridge for Windows) documentation. Use the left side menu or <a style="font-weight: bold; text-decoration: underline;" href="/guides/v2/getting-started/about-javonet">click here</a> to switch to latest Javonet 2.0 documentation. Javonet 2.0 allows you to use any module from
JVM, CLR, Netcore, Python, Ruby, Perl, NodeJS on Windows, Linux and MacOs
from any application created in Java, Clojure, Groovy, Kotlin, C#, F#, J#, VB.NET, Python, Perl, Ruby, JavaScript, TypeScript, C++ and GoLang
    </div>
  </div>
</div>
There could be a scenario where huge amount of short living instances of .NET objects is created on Java side. Huge amount is estimated above 500 000 objects per minute. It could be when .NET side triggers event subscribed on Java side with many reference-type arguments (NObjects) or when multiple objects are being created for executing business logic calculation in big loops. In each of these cases when memory utilization is increased Java garbage collector will quickly start collecting NObject instances. Javonet forwards such calls to .NET side. When there are more than 500 000 collections per minute the overall application performance might be affected by additional GC call for each of the NObject instances.  

In such cases the new DelayGcContext class (introduced in Javonet 1.4) could be applied. The best way to determine if DelayGcContext is required is by performing performance tests with suspicious piece of code. DelayGcContext class allows to indicate the beginning and the end of the code for which the garbage collection calls should be batched. The GC buffer for these objects will be flushed to .NET side every time the buffer size exceeds 100 000 objects pending in the queue or when 30 seconds pass.  
  
The beginning of delayed garbage collection section should be indicated by calling static "Begin" method on DelayGcContext class and terminated by calling "End" method as presented on the snippet below:  
  
:::code 
:calling_source: v1/snippets/`{calling_technology}`/`{called_technology}`/integrationTests.`{calling_ext}`
:calling_id: TestResources_BatchingGC
:display: calling
:::
  
More about DelayGcContext you can read in our docs section for [DelayGcContext class](http://doc.javonet.com/com/javonet/api/DelayGcContext.html)