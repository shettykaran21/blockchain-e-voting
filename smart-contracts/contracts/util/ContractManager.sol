// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/access/Ownable.sol';

contract ContractManager is Ownable {
  mapping(string => address) addresses;

  function setAddress(string memory _name, address _address) public {
    addresses[_name] = _address;
  }

  function getAddress(string memory _name) public view returns (address) {
    return addresses[_name];
  }

  function deleteAddress(string memory _name) public {
    addresses[_name] = address(0);
  }
}
