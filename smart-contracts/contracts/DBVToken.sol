// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import 'hardhat/console.sol';

contract DBVToken is ERC20, Ownable {
  constructor(uint256 initialSupply)
    ERC20('Decentralized Blockchain Voting Token', 'DBV')
  {
    // console.log('DBV Token Constructor called');
    _mint(msg.sender, initialSupply * (10**decimals()));
  }

  function mint(address to, uint256 supply) external onlyOwner {
    _mint(to, supply);
  }
}
