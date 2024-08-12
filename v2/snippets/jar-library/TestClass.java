import java.util.*;

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
		return new String[][]{{"S00", "S01"},{"S10", "S11"}};
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

	private static ArrayList<Fruit> Fruits = new ArrayList<Fruit>();

	public static String addFruitsToList(Fruit[] fruits) {
		Fruits.addAll(Arrays.asList(fruits));
		return String.format("%d fruits on the list", Fruits.size());
	}
	// </Enums>

	// <Multithreading>

	private java.util.concurrent.ConcurrentMap<Integer, Integer> cache = new java.util.concurrent.ConcurrentHashMap<>();

	public int addTwoNumbers(int x ,int y) {
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
		return result;
	}
	// </Multithreading>

	// <Empty>
	// empty
	// </Empty>
}
