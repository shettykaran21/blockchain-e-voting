// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '../util/BaseStorage.sol';

contract UserStorage is BaseStorage {
  mapping(uint256 => Profile) public profiles;
  mapping(address => uint256) public addresses;
  mapping(bytes32 => uint256) public usernames;

  struct Profile {
    uint256 id;
    bytes32 username;
    bytes32 firstName;
    bytes32 lastName;
  }

  uint256 latestUserId = 0;

  function createUser(
    address _address,
    bytes32 _username,
    bytes32 _firstName,
    bytes32 _lastName
  ) public onlyController returns (uint256) {
    latestUserId++;

    profiles[latestUserId] = Profile(
      latestUserId,
      _username,
      _firstName,
      _lastName
    );

    addresses[_address] = latestUserId;
    usernames[_username] = latestUserId;

    return latestUserId;
  }
}
