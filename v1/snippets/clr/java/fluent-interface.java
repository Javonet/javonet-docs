public static void main(String[] args) throws JavonetException { 
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
}