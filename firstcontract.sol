// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract FirstContract {
    uint private saveData;  // It's a good practice to declare state variables as private unless you need external access

    // Function to set the value of saveData
    function set(uint x) public {
        saveData = x;
    }

    // Function to get the value of saveData
    function get() public view returns (uint) {
        return saveData;
    }
}