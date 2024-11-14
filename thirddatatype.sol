// SPDX-License-Identifier: MIT
pragma solidity >=0.7.2 <0.9.0;
contract datatypes{
    bool myBoolean= true;
    uint myUnsighnedInteger=10;
    int myInteger=-10;
    string myString="my string hello";
    address myAdress=msg.sender;
    
}
contract Game{
    uint public countPlayer=0;
//    Player[] public players;
    mapping (address=> Player) public players;
    struct Player{
        address addressPlayer;
        string fullName;
        uint age;
        string sex;
    }
    function addPlayer(string memory fullName,uint age, string memory sex) public{
        players[msg.sender] = Player(msg.sender,fullName, age, sex );
//        players.push(Player(fullName,age,sex));
        countPlayer+=1;
    } 
}