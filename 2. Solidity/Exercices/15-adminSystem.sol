// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

// On va importer le contrat Open Zeppelin Ownable
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Admin is Ownable { // On fait heriter Admin de toutes les fonctions de Ownable

    // Je fais le mapping de la whitelist et blacklist
    mapping (address => bool) whitelist;
    mapping (address => bool) blacklist;

    // Je declare l'event d'authorization
    event Authorized( address _address); //event declare l'event Authorized est le nom et prend un parametre address

    event Banned(address _address);

    // La fonction qui permet l'authorization
    function authorize(address _address) public onlyOwner{ 
        // La fonction prends en arg une addresse, elle est public et elle est uniquement callable par le owner
        require(!blacklist[_address], "Address is blacklisted"); // on verifie que l'adresse n'est pas blacklisté
        require(!whitelist[_address], "Address is already whitelisted"); // on verifie que l'adresse n'est pas whitelisté
        
        whitelist[_address] = true; // elle passe la valeur de l'addresse du mapping a true
        emit Authorized(_address); // déclenche l'événement
    }

    // La fonction qui permet le ban
    function unauthorize(address _address) public onlyOwner{ 
        // La fonction prends en arg une addresse, elle est public et elle est uniquement callable par le owner
        require(!whitelist[_address], "Address is whitelisted"); // on verifie que l'adresse n'est pas whitelisté
        require(!blacklist[_address], "Address is already blacklisted"); // on verifie que l'adresse n'est pas blacklisté
        blacklist[_address] = true; // elle passe la valeur de l'addresse du mapping a true
        emit Bznned(_address); // déclenche l'événement
    }

    // On va faire deux getters de securité

    function isWhitelisted(address _addr) public view returns (bool) { // la fonction va retourner un bool sur l'addresse
        return whitelist[_addr]; // accede a la valeur de l'adresse du mapping 

    }

    function isBlacklisted(address _addr) public view returns (bool) { 
        return blacklist[_addr];
    }

}