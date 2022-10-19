// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/07_force.sol";
import "contracts/07_force.sol";

contract AttackerForceTest is Test {
    function testForce() external {
        vm.prank(address(0x1));
        Force force = new Force();
        AttackerForce attackerForce = new AttackerForce();

        assertEq(address(force).balance, 0);
        attackerForce.exploit{value: 1 wei}(address(force));
        assertGt(address(force).balance, 0);
    }

    receive() external payable {}
}
