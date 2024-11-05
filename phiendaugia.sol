// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;
//Thời gian phiên đấu giá còn hoạt động
// Giá trị đặt lớn hơn giá trị tại thời điểm đó 
// Bid!=0
//Withdraw: amount> 0 
// Sau khi rút phải rút amount = bid 
// after send = 0 
// Auction end: khi nào kết thúc phiên đấu giá 
// Sự kiện tranfer  
contract simpleAuction{
    //Variable 
    uint public auctionEndTime;
    uint public highestBid;
    address public highestBidder;
    event highestBidincrease( address bidder, uint amount);
    mapping( address=>uint) public pendingReturns;
    //Fuction
    function bid() public payable {
        if (block.timestamp> auctionEndTime ){
            revert("Phien dau gia da ket thuc");
        }
        if(msg.value<=highBid){
            revert("Gia cua ban thap hon gia cao nhat ");
        }
        if(highBid!=0){
            pendingReturns[highestBidder]+= highestBid;
        }
        highestBidder=msg.sender;
        highestBid= msg.value;
        emit highestBidincrease(msg.sender,msg.value);
    }
    function withdraw() public returns(bool){
        uint=pendingReturns[msg.sender];
        if(amount>0){
            pendingReturns[msg.sender]=0;
            if(!payable msg.sender.send(amount)){
            pendingReturns[msg.sender]=amount;
            return false;
        }
        return true; 
        }
    }
    function auctionEnd() public {

    }

}