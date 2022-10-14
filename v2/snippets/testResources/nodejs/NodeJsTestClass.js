class V8TestClass {

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
        return first*second
    }
}


module.exports = V8TestClass