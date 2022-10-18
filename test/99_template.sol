// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/09_king.sol";
import "forge-std/Test.sol";

contract AttackerKingTest is Test {
    function testKing() external {
        vm.prank(address(0x1));
        King king = new King();

        //
    }
}
