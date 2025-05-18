    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.13;

    contract Whitelist {
        // Je déclare un mapping pour la liste blanche
        // La clé est l'adresse de l'utilisateur et la valeur est un booléen
        mapping (address => bool) whitelistAddress;
    }