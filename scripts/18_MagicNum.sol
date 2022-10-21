// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "instances/18_MagicNum.sol";

interface IAttackerMagicNum {
    function whatIsTheMeaningOfLife() external pure returns (uint256);
}

contract AttackerMagicNumScript is Script {
    MagicNum magicNum = MagicNum(vm.envAddress("INSTANCE"));

    function run() external {
        vm.startBroadcast();

        // Bytecode get from contracts/18_MagicNum.yul
        bytes memory bytecode = hex"600a80600d600039806000f3fe602a60005260206000f3";

        address attackermagicNum;
        assembly {
            attackermagicNum := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        uint256 n = IAttackerMagicNum(attackermagicNum).whatIsTheMeaningOfLife();
        console.log("testMagicNum ~ n", n);

        magicNum.setSolver(attackermagicNum);

        vm.stopBroadcast();
    }
}
