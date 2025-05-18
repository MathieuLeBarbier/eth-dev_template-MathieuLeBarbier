// SPDX-License-Identifier: MIT



pragma solidity ^0.8.13;

contract Bank {

    mapping (address => uint) balances; // je fais un mapping d'addresse vers un uint  

    function deposit(uint _amount) public { // la fonction prend un uint amount et sa visibilité est public
        balances[msg.sender]+=_amount; //on va indiquer qu'on ajoute amount a la balance
    }
    function transfer(address _to, uint _amount) public{ // le destinataire est l'address du _to et on a un amount
        // Dans cette fonction on va verifier 
        // De ne pas envoyer a l'adresse 0 qui revient a burn les tokens
        // que le sender possede assez pour faire le transfert
       require (_to != address(0),"Vous ne pouvez pas burn vos tokens");
       require (balances[msg.sender]>=_amount, "Vous n'avez pas assez de token"); 
       // On effectue le transfer 
       balances[msg.sender]-=_amount;
       balances[_to]+=_amount;
    }
    function balanceOf(address _addr) public view returns (uint){ // la fonction renvoie la balance de addresse
        return balances[_addr];
    }
}
