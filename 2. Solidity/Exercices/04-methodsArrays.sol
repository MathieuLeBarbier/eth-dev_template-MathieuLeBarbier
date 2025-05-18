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

    // Je fais une foncction pour ajouter une personne
    // La fonction add prend en paramètre un nom et un âge
    function add(string memory _name, uint _age) public {
        // Je crée une nouvelle instance de la structure Person
        // et je l'initialise avec les valeurs passées en paramètre
        Person memory person = Person(_name, _age);
        // J'ajoute cette instance au tableau persons
        persons.push(person);
    }

    function remove() public {
        persons.pop();
    }
}