// SPDX-License-Identifier: MIT
pragma solidity >=0.7.2 <0.9.0;

contract firstcoin {
    address public minter;
    mapping (address => uint ) public balances;

    event sent(address from, address to, uint amount);
    constructor () {
        minter= msg.sender;

    }
    function mint(address receiver, uint amount) public{
        require(msg.sender==minter);
        require(amount<1e60);
        balances[receiver]+=amount;
    }
    function send(address receiver, uint amount) public{
        require(amount<=balances[msg.sender],"Khong du tien ma doi chuyen");
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit sent(msg.sender,receiver, amount);
    }
}