// SPDX-License-Identifier: MIT
pragma solidity >=0.7.2 <0.9.0;

contract firstcoin {
    address public minter;
    mapping (address => uint ) public balances;

    event sent(address from, address to, uint amount);

// Adding role for Minter can sending any coin
    modifier onlyMinter{
            require(msg.sender==minter);
        _;
    }
    modifier checkamount(uint amount){
        require(amount<1e60);
        _;
    }
    modifier checkbalance(uint amount){
        require(amount<=balances[msg.sender],"Khong du tien ma doi chuyen");
        _; // khi duoc goi ra moi chay
    }
    constructor () {
        minter= msg.sender;
    }//chay 1 lan duy nhat
    function mint(address receiver, uint amount) public onlyMinter checkamount(amount){
//        require(amount<1e60);
        balances[receiver]+=amount;
    }
    function send(address receiver, uint amount) public checkbalance(amount){
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit sent(msg.sender,receiver, amount);
    }
}