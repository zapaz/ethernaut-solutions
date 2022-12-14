// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/11_Elevator.sol";
import "contracts/11_Elevator.sol";

contract AttackerElevatorTest is Test {
    function testElevator() external {
        vm.prank(address(1));
        Elevator elevator = new Elevator();
        AttackerElevator attackerElevator = new AttackerElevator();

        assertFalse(elevator.top());
        attackerElevator.exploit(address(elevator));
        assertTrue(elevator.top());
    }
}
