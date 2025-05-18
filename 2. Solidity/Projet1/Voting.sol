// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

// On va importer le contrat Open Zeppelin Ownable
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract Voting is Ownable {

    // Le constructeur initialise l'owner a l'adresse qui déploie le contrat
    constructor() Ownable(msg.sender)
    {
        
    }

    // Déclaration des structs des votants et des propositions

    struct Voter {
        bool isRegistered;
        bool hasVoted;
        uint votedProposalId;
    }

    struct Proposal {
        string description;
        uint voteCount;
    }

    // Déclaration de l'enumeration des différents etats d'un vote

    enum WorkflowStatus {
        RegisteringVoters,
        ProposalsRegistrationStarted,
        ProposalsRegistrationEnded,
        VotingSessionStarted, 
        VotingSessionEnded, 
        VotesTallied 
    }

    WorkflowStatus public currentStatus;

    // Déclaration de l'id de la proposition gagnante
    uint winningProposalId;

    // Ou une fonction getWinner( a voir )

    // Déclaration des events du SC
    event VoterRegistered(address voterAddress);
    event VoterRemoved(address voterAddress); // A voir
    event WorkflowStatusChange(WorkflowStatus previousStatus, WorkflowStatus newStatus);
    event ProposalRegistered(uint proposalId);
    event Voted (address voter, uint proposalId);

    // L'admin enregistre une liste blanche
    mapping (address => Voter ) private whitelist;

    // tableau des propositions des voters

    Proposal[] public proposals;

    // modifier des voters

    modifier onlyVoters () {
        require (whitelist[msg.sender].isRegistered, "You are not a voter");
        _;
    }

    function whitelistVoters (address _voter) external onlyOwner {
        require (currentStatus == WorkflowStatus.RegisteringVoters, "You are not in the voters registering stage");
        require (!whitelist[_voter].isRegistered, "Voter already registered");
        whitelist[_voter] = Voter({
            isRegistered: true,
            hasVoted: false,
            votedProposalId: 0
        });
        emit VoterRegistered(_voter);

    }

    // Le voters peuvent voir si qqun est registered
    function isWhiteListed(address _voter) external view  onlyVoters  returns (bool)  {
        require (whitelist[_voter].isRegistered, "Voter not registered");
        return whitelist[_voter].isRegistered;
    }
    

    // L'admin commence la session d'enregistrement de la proposition


    function startProposals() external onlyOwner {
        require (currentStatus == WorkflowStatus.RegisteringVoters, "You need to register Voters first");
        currentStatus = WorkflowStatus.ProposalsRegistrationStarted;
        emit WorkflowStatusChange(WorkflowStatus.RegisteringVoters, WorkflowStatus.ProposalsRegistrationStarted);
    }


    // fonction getProposal

    function getProposal(uint256 _proposalId) external view onlyVoters returns (string memory _description) {
        require(proposals.length > 0 , "No Proposals to show");
        require(_proposalsId < proposals.length, "No Proposal with this id");

        _description = proposals[_proposalId].description;
        return _description ;
    
    }


    // Les electeurs registered enregistrent leurs propositions

    function registerProposal (string memory _description) external onlyVoters {
        require (currentStatus == WorkflowStatus.ProposalsRegistrationStarted, "Voters registration stage is not finished");
        
        proposals.push(Proposal ({description: _description, voteCount: 0}));

    }

    // L'admin met fin a la session de propositions de vote

    function EndProposals () external onlyOwner {
        require (currentStatus == WorkflowStatus.ProposalsRegistrationStarted, "Proposal Registration stage is not finished");
        currentStatus = WorkflowStatus.ProposalsRegistrationEnded;
        emit WorkflowStatusChange(WorkflowStatus.ProposalsRegistrationStarted, WorkflowStatus.ProposalsRegistrationEnded);
    }

    // L'admin Lance la session de vote
    function startVoting() external onlyOwner {
        require(currentStatus == WorkflowStatus.ProposalsRegistrationEnded, "Proposal Registration stage is not ended");
        currentStatus = WorkflowStatus.VotingSessionStarted;
        emit WorkflowStatusChange(WorkflowStatus.ProposalsRegistrationEnded, WorkflowStatus.VotingSessionStarted);
    }

    // Les voteurs votent
    function voteForProposal(uint _proposalId) external onlyVoters {
        require(currentStatus == WorkflowStatus.VotingSessionStarted, "Vote session is not started");
        require(!whitelist[msg.sender].hasVoted, "Already voted");
        
        proposals[_proposalId].voteCount ++ ;
        whitelist[msg.sender].hasVoted = true;
        whitelist[msg.sender].votedProposalId = _proposalId ;
        emit Voted(msg.sender,_proposalId);

    }

    // L'admin met fin a la session de vote
    function EndVoting() external onlyOwner {
        require(currentStatus == WorkflowStatus.VotingSessionStarted, "Vote session is not started");
        currentStatus = WorkflowStatus.VotingSessionEnded;
        emit WorkflowStatusChange(WorkflowStatus.VotingSessionStarted, WorkflowStatus.VotingSessionEnded);
    }

    // L'admin comptabilise les votes

    function tallyVotes() external onlyOwner {
        require(currentStatus == WorkflowStatus.VotingSessionEnded, "Vote session is not ended");
        currentStatus = WorkflowStatus.VotesTallied;
        emit WorkflowStatusChange(WorkflowStatus.VotingSessionEnded, WorkflowStatus.VotesTallied);
    
        uint256 highestCount=0 ;

        for (uint256 i=0; i<proposals.length ;i++) {
            if (proposals[i].voteCount > highestCount ) {
                highestCount = proposals[i].voteCount;
                winningProposalId = i ;  
            }
        }
    }

    // Mise a disposition de la proposition gagnante pour tout le monde

    function getWinner() external view returns(uint256)
    {
        require( currentStatus == WorkflowStatus.VotesTallied, "Voting sesssion is not tallied");
        return winningProposalId;
    }

}