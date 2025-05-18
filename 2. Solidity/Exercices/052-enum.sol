// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

enum State { Created, Locked, Inactive } // Je déclare un enum qui va me permettre de savoir si le contrat est créé, locké ou inactif
// enum est un type de données qui permet de définir un ensemble de valeurs possibles
// Il est utile pour représenter des états ou des options prédéfinies
// Il est plus lisible et compréhensible qu'un tableau d'entiers

State public defaultstate; // On va dréer une variable de type State de visibilité publique

// On modifie sa valeur soit a l'instanciation du contrat soit dans une fonction
// A savoir que par défaut, ce sera la premiere valeur de l'enum

defaultstae = State.Locked;