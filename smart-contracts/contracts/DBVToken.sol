// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import 'hardhat/console.sol';

contract DBVToken is ERC20, Ownable {
  address public contractOwner;

  constructor(uint256 _initialSupply)
    ERC20('Decentralized Blockchain Voting Token', 'DBV')
  {
    // console.log('DBV Token Constructor called');
    _mint(msg.sender, _initialSupply * (10**decimals()));
    contractOwner = msg.sender;
  }

  function mint(address to, uint256 supply) external onlyOwner {
    require(
      msg.sender == contractOwner,
      'Only contract owner can mint additional tokens'
    );
    _mint(to, supply * (10**decimals()));
  }
}
