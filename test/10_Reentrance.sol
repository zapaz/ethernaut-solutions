// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/10_Reentrance.sol";
import "contracts/10_Reentrance.sol";

contract AttackerReentranceTest is Test {
    function testReentrance() external {
        vm.prank(address(1));
        Reentrance reentrance = new Reentrance();
        AttackerReentrance attackerReentrance = new AttackerReentrance();

        reentrance.donate{value: 0.005 ether}(address(this));
        reentrance.donate{value: 0.001 ether}(address(attackerReentrance));

        assertEq(address(attackerReentrance).balance, 0);
        attackerReentrance.exploit(address(reentrance));
        assertEq(address(attackerReentrance).balance, 0.006 ether);
    }
}
