// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Coin {

    // accessible from other contracts
    address public minter;
    mapping (address => uint) public balances;
    
    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    //To Send an amount of newly created coins
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // Errors Descriptions
    error InsufficientBalance(uint requested, uint available);

    //To Send an amount of existing coins 
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
