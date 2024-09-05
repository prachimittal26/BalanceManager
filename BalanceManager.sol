// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auction {
    address public owner;
    uint256 public highestBid;
    address public highestBidder;
    bool public auctionEnded;

    mapping(address => uint256) public bids;

    constructor() {
        owner = msg.sender;
        highestBid = 0;
        auctionEnded = false;
    }

    // Place a bid on the auction
    function placeBid() external payable {
        require(!auctionEnded, "Auction has ended.");
        require(msg.value > 0, "Bid must be greater than zero.");

        uint256 newBid = bids[msg.sender] + msg.value;
        require(newBid > highestBid, "Your bid must be higher than the current highest bid.");

        bids[msg.sender] = newBid;
        highestBid = newBid;
        highestBidder = msg.sender;
    }

    // Withdraw funds for losing bidders
    function withdraw() external {
        uint256 amount = bids[msg.sender];
        require(amount > 0, "No funds to withdraw.");
        require(msg.sender != highestBidder, "Highest bidder cannot withdraw.");

        bids[msg.sender] = 0;  // Reset the bid amount before transferring funds

        (bool success, ) = msg.sender.call{value: amount}("");
        if (!success) {
            revert("Withdrawal failed.");
        }
    }

    // End the auction and transfer the highest bid to the owner
    function endAuction() external {
        require(msg.sender == owner, "Only the owner can end the auction.");
        require(!auctionEnded, "Auction already ended.");
        require(highestBid > 0, "No bids have been placed.");

        auctionEnded = true;

        (bool success, ) = owner.call{value: highestBid}("");
        assert(success);  // Ensure the owner receives the funds
    }

    // Get the total bid amount for a particular user
    function getBidAmount(address bidder) external view returns (uint256) {
        return bids[bidder];
}}
