// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackerTemplate {
    function exploit(address template) public payable {
        (bool success, ) = payable(template).call{value: 0.1 ether, gas: 1000000}("");
        require(success, "transfer failed :-()");
    }
}
