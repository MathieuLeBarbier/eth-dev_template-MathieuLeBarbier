// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Whitelist {
    mapping (address => bool) whitelistAddress;

    event Authorized(address _address);

    function authorize( address _address) public {
        whitelistAddress[_address] = true;
        emit Authorized(_address);
    }
}
