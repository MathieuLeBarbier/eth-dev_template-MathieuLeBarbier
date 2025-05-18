/*
    Dans cet exercice, vous devez compléter le smart contract de l’exercice “Déclaration d’une struct Person“
     par une nouvelle fonction modifyPerson qui permet l’ajout d’une personne.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract people {
    struct Person {
        string name;
        uint age;
    }
    Person public moi = Person("Mathieu", 39);

    // Je vais créer une fonction qui va me permettre de modifier le nom et l'age de la personne
    // La fonction va prendre en paramètre un nom et un age
    // memory est un type de stockage temporaire
    // Je l'utilise pour des paramètres de fonction ou des variables locales non persistantes

    // La fonction sera public, utlisable interne et externe 
    function modifyPerson (string memory _name, uint _age) public {
        // La variable de type Person sera modifiée
        // Je vais modifier le nom et l'age de la personne moi
        moi.name = _name; 
        moi.age = _age;
        // moi = Person(_name, _age); pour le faire en une ligne
    }
}