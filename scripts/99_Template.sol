// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/99_template.sol";

contract AttackerTemplateScript is Script {
    Template template = Template(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        //

        vm.stopBroadcast();
    }
}
