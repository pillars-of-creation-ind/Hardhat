//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Token {
    //variables
    string public name = "Abhishek Hardhat Token";
    string public symbol = "AHHT";
    uint256 public totalSupply = 10000;

    // address of the owner
    address public owner;

    //mapping of balance associated with address
    //check how many to token they have
    mapping(address => uint256) balances;

    constructor() {
        //owner of the token/contracts
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enought tokens");
        balances[msg.sender] -= amount;
        //balances[msg.sender] transfer to sender
        balances[to] += amount;
    }

    //to check the balance of the token
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
