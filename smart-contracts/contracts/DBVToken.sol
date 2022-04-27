// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import 'hardhat/console.sol';

contract DBVToken is ERC20 {
  address public admin;

  constructor(uint256 initialSupply)
    ERC20('Decentralized Blockchain Voting Token', 'DBV')
  {
    console.log('DBV Token Constructor called');
    _mint(msg.sender, initialSupply * (10**decimals()));
    admin = msg.sender;
  }

  function mint(address to, uint256 supply) external {
    require(msg.sender == admin, 'Only admin can mint token');
    _mint(to, supply);
  }
}
