// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Minimal ERC20 interface
interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract LendingBorrowing {
    IERC20 public token; // ERC20 token used for lending/borrowing

    mapping(address => uint256) public suppliedTokens;
    mapping(address => uint256) public borrowedTokens;

    uint256 public baseRate = 2; // 2% base interest
    uint256 public multiplier = 5; // adjusts with utilization

    constructor(address _token) {
        token = IERC20(_token);
    }

    // Supply tokens to the pool
    function supply(uint256 amount) public {
        require(amount > 0, "Amount must be > 0");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        suppliedTokens[msg.sender] += amount;
    }

    // Borrow tokens from the pool
    function borrow(uint256 amount) public {
        require(amount > 0, "Amount must be > 0");
        require(amount <= getAvailableLiquidity(), "Not enough liquidity");

        borrowedTokens[msg.sender] += amount;
        require(token.transfer(msg.sender, amount), "Transfer failed");
    }

    // Repay borrowed tokens
    function repay(uint256 amount) public {
        require(amount > 0, "Amount must be > 0");
        require(borrowedTokens[msg.sender] >= amount, "Repay exceeds borrowed");

        borrowedTokens[msg.sender] -= amount;
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
    }

    // Dynamic interest rate calculation
    function getInterestRate() public view returns (uint256) {
        uint256 totalSupplied = getTotalSupplied();
        uint256 totalBorrowed = getTotalBorrowed();

        if (totalSupplied == 0) return baseRate;

        uint256 utilization = (totalBorrowed * 100) / totalSupplied;
        return baseRate + (multiplier * utilization / 100);
    }

    // Helper functions
    function getTotalSupplied() public view returns (uint256) {
        uint256 total;
        // Simplified: in production, track total supply separately
        for (uint i = 0; i < 1; i++) {
            total += suppliedTokens[msg.sender];
        }
        return total;
    }

    function getTotalBorrowed() public view returns (uint256) {
        uint256 total;
        // Simplified: in production, track total borrow separately
        for (uint i = 0; i < 1; i++) {
            total += borrowedTokens[msg.sender];
        }
        return total;
    }

    function getAvailableLiquidity() public view returns (uint256) {
        return getTotalSupplied() - getTotalBorrowed();
    }
}
