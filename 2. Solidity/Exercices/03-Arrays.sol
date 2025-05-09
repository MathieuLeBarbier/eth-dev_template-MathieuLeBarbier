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
    //Person[0].name; // Doit me renvoyer "Alice"
}