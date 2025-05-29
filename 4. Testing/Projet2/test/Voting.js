const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { expect } = require("chai");


describe("Voting", function () {
  async function deployVotingFixture() {
    const [owner, voter1, voter2, voter3] = await ethers.getSigners();
    const Voting = await ethers.getContractFactory("Voting");
    const voting = await Voting.deploy();

    return { voting, owner, voter1, voter2, voter3 };
  }

  describe("Deployment", function () { 

    it("Should set the owner correctly", async function () {
      const { voting, owner } = await loadFixture(deployVotingFixture);
      expect(await voting.owner()).to.equal(owner.address);
    });
    it("Should initialize with the correct state", async function () {
      const { voting } = await loadFixture(deployVotingFixture);
      expect(await voting.workflowStatus()).to.equal(0); // 0 = RegisteringVoters
    });

    describe("Add Voter", function () {
        
      it("Should allow owner to add a voter ", async function () {
        const { voting, voter1 } = await loadFixture(deployVotingFixture);
        await voting.addVoter(voter1.address);
        const voterInfo = await voting.connect(voter1).getVoter(voter1.address);
        expect(voterInfo.isRegistered).to.equal(true);
      });

      it("Should emit an event when a voter is registered", async function () {
        const { voting, voter1 } = await loadFixture(deployVotingFixture);
        await expect(voting.addVoter(voter1.address))
          .to.emit(voting, "VoterRegistered")
          .withArgs(voter1.address);
      });

      it("Should not allow non-owner to add a voter", async function () {
        const { voting, voter1, voter2 } = await loadFixture(deployVotingFixture);
        await expect(voting.connect(voter1).addVoter(voter2.address))
          .to.be.reverted;
      });

      it ("Should not allow adding the same voter twice", async function () {
        const { voting, voter1 } = await loadFixture(deployVotingFixture);
        await voting.addVoter(voter1.address);
        await expect(voting.addVoter(voter1.address))
          .to.be.revertedWith("Already registered");
      });

      it("Should not allow owner adding a voter when not in Registering Stage" , async function () {
        const { voting, owner, voter1 } = await loadFixture(deployVotingFixture);
        await voting.startProposalsRegistering();
        await expect(voting.addVoter(voter1.address))
          .to.be.revertedWith("Voters registration is not open yet");
      });
    });
    describe("addProposal", function () {
      it ("Should voter can add a proposal", async function () {
        const { voting, voter1 } = await deployVotingFixture();
        await voting.addVoter(voter1.address);
        await voting.startProposalsRegistering();
        await voting.connect(voter1).addProposal("Proposal 1");
        const proposal = await voting.connect(voter1).getOneProposal(1); // ID 0 is reserved for no proposal
        expect(proposal.description).to.equal("Proposal 1");
      });
    });
  });
});

