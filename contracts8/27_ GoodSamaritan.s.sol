// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/27_GoodSamaritan.sol";

contract AttackerGoodSamaritanScript is Script {
    GoodSamaritan goodSamaritan = GoodSamaritan(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        //

        vm.stopBroadcast();
    }
}
