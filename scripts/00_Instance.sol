// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/00_Instance.sol";

contract AttackerInstanceScript is Script {
    Instance instance = Instance(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        console.log("Current cleared :", instance.getCleared());
        console.log("Password :", instance.password());
        instance.authenticate(instance.password());
        console.log("New cleared :", instance.getCleared());

        vm.stopBroadcast();
    }
}
