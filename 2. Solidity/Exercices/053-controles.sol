// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract exemples{
    uint number;

    function store(uint num) public {
        /* Avec if/else if
        if (num==0){
            number=100;
        } else if (num==1){
            number=101;
        } else {
            number = num;
        }
        */

        // incrementation avec while
        /*
        uint increment=num;
        uint limit= 12;
        while (limit>increment ){
            increment += num;
        }
        number = increment;
        */

        // for avec break et return
        uint increment = num;
        uint limit = 12;
        for (uint i=0; i<10; i++) {
            if (limit == increment ) {
                increment ++;
                break; // Si j'avais utilisé continue j'aurais skip plutot que stopper
            }
            increment +=num;
        }
        number= increment;
    
    }

    function retrieve() public view returns (uint){
        return number;
    }
}