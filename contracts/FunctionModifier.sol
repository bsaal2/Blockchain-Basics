// SPDX-License-Identifier: UNLICENSED


pragma solidity ^0.8.9;

// function modifier is defined by the keyword modifier
// We define the function using this keyword
// This function works as the middleware function
// We can any logic inside that function. When any function uses this modifier then 
// it will execute after the logic in the modifier is verified
contract FunctionModifier {
    string public name = 'Hary';
    address owner;

    constructor() {
        owner = msg.sender; // This is the person who deployed the contract
    }

    // Modifier function 
    modifier onlyOwner() {
        require(owner == msg.sender, 'You are not the owner'); // Ensure the owner should be the person who deployed the contract
        _; // When any function implements this modifier then logic is executed here only after the logic above it passes
    }

    // Function to update the name of the person but only when the modifier function passes 
    function updateName(string memory personName) public onlyOwner {
        name = personName;
    }
}