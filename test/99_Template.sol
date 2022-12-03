// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/99_Template.sol";

contract AttackerTemplateTest is Test {
    function testTemplate() external {
        vm.prank(address(1));
        Template template = new Template();

        //
    }
}
