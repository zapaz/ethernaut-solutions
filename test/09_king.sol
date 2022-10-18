// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/09_king.sol";
import "contracts/09_king.sol";

contract AttackerKingTest is Test {
    function testKing(uint256 prize) external {
        vm.assume(prize > 0);
        vm.assume(prize < 2**18);

        King king = new King{value: prize}();
        AttackerKing attackerKing = new AttackerKing();

        console.log("king1", king._king());
        assertEq(king._king(), address(this));

        attackerKing.exploit{value: prize}(address(king));

        assertEq(king._king(), address(attackerKing));
        console.log("king2", king._king());
    }

    receive() external payable {}
}
