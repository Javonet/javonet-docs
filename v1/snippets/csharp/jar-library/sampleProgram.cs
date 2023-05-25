class SampleProgram
{
    static void Main(string[] args)
    {
        // <Activation>
        Javonet.Activate("your-email", "your-license-key", @"C:\Program Files (x86)\Java\jdk1.8.0_144");
        //Todo: Your Javonet powered application code 
        // </Activation>

        // <AddReference>
        Javonet.AddReference(@"TestClass.jar");
        // </AddReference>
    }
}