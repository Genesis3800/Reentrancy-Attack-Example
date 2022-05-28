//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Address.sol";

// 1. import contract
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

// 2 solutions- 1: inherit from ReentrancyGuard
//              2: Update the balance before sending the money
contract Bank is ReentrancyGuard {
    using Address for address payable;

    mapping(address => uint256) public balanceOf;

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
    }

    /* 3. attach nonReentrant to protect against reentracy */
    function withdraw() external nonReentrant {
        uint256 depositedAmount = balanceOf[msg.sender];
        payable(msg.sender).sendValue(depositedAmount);
        balanceOf[msg.sender] = 0;
    }
}