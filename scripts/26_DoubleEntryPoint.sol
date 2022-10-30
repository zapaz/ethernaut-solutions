// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/26_DoubleEntryPoint.sol";
import "contracts/26_DoubleEntryPoint.sol";

contract AttackerDoubleEntryPointScript is Script {
    DoubleEntryPoint doubleEntryPoint = DoubleEntryPoint(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        Forta forta = doubleEntryPoint.forta();
        DoubleEntryPointBot doubleEntryPointBot = new DoubleEntryPointBot(
            address(forta),
            doubleEntryPoint.cryptoVault()
        );

        forta.setDetectionBot(address(doubleEntryPointBot));

        vm.stopBroadcast();
    }
}
