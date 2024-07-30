// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ValidationAndErrorContract {
    uint256 public totalFunds;

    constructor() {
        totalFunds = 0;
    }

    function addFunds(uint256 amount) external {
        require(amount > 0, "The amount to be added must be greater than zero");
        totalFunds += amount;
    }

    function takeFunds(uint256 amount) external {
        require(amount > 0, "The amount to be taken out must be greater than zero");
        
        bool fundsSufficient = amount <= totalFunds;
        
        if (!fundsSufficient) {
            revert("Insufficient balance in the contract."); // revert statement
        } else {
            totalFunds -= amount;
        }
    }

    function getFunds() external view returns (uint256) {
        assert(totalFunds >= 0); // assert statement
        return totalFunds;
    }
}
