// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/26_DoubleEntryPoint.sol";
import "contracts/26_DoubleEntryPoint.sol";

contract AttackerDoubleEntryPointTest is Test {
    address player = makeAddr("player");
    address hacker = makeAddr("hacker");

    Forta forta;
    LegacyToken legacyToken;
    CryptoVault cryptoVault;
    DoubleEntryPoint doubleEntryPoint;

    function setUp() external {
        forta = new Forta();
        legacyToken = new LegacyToken();
        cryptoVault = new CryptoVault(player);
        doubleEntryPoint = new DoubleEntryPoint(address(legacyToken), address(cryptoVault), address(forta), player);

        cryptoVault.setUnderlying(address(doubleEntryPoint));
        legacyToken.delegateToNewContract(DelegateERC20(doubleEntryPoint));
        legacyToken.mint(address(cryptoVault), 100 ether);

        assertEq(address(LegacyToken(legacyToken).delegate()), address(doubleEntryPoint));
    }

    function testDoubleEntryPoint() external {
        assertFalse(doubleEntryPoint.balanceOf(address(cryptoVault)) == 0);
        cryptoVault.sweepToken(legacyToken);
        assertTrue(doubleEntryPoint.balanceOf(address(cryptoVault)) == 0);
    }

    function testFailDoubleEntryPoint() external {
        DoubleEntryPointBot doubleEntryPointBot = new DoubleEntryPointBot(address(forta), address(cryptoVault));

        vm.prank(player);
        forta.setDetectionBot(address(doubleEntryPointBot));

        cryptoVault.sweepToken(legacyToken);
    }
}
