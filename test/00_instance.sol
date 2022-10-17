// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/00_instance.sol";
import "forge-std/Test.sol";

contract AttackerInstanceTest is Test {
    function testinstance(string memory pass) external {
        vm.prank(address(0x1));
        Instance instance = new Instance(pass);

        assertFalse(instance.getCleared());

        instance.authenticate(instance.password());

        assertTrue(instance.getCleared());
    }
}
