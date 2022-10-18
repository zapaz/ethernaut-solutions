// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/99_template.sol";
import "forge-std/Test.sol";

contract AttackerTemplateTest is Test {
    function testTemplate() external {
        vm.prank(address(0x1));
        Template template = new Template();

        //
    }
}
