// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/12_Privacy.sol";

contract AttackerPrivacyTest is Test {
    function testPrivacy(bytes32[3] memory data) external {
        vm.prank(address(1));
        Privacy privacy = new Privacy(data);

        bytes32 key = vm.load(address(privacy), bytes32(uint256(5)));
        assertEq(key, data[2]);
        emit log_bytes32(key);

        assertTrue(privacy.locked());
        privacy.unlock(bytes16(key));
        assertFalse(privacy.locked());
    }
}
