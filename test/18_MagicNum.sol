// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/18_MagicNum.sol";

interface IAttackerMagicNum {
    function whatIsTheMeaningOfLife() external pure returns (uint256);
}

contract AttackerMagicNumTest is Test {
    function testMagicNum() external {
        // Bytecode get from contracts/18_MagicNum.yul
        bytes memory bytecode = hex"600a80600d600039806000f3fe602a60005260206000f3";

        address attackermagicNum;
        assembly {
            attackermagicNum := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        uint256 n = IAttackerMagicNum(attackermagicNum).whatIsTheMeaningOfLife();
        assertEq(n, 42);
    }
}
