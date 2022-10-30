// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/27_GoodSamaritan.sol";

contract AttackerGoodSamaritanTest is Test {
    function testGoodSamaritan() external {
        vm.prank(address(1));
        GoodSamaritan goodSamaritan = new GoodSamaritan();

        //
    }
}
