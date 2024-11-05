// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// Simple Auction Contract
contract SimpleAuction {
    // Variables
    address payable public beneficiary;
    uint public auctionEndTime;
    uint public highestBid;
    address public highestBidder;
    bool ended = false;

    // Mappings
    mapping(address => uint) public pendingReturns;

    // Events
    event HighestBidIncrease(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    // Constructor
    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    // Bid function
    function bid() public payable {
        if (block.timestamp > auctionEndTime) {
            revert("Auction has already ended.");
        }
        if (msg.value <= highestBid) {
            revert("There already is a higher bid.");
        }
        
        // Refund the previously highest bidder
        if (highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncrease(msg.sender, msg.value);
    }

    // Withdraw function for bidders who were outbid
    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;

            if (!payable(msg.sender).send(amount)) {
                // If send fails, reset the amount owed
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    // End the auction and send highest bid to the beneficiary
    function auctionEnd() public {
        if (ended) {
            revert("Auction has already ended.");
        }
        if (block.timestamp < auctionEndTime) {
            revert("Auction not yet ended.");
        }

        ended = true;
        emit AuctionEnded(highestBidder, highestBid);

        // Transfer the highest bid to the beneficiary
        beneficiary.transfer(highestBid);
    }
}