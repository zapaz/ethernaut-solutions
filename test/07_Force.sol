// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/07_Force.sol";
import "contracts/07_Force.sol";

contract AttackerForceTest is Test {
    function testForce() external {
        vm.prank(address(1));
        Force force = new Force();
        AttackerForce attackerForce = new AttackerForce();

        assertEq(address(force).balance, 0);
        attackerForce.exploit{value: 1 wei}(address(force));
        assertGt(address(force).balance, 0);
    }

    receive() external payable {}
}
