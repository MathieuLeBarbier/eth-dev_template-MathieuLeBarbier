/*
    Dans cet exercice, vous devez écrire un smart contract 
    qui représente une personne avec de multiples propriétés.
    C'est donc un cas d'utilisation parfait pour une structure

    Votre smart contract devra s’appeler “People”.
    Votre smart contract devra utiliser la dernière version du compilateur.
    Votre smart contract devra définir une structure nommée “Person”.
    Votre structure Person aura 2 propriétés : name (une chaîne de caractères) et age (un uint).
    Vous allez créer une variable publique de type Person appelée moi
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Je crée un contrat qui va contenir une struct
// Le role de la struct est de regrouper des variables de types différents
// La struct va contenir un nom et un age
contract people {
    struct Person {
        string name;
        uint age;
    }

    // je crée une variable de type Person, public avec le nom moi
    // je l'initialise avec le nom et l'age 
    Person public moi = Person("Mathieu", 39);
}
