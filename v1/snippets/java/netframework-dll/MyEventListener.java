package utils;

import com.javonet.api.INEventListener;

//Your custom Java listener class for .NET events
public class MyEventListener implements INEventListener
{
    @Override
    public void eventOccurred(Object[] arguments) {
        System.out.println(".NET Event Occurred");
    }

}