pragma solidity >=0.4.22 <0.8.0;

contract Election{

        //string public candidate;

        struct Candidate{

            uint id;
            string name;
            uint votecount;
        }
    mapping (address => bool) public voters;

    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    event  votedEvent(uint indexed _candidateId);

        constructor () public {

         //   candidate = "Candidate 1";
         addCandidate("IVAR the Boneless");
         addCandidate("AMIR THE AM");

        }


    function addCandidate(string memory _name) private {

        candidatesCount ++;
        candidates[candidatesCount]= Candidate(candidatesCount,_name,0);
    }

    function vote (uint _candidateId ) public {

        require(!voters[msg.sender]);

        require(_candidateId > 0 && _candidateId<=candidatesCount);
 
        voters[msg.sender]= true;

        candidates[_candidateId].votecount++;

       emit  votedEvent(_candidateId);
    }

}