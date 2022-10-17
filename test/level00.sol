// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level00.sol";
import "forge-std/Test.sol";

contract Attacker is Test {
    function testLevel00(string memory pass) external {
        Instance level00 = new Instance(pass);

        level00.authenticate(level00.password());
    }
}
