


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract School {
    // Pour choisir entre un tableau et un mapping, il faut se demander si on a besoin d'un index
    // Un tableau est utile si on a besoin d'un index pour accéder à un élément

    mapping (address => uint[])students; // Je fais un mapping d'addresse vers un tableau d'entier( de notes)
}