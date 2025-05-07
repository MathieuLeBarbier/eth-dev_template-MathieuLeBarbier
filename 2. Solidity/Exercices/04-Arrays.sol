// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract People {
    struct Person { 
        string name;
        uint age;  
    }
    Person[] public persons;

    // Affectation
    Person public person0 = Person("Alice", 25);

    // Récupération
    // Person[0].name; // Doit me renvoyer "Alice"

    function add(string memory _name, uint _age) public {
        Person memory person = Person(_name, _age);
        persons.push(person);
    }

    function remove() public {
        persons.pop();
    }
}