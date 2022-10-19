// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/14_gatekeepertwo.sol";

contract AttackerGatekeeperTwoTest is Test {
    function testGatekeeperTwo() external {
        vm.prank(address(0x1));
        GatekeeperTwo gatekeeperTwo = new GatekeeperTwo();

        //
    }
}
