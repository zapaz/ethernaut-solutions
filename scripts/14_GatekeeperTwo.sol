// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/14_gatekeepertwo.sol";

contract AttackerGatekeeperTwoScript is Script {
    GatekeeperTwo gatekeeperTwo = GatekeeperTwo(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        //

        vm.stopBroadcast();
    }
}
