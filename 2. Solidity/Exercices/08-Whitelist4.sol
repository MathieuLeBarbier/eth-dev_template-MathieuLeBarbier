// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Whitelist {
    mapping (address => bool) whitelistAddress;

    event Authorized(address _address);

    // initialisation du contrat avec le deployeur comme premier memebre whitelisté
    constructor() {
        whitelistAddress[msg.sender] = true;
    }

    function authorize( address _address) public {
        require( check(_address), "You are not authorized");
        whitelistAddress[_address] = true;
        emit Authorized(_address);
    }

    function check(address _address) private view returns (bool) {
        if (whitelistAddress[msg.sender]== true) {
            return true;
        } else {
            return false;
        }
    }
}
