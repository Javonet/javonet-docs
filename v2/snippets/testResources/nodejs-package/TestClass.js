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

    getPublicValue() {
        return this.publicValue;
    }

    setPublicValue(publicValue) {
        this.publicValue = publicValue;
    }

    getPrivateValue() {
        return this.#privateValue;
    }

    setPrivateValue(privateValue) {
        this.#privateValue = privateValue;
    }

    multiplyTwoNumbers(first, second) {
        return first * second
    }

    get1DArray() {
        return ["one", "two", "three", "four", "five"]
    }

    addNumberTo1DArray(myArray, myDouble) {
        for (let i = 0; i < myArray.length; i++) {
            myArray[i] += myDouble
        }
        return myArray
    }

    produce3DArray(myInt) {
        let responseArray = [
            [
                [0 + myInt, 1 + myInt],
                [2 + myInt, 3 + myInt]
            ],
            [
                [4 + myInt, 5 + myInt],
                [6 + myInt, 7 + myInt]
            ]
        ]
        return responseArray
    }

    produceJaggedArray(myArray) {
        let responseArray = [
            myArray,
            myArray,
            myArray
        ]

        return responseArray
    }
}


module.exports = TestClass