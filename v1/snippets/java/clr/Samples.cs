
// <StandardLibrary_InvokeStaticMethod>
static void Main(string[] args)
{ 
        // Todo: activate Javonet and add reference to the JAR file first
    
        //Get Java type and call static method
        JType sampleType = Javonet.getType("SampleJavaClass");
    
        //Calling static methods
        String res = sampleType.Invoke<String>("SayHello", "Student");
        Console.WriteLine("Java static method 'SayHello' returned: " + res);
}
// <\StandardLibrary_InvokeStaticMethod>

// <StandardLibrary_InvokeStaticMethod2>
static void Main(string[] args)
{ 
        // Todo: activate Javonet and add reference to the JAR file first
    
        //Get Java type and call static method
        String res = Javonet.getType("SampleJavaClass").Invoke<String>("SayHello", "Student");
    
        Console.WriteLine("Java static method 'SayHello' returned: " + res);
}
// <\StandardLibrary_InvokeStaticMethod2>