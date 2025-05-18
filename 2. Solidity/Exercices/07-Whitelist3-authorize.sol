// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Whitelist {
    mapping (address => bool) whitelistAddress;
    // je déclare un événement pour notifier l'ajout d'une adresse à la liste blanche
    // Permet aussi de suivre des actions importantes sur la blockchain
    // Les événements sont des journaux qui sont enregistrés sur la blockchain
    event Authorized(address _address);

    // La fonction authorize permet d'ajouter une adresse à la liste blanche
    // Elle prend en paramètre l'adresse de l'utilisateur à ajouter
    // Elle est publique et peut être appelée par n'importe qui
    function authorize( address _address) public {
        // Je prends l'adresse de l'argument et je la mets à true dans le mapping
        whitelistAddress[_address] = true;
        // J'émet l'événement Authorized avec l'adresse de l'utilisateur
        emit Authorized(_address);
    }
}
