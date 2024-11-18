// SPDX-License-Identifier: MIT
pragma solidity >=0.5.4 <=0.9.5;

contract Faucet {
    uint256 public numOfFunders;
    mapping(uint256 => address) public lutFunders;
    mapping(address => bool) private funders;

    // Receive function to accept Ether directly
    receive() external payable {}

    function addFunds() external payable {
        address funder = msg.sender;
        if (!funders[funder]) {
            funders[funder] = true;
            lutFunders[numOfFunders] = funder;
            numOfFunders++;
        }
    }

    function getFundersIndex(uint256 index) external view returns (address) {
        require(index < numOfFunders, "Index out of bounds");
        return lutFunders[index];
    }

    function getAllFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numOfFunders);
        for (uint256 i = 0; i < numOfFunders; i++) {
            _funders[i] = lutFunders[i];
        }
        return _funders;
    }

    function withdraw(uint256 withdrawAmount) external limitWithdraw(withdrawAmount) {
        payable(msg.sender).transfer(withdrawAmount);
    }

    modifier limitWithdraw(uint256 withdrawAmount) {
        require(withdrawAmount >= 1 ether, "Cannot withdraw more than 1 ETH");
        _;
    }
}