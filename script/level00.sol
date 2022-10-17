// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level00.sol";
import "forge-std/Test.sol";

contract Attacker is Test {
    Instance level00 = Instance(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        level00.authenticate(level00.password());

        vm.stopBroadcast();
    }
}
