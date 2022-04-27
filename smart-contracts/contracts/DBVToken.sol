// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract DBVToken is ERC20 {
  constructor(uint256 initialSupply)
    ERC20('Decentralized Blockchain Voting Token', 'DBV')
  {
    _mint(msg.sender, initialSupply);
  }
}
