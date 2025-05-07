// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract people {
    struct Person {
        string name;
        uint age;
    }
    Person public moi = Person("Mathieu", 39);

    function modifyPerson (string memory _name, uint _age) public {
        moi.name = _name;
        moi.age = _age;
        // moi = Person(_name, _age); pour le faire en une ligne
    }
}