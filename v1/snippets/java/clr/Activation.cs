static void Main(string[] args)
{
    //path to your Java runtime JRE or Java development kit (JDK)
    var pathtoJavaRuntime = @"C:\Program Files (x86)\Java\jdk1.8.0_144";
    Javonet.Activate("your@mail.com", "your-license-key", pathtoJavaRuntime);
}