// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/21_Shop.sol";
import "contracts/21_Shop.sol";

contract AttackerShopTest is Test {
    function testShop() external {
        vm.prank(address(1));
        Shop shop = new Shop();
        AttackerShop attackerShop = new AttackerShop();

        assertTrue(shop.price() == 100);
        attackerShop.exploit(address(shop));
        assertTrue(shop.price() == 0);
    }
}
