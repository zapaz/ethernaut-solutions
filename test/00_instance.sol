// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/00_instance.sol";

contract AttackerInstanceTest is Test {
    function testInstance(string memory pass) external {
        vm.prank(address(0x1));
        Instance instance = new Instance(pass);

        assertFalse(instance.getCleared());
        instance.authenticate(instance.password());
        assertTrue(instance.getCleared());
    }
}
