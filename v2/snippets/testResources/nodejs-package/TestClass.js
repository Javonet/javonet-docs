class TestClass {

    publicValue;
    #privateValue;

    constructor(first, second) {
        this.publicValue = first;
        this.#privateValue = second;
    }

    static multiplyByTwo(value) {
        return value * 2;
    }

    static staticValue = 3;

    multiplyTwoNumbers(first, second) {
        return first * second
    }
}

module.exports = TestClass