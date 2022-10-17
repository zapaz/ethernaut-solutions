// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level00.sol";
import "forge-std/Test.sol";

contract AttackerInstanceTest is Test {
    function testLevel00(string memory pass) external {
        vm.prank(address(0x1));
        Instance level00 = new Instance(pass);

        assertFalse(level00.getCleared());

        level00.authenticate(level00.password());

        assertTrue(level00.getCleared());
    }
}
