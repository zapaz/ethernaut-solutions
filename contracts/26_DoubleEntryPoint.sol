// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "instances/26_DoubleEntryPoint.sol";

contract DoubleEntryPointBot {
    address _forta;
    address _cryptoVault;

    constructor(address forta_, address cryptoVault_) public {
        _forta = forta_;
        _cryptoVault = cryptoVault_;
    }

    function handleTransaction(address user, bytes calldata msgData_) external {
        (, , address origSender) = abi.decode(msgData_[4:], (address, uint256, address));

        if (origSender == _cryptoVault) Forta(_forta).raiseAlert(user);
    }
}
