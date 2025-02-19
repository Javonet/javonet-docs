public class TestClass {
    public TestClass() {
    }

    // <Fields>
    public int publicValue;
    private int privateValue;
    public static int staticValue = 3;

    public TestClass(int publicValue, int privateValue) {
        this.publicValue = publicValue;
        this.privateValue = privateValue;
    }
    // </Fields>

    // <Methods>
    public static int multiplyByTwo(int a) {
        return 2 * a;
    }

    public int multiplyTwoNumbers(int a, int b) {
        return a * b;
    }
    // </Methods>

    // <Arrays>
    public String[] get1DArray() {
        return new String[]{"one", "two", "three", "four", "five"};
    }

    public String[][] get2DArray() {
        return new String[][]{{"S00", "S01"}, {"S10", "S11"}};
    }

    public double addArrayElementsAndMultiply(Double[] myArray, double myValue) {
        Double sum = 0.0;
        for (Double value : myArray) {
            sum += value;
        }
        return sum * myValue;
    }
    // </Arrays>

    // <Exceptions>
    public static int divideBy(int x, int y) {
        return divideBySecond(x, y);
    }

    public static int divideBySecond(int x, int y) {
        return divideByThird(x, y);
    }

    public static int divideByThird(int x, int y) {
        return x / y;
    }
    // </Exceptions>

    // <Cast>
    public static String castSampleMethod(Vehicle v) {
        return "castSampleMethod with Vehicle called";
    }

    public static String castSampleMethod(Car c) {
        return "castSampleMethod with Car called";
    }

    public static String castSampleMethod(Boat b) {
        return "castSampleMethod with Boat called";
    }
    // </Cast>

    // <Generics>
    public static <T> String genericSampleStaticMethod(T x, T y) {
        return x.toString() + " and " + y.toString();
    }

    public <T> String genericSampleMethod(T x, T y) {
        return x.toString() + " or " + y.toString();
    }

    public <T, K> String genericSampleMethodWithTwoTypes(T x) {
        return "genericSampleMethodWithTwoTypes invoked";
    }
    // </Generics>

    // <Enums>
    public enum Fruit {
        Apple,
        Banana,
        Orange,
        Mango
    }

    private static java.util.ArrayList<Fruit> Fruits = new java.util.ArrayList<Fruit>();

    public static String addFruitsToList(Fruit[] fruits) {
        Fruits.addAll(java.util.Arrays.asList(fruits));
        return String.format("%d fruits on the list", Fruits.size());
    }
    // </Enums>

    // <PassingNull>
    public static String passNull(Object arg) {
        if (arg == null) {
            return "Method called with null";
        } else {
            return "Method not called with null";
        }
    }

    public static String passNull2(int arg1, Object arg2) {
        if (arg2 == null) {
            return "Method2 called with null";
        } else {
            return "Method2 not called with null";
        }
    }
    // </PassingNull>

    // <ReturningNull>
    public static Object returnNull() {
        return null;
    }
    // </ReturningNull>

    // <Multithreading>
    private static java.util.concurrent.ConcurrentMap<Integer, Integer> cache = new java.util.concurrent.ConcurrentHashMap<>();

    public int addTwoNumbers(int x, int y) {
        System.out.println("Computing result in thread: " + Thread.currentThread().getId());
        try {
            Thread.sleep(1000); // Simulate computation delay
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        int result = x + y;
        System.out.println("Saving result in thread: " + Thread.currentThread().getId());
        try {
            Thread.sleep(50); // Simulate saving delay
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        cache.put((int) Thread.currentThread().getId(), result);
        System.out.println("Returning result in thread: " + Thread.currentThread().getId());
        return cache.get((int) Thread.currentThread().getId());
    }
    // </Multithreading>

    // <AsyncMethods>
    private static final java.util.concurrent.locks.ReentrantLock fileLock = new java.util.concurrent.locks.ReentrantLock();

public java.util.concurrent.CompletableFuture<Void> writeToFile(String fileName, String input) {
    return java.util.concurrent.CompletableFuture.runAsync(() -> {
        try {
            Thread.sleep(2000); // Simulate writing delay
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        fileLock.lock();
        try {
            java.nio.file.Files.write(java.nio.file.Paths.get(fileName), input.getBytes(), java.nio.file.StandardOpenOption.APPEND);
        } catch (java.io.IOException e) {
            throw new RuntimeException(e);
        } finally {
            fileLock.unlock();
        }
    });
}

    public int addThreeNumbers(int x, int y, int z) {
        try {
            Thread.sleep(2000); // Simulate computing delay
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        return x+y+z;
    }
    // </AsyncMethods>

    // <Delegates>
    public static Integer useYourFunc(java.lang.reflect.Method yourFunc, Integer x, Integer y) throws Exception {
        return (Integer) yourFunc.invoke(null, x, y);
    }

    @FunctionalInterface
    public interface MathOperation {
        int operate(int x, int y);
    }

    public int useYourDelegate(MathOperation mathOperation, int x, int y) {
        return mathOperation.operate(x, y);
    }
    // </Delegates>


    // <Others>
    public Double multiplyTwoDoubles(Double a, Double b) {
        return a * b;
    }

    public double multiplyTwoDoublesPrimitive(double a, double b) {
        return a * b;
    }

    public Double addArrayElements(Double[] myArray) {
        Double sum = 0.0;
        for (Double value : myArray) {
            sum += value;
        }
        return sum;
    }

    public Double publicDoubleValue;

    public TestClass(Double publicDoubleValue) {
        this.publicDoubleValue = publicDoubleValue;
    }

    public static byte[] getByteArray() {
        byte[] test =  new byte[100000];
        java.util.Arrays.fill(test, (byte) 1);
        return test;
    }
    // </Others>

    // <Empty>
    // empty
    // </Empty>
}
