// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/99_template.sol";

contract AttackerTemplateTest is Test {
    function testTemplate() external {
        vm.prank(address(0x1));
        Template template = new Template();

        //
    }
}
