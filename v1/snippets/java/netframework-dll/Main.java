package main;

import com.javonet.Javonet;
import com.javonet.JavonetException;
import com.javonet.JavonetFramework;
import com.javonet.api.NObject;
import utils.ActivationCredentials;
import utils.Constants;


public class Main {
    public static void main(String[] args) throws JavonetException {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey, JavonetFramework.v45);
        Javonet.addReference(Constants.resourcesDirectory + "\\TestClass.dll");
        NObject person = Javonet.New("Person");
        person.set("Firstname", "Frodo");
        person.set("Lastname", "Baggins");

        String displayName = person.invoke("DisplayName");

        System.out.println(displayName);
    }
}


