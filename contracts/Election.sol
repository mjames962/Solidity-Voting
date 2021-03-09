pragma solidity >=0.4.22 <0.8.0;

contract Election {

  struct Candidate {
    uint id;
    string name;
    uint totalVotes;
  }

  mapping(uint => Candidate) public candidates;
  mapping(address => bool) public voted;

    event votedEvent(
        uint indexed _candidateID
    );

  uint public totalCandidates = 0;

  constructor() public {
    createCandidate("Candidate 1");
    createCandidate("Candidate 2");
  }

  function createCandidate(string memory _name) private {
    totalCandidates ++;
    candidates[totalCandidates] = Candidate(totalCandidates, _name, 0);
  }

  function vote(uint _candidateID) public {
    require(!voted[msg.sender]);

    require(_candidateID > 0 && _candidateID <= totalCandidates);

    voted[msg.sender] = true;
    candidates[_candidateID].totalVotes ++;

    emit votedEvent(_candidateID);

  }
}
