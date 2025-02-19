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

    // <Multithreading>
    addTwoNumbers(x, y) {
        return x + y;
    }

    // </Multithreading>

    // <AsyncMethods>
    async writeToFile(fileName, fileInput) {
        await new Promise(resolve => setTimeout(resolve, 2000)); // Simulate writing delay
        await fs.appendFile(fileName, fileInput);
        return
    }

    addThreeNumbers(x, y, z) {
        return x + y + z;
    }

    // </AsyncMethods>

    // <Delegates>
    useYourFunc(method, a, b) {
        const result = method(a, b)
        return result
    }

    static multiplyTwoNumbersStatic(a, b) {
        return a * b
    }

    // </Delegates>

    // <Empty>
    // empty
    // </Empty>
}

// <GlobalFunctions>
function welcome(name) {
    return "Hello " + name + "!"
}

// </GlobalFunctions>

module.exports = {
    TestClass,
    welcome
};

