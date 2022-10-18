// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/00_instance.sol";

contract AttackerInstanceScript is Script {
    Instance instance = Instance(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        instance.authenticate(instance.password());

        vm.stopBroadcast();
    }
}
