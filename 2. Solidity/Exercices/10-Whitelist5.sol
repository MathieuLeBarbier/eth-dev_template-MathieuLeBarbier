// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Whitelist {
    mapping (address => bool) whitelistAddress;

    event Authorized(address _address);

    // initialisation du contrat avec le deployeur comme premier membre whitelisté
    
    // Permet de mettre directement sur la whitelist au moment ou je déploie le SC
    constructor() {
        whitelistAddress[msg.sender] = true;
    }
    // Le modifier check permet de vérifier si l'adresse est whitelistée
    // Si l'adresse n'est pas whitelistée, le contrat va renvoyer une erreur
    modifier check() {
        require (whitelistAddress[msg.sender]==true, "You are not authorized");
        _; // C'est ici que le code de la fonction va s'exécuter
    }

    // On peut utiliser le modifier check pour vérifier si l'adresse est whitelistée directement dans la fonction
    function authorize( address _address) public check {
        whitelistAddress[_address] = true;
        emit Authorized(_address);
    }

}