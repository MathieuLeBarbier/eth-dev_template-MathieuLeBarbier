// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Time {
    // La variable spéciale block.timestamp me renvoie le timestamp du bloc actuel
    // Le timestamp est le nombre de secondes écoulées depuis le 1er janvier 1970
    function getTime() public view returns (uint) {
        return block.timestamp;
    }

}