package main;

import com.javonet.Javonet;
import com.javonet.JavonetException;
import com.javonet.JavonetFramework;
import com.javonet.api.NObject;

import static utils.ActivationCredentials.yourEmail;
import static utils.ActivationCredentials.yourLicenseKey;
import static utils.Constants.resourcesDirectory;

public class Main {
    public static void main(String[] args) throws JavonetException {
        // activates Javonet framework using provided credentials and JavonetFramework argument,
        // successful execution of this step loads CLR within Java process,
        // allowing our .NET debugger to be attached
        Javonet.activate(yourEmail, yourLicenseKey, JavonetFramework.v45);

        // instructs Javonet to load classes referenced in the DLL library file
        // under given path into the CLR, which makes our Person class accessible
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // instantiate a new Person class object and set its properties to relevant values
        NObject person = Javonet.New("Person");
        person.set("Firstname", "Frodo");
        person.set("Lastname", "Baggins");

        // invokes Person object’s DisplayName method and
        // stores its return value in local String variable
        String displayName = person.invoke("DisplayName");

        // prints resultant DisplayName value from .NET code
        // to standard output of Java process
        System.out.println(displayName);
    }
}
