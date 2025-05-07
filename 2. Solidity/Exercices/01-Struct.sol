// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract people {
    struct Person {
        string name;
        uint age;
    }
    Person public moi = Person("Mathieu", 39);
}
