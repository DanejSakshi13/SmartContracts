// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract hotel_room {
    address public owner;
    mapping (address => uint) public rooms_available;
constructor() {
    owner = msg.sender;
    rooms_available[address(owner)] = 10;
}
function purchase(uint amount) public payable {
        require(msg.value >= amount * 50 ether, "You must pay at least 50 ETH per room");
        require(rooms_available[address(owner)] >= amount, "Room not available.");
        rooms_available[address(owner)] -= amount;
        rooms_available[owner] += amount;
    }
}
