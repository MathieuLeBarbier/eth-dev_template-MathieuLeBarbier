// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Whitelist {
    mapping (address => bool) whitelistAddress;

    event Authorized(address _address);

    // initialisation du contrat avec le deployeur comme premier membre whitelisté
    constructor() {
        whitelistAddress[msg.sender] = true;
    }

    function authorize( address _address) public {
        // require premet de vérifier une condition
        // on check si l'adresse est whitelistée
        require( check(), "You are not authorized");
        // je prends l'adresse de l'argument et je la mets à true dans le mapping
        whitelistAddress[_address] = true;
        // J'émet l'événement Authorized avec l'adresse de l'utilisateur
        emit Authorized(_address);
    }

    // La fonction check permet de vérifier si l'adresse est whitelistée
    // Elle prend en paramètre l'adresse de l'utilisateur à vérifier
    // Elle est privée et ne peut être appelée que par le contrat
    // Elle retourne un booléen
    function check() private view returns (bool) {
        if (whitelistAddress[msg.sender]== true) {
            return true;
        } else {
            return false;
        }
    }
}
