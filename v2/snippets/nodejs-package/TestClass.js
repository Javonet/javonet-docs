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

    // <Empty>
    // empty
    // </Empty>
}

module.exports = TestClass