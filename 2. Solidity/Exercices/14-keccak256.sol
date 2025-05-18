/**
* ====================================================================
* ⚠️  AVERTISSEMENT : NE PAS DEPLOYER CE CODE EN PRODUCTION
* ====================================================================
*
* METHODE NON SECURISEE
* On va faire un nouveau contrat
* Définir une fonction qui random et retourne un nombre entre 0 et 100
* Utiliser le typecast uint du hash (en keccak256)  de plusieurs params
* On preferera utiliser un Oracle
* 
* =====================================================================
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Random {
    // on utilise un nonce 
    uint nonce;

    function random() public returns (uint) {
        nonce ++; // on incremente le nonce pour changer la valeur a chaque fois 
        
        // On typecast ( définit un élément en byte) et on en créé un uint
        return uint(keccak256(abi.encodePacked(nonce, block.timestamp))) %100;
        // On a réutiliser le nonce( change a chaque boucle) et le block.timestamp( change a chaque block) pour
        // On recupere ces éléments qu'on encode avec abi.encodedPacked et on va les hasher avec keccak256
        // On en récupere un uint
        // On utilise le modulo 100 pour avoir un nombre entre 0 et 100
    }
}