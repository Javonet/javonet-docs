const fs = require('fs').promises;

class TestClass {

	// <Fields>
	publicValue;
	#privateValue;
	static staticValue = 3;

	constructor(first, second) {
		this.publicValue = first;
		this.#privateValue = second;
	}
	// </Fields>

	// <Methods>
	static multiplyByTwo(a) {
		return 2 * a;
	}

	multiplyTwoNumbers(a, b) {
		return a * b
	}

	// </Methods>

	// <Arrays>
	get1DArray() {
		return ["one", "two", "three", "four", "five"]
	}

	get2DArray() {
		return [["S00", "S01"], ["S10", "S11"]]
	}
	addArrayElementsAndMultiply(myArray, myValue) {
		return myArray.reduce((accumulator, currentValue) => accumulator + currentValue) * myValue
	}
	// </Arrays>

	// <Exceptions>
	static divideBy(x, y) {
		return TestClass.divideBySecond(x, y)
	}

	static divideBySecond(x, y) {
		return TestClass.divideByThird(x, y)
	}

	static divideByThird(x, y) {
		if (y === 0) {
			throw new Error("ZeroDivisionException")
		} else {
			return x / y
		}
	}
	// </Exceptions>
	
	// <PassingNull>
	static passNull(arg) {
		if (arg === null) {
			return "Method called with null";
		} else {
			return "Method not called with null";
		}
	}

	static passNull2(arg1, arg2) {
		if (arg2 === null) {
			return "Method2 called with null";
		} else {
			return "Method2 not called with null";
		}
	}
	// </PassingNull>

	// <ReturningNull>
		static returnNull() {
			return null;
		}
	// </ReturningNull>
	
	// <AsyncMethods>
	async createFileWithContent(fileName, fileInput) {
		await new Promise(resolve => setTimeout(resolve, 2000)); // Simulate async operation
		await fs.writeFile(fileName, fileInput);
		return "Input processed";
	}
	// </AsyncMethods>

	// <Empty>
	// empty
	// </Empty>
}

module.exports = TestClass