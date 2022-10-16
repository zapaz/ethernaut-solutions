// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level00.sol";
import "forge-std/Test.sol";

contract Attacker is Test {
    Instance level00 = new Instance("random password");

    function testLevel00() external {
        level00.authenticate(level00.password());
    }
}
