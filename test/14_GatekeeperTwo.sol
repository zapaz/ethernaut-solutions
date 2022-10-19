// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/14_GatekeeperTwo.sol";
import "contracts/14_GatekeeperTwo.sol";

contract AttackerGatekeeperTwoTest is Test {
    function testGatekeeperTwo() external {
        vm.prank(address(1));
        GatekeeperTwo gatekeeperTwo = new GatekeeperTwo();

        assertFalse(gatekeeperTwo.entrant() == msg.sender);
        new AttackerGatekeeperTwo(address(gatekeeperTwo));
        assertTrue(gatekeeperTwo.entrant() == msg.sender);
    }
}
