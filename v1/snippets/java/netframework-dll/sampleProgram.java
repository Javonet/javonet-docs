class SampleProgram {
  public static void main(String[] args) {
    // <Activation>
    Javonet.activate("your-email", "your-license-key", JavonetFramework.v40);
    //Todo: Your Javonet powered application code 
    // </Activation>

    // <Activation_with_proxy>
    Javonet.activate(String email, String licenceKey, String proxyHost, JavonetFramework framework);
    Javonet.activate(String email, String licenceKey, String proxyHost, String proxyUsername, String proxyPassword, JavonetFramework framework);
    Javonet.activate(String email, String licenceKey, String proxyHost, String proxyUsername, String proxyPassword, String proxyDomain, JavonetFramework framework);
    // </Activation_with_proxy>

    // <AddReference>
    Javonet.addReference("System.Windows.Forms","System.Drawing");
    Javonet.addReference("TestClass.dll");
    // </AddReference>

    // <FluentInterface>
    //Regular code
    NObject nowDateObj= Javonet.getType("DateTime").get("Now");
        
    NObject date = Javonet.New("DateTime",1980,1,1);
    NObject datesDiff = nowDateObj.invoke("Subtract",date);

    String dateDiffStr = datesDiff.invoke("ToString");

    System.out.println(dateDiffStr); 

    //Fluent code
    String dateDiffStr = Javonet.getType("DateTime")
        .<NObject>get("Now")
        .<NObject>invoke("Subtract",Javonet.New("DateTime",1980,1,1))
        .invoke("ToString");
    System.out.println(dateDiffStr);
    // </FluentInterface>
    }
}
