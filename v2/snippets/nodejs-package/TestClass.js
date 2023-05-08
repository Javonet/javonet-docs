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
    static multiplyByTwo(value) {
        return value * 2;
    }

    multiplyTwoNumbers(first, second) {
        return first * second
    }
    // </Methods>

    // <Arrays>
    get1DArray() {
        return ["one", "two", "three", "four", "five"]
    }

    addArrayElementsAndMultiply(myArray, myValue) {
        return myArray.reduce(
        (accumulator, currentValue) => accumulator + currentValue) * myValue
    }
    // </Arrays>

    // <Empty>
    // minimal class
    // </Empty>
}

module.exports = TestClass