// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/access/Ownable.sol';

contract BaseController is Ownable {
  address managerAddress;

  function setManagerAddress(address _managerAddress) public onlyOwner {
    managerAddress = _managerAddress;
  }
}
