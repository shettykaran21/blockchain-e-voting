// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '../util/BaseController.sol';
import '../util/ContractManager.sol';
import './UserStorage.sol';

contract UserController is BaseController {
  function createUser(
    bytes32 _username,
    bytes32 _firstName,
    bytes32 _lastName
  ) public returns (uint256) {
    ContractManager _manager = ContractManager(managerAddress);

    address _userStorageAddr = _manager.getAddress('UserStorage');
    UserStorage _storage = UserStorage(_userStorageAddr);

    require(_storage.addresses(msg.sender) == 0);
    require(_storage.usernames(_username) == 0);

    return _storage.createUser(msg.sender, _username, _firstName, _lastName);
  }
}
