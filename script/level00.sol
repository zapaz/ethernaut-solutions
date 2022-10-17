// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/level00.sol";

contract AttackerInstanceScript is Script {
    Instance level00 = Instance(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        level00.authenticate(level00.password());

        vm.stopBroadcast();
    }
}
