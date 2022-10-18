// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/09_king.sol";

contract AttackerKingScript is Script {
    King template = King(payable(vm.envAddress("INSTANCE")));

    function run() external {
        vm.startBroadcast();

        //

        vm.stopBroadcast();
    }
}
