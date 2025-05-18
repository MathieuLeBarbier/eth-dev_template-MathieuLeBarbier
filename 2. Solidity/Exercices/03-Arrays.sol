/*
    Dans cet exercice, vous devez écrire un smart contract qui déclare un tableau de personnes.
*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract People {
    struct Person { 
        string name;
        uint age;  
    }
    // Je vais créer un tableau de personnes
    // Les tableaux sont utiles pour stocker plusieurs valeurs du même type
    Person[] public persons;

    // Affectation
    // Ici je vais créer une personne et l'ajouter au tableau
    Person public person[0] = Person("Alice", 25);

    // Récupération
    //Person[0].name; // Doit me renvoyer "Alice"
}