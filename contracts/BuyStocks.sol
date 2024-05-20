
// from 0.7.0 (inclusive) to less than 0.9.0 (exclusive)
// SPDX-License-Identifier: MIT - This states that the contract uses the MIT license.
pragma solidity >=0.7.0 <0.9.0;

// Define a new contract named AddCompany
contract AddCompany {
    // Define a struct named Company which will store data about each company
    struct Company {
        string id;               // Unique identifier for the company, stored as a string
        address companyAddress;  // Ethereum address associated with the company
    }

    // An array of Company structs, publicly accessible, holds the list of companies added
    Company[] public companies;

    // Variable to store the Ethereum address of the contract's owner
    address public owner;

    // Event declaration that will emit information about added companies
    // Useful for external listeners or front-end applications
    event CompanyAdded(string id, address companyAddress);

    // A modifier named onlyOwner to restrict access so only the contract's owner can execute certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function."); // Check if the function caller is the owner
        _; // Continuation character for the function to resume execution after the require statement
    }

    // Constructor function that sets the contract deployer as the owner
    // Betkon mara wahda bas lama ba3ml deploy     
    constructor() {
        owner = msg.sender; // Set the owner as the sender of the contract creation transaction
    }

    // Public function to add a new company to the list
    // Only callable by the contract's owner due to the onlyOwner modifier
    function addCompany(string memory _id, address _companyAddress) public onlyOwner {
        companies.push(Company(_id, _companyAddress)); // Pushes a new Company struct to the companies array
        emit CompanyAdded(_id, _companyAddress); // Emits an event with the new company's details
    }

    // Public view function to return the list of all companies
    // 'view' indicates that this function does not alter the state on the blockchain
    function getCompanies() public view returns (Company[] memory) {
        return companies; // Returns the full array of companies
    }
}
