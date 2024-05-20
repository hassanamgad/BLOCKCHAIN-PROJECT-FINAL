const Company = artifacts.require("Company");

let expect;

before(async () => {
    const chai = await import('chai');
    expect = chai.expect;
});

contract('Company', (accounts) => {
    let companyInstance;

    before(async () => {
        companyInstance = await Company.deployed();
    });

    it('should set the correct owner', async () => {
        const owner = await companyInstance.getOwner();
        expect(owner).to.equal(accounts[0]);
    });

    it('should have the correct initial company details', async () => {
        const companyId = await companyInstance.getCompanyId();
        const companyName = await companyInstance.getCompanyName();
        const totalStocks = await companyInstance.getTotalStocks();


        expect(companyId).to.equal('REL');
        expect(companyName).to.equal('Reliance Industries');
        expect(totalStocks.toNumber()).to.equal(1000);
        expect(description).to.equal('Here goes my company description!');
    });

    
});