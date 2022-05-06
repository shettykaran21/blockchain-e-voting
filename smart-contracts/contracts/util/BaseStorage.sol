// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/access/Ownable.sol';

contract BaseStorage is Ownable {
  address public controllerAddress;

  modifier onlyController() {
    require(
      msg.sender == controllerAddress,
      'Only the controller is allowed to call this function'
    );
    _;
  }

  function setControllerAddress(address _controllerAddress) public onlyOwner {
    controllerAddress = _controllerAddress;
  }
}
