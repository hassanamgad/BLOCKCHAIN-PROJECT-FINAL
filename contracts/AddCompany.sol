// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AddCompany {
    struct Company {
        string id;
        address companyAddress;
    }

    Company[] public companies;
    address public owner;

    event CompanyAdded(string id, address companyAddress);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addCompany(string memory _id, address _companyAddress) public onlyOwner {
        companies.push(Company(_id, _companyAddress));
        emit CompanyAdded(_id, _companyAddress);
    }

    function getCompanies() public view returns (Company[] memory) {
        return companies;
    }
}
