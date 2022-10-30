// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "./27_GoodSamaritan.sol";
import "./27_GoodSamaritanHack.sol";

contract AttackerGoodSamaritanTest is Test {
    address hacker = makeAddr("hacker");
    GoodSamaritan goodSamaritan;
    Wallet wallet;
    Coin coin;
    uint256 totSupply;

    function setUp() external {
        goodSamaritan = new GoodSamaritan();
        wallet = goodSamaritan.wallet();
        coin = goodSamaritan.coin();
        totSupply = coin.balances(address(wallet));
    }

    function testGoodSamaritan() external {
        vm.startPrank(hacker);

        GoodSamaritanHack goodSamaritanHack = new GoodSamaritanHack();
        goodSamaritanHack.exploit(address(goodSamaritan));
        goodSamaritanHack.sweepToken(address(coin));

        assertEq(coin.balances(address(wallet)), 0);
        assertEq(coin.balances(address(hacker)), totSupply);
    }
}
