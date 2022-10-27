// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackerEngine {
    function exploit() public payable {
        selfdestruct(payable(msg.sender));
    }
}
