    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.13;

    contract Whitelist {
        mapping (address => bool) whitelistAddress;
        // je déclare un événement pour notifier l'ajout d'une adresse à la liste blanche
        event Authorized(address _address);
    }
