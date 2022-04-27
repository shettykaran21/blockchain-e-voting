// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Ballot {
  struct Voter {
    uint256 weight;
    bool voted;
    uint256 vote;
  }

  struct Candidate {
    bytes32 name;
    uint256 voteCount;
  }

  address public contractOwner;

  mapping(address => Voter) public voters;

  Candidate[] public candidates;

  constructor(bytes32[] memory candidateNames) {
    contractOwner = msg.sender;
    voters[contractOwner].weight = 1;

    for (uint256 i = 0; i < candidateNames.length; i++) {
      candidates.push(Candidate({name: candidateNames[i], voteCount: 0}));
    }
  }

  function vote(uint256 candidate) external {
    Voter storage sender = voters[msg.sender];
    require(sender.weight != 0, 'Has no right to vote');
    require(!sender.voted, 'Already voted.');
    sender.voted = true;
    sender.vote = candidate;

    candidates[candidate].voteCount += sender.weight;
  }
}
