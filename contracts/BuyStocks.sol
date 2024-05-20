// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract BuyStocks {
    struct Stock {
        address owner;
        uint256 amount;
    }

    struct Company {
        string id;
        uint256 stockPrice;
        uint256 totalStocks;
    }

    mapping(address => Company) public companies;
    mapping(address => mapping(address => Stock)) public stocks; // companyAddress => userAddress => Stock
    address[] public companyAddresses; // Track company addresses

    event StockBought(address indexed buyer, address indexed company, uint256 amount, uint256 price);

    function addCompany(address _companyAddress, string memory _id, uint256 _stockPrice, uint256 _totalStocks) public {
        companies[_companyAddress] = Company(_id, _stockPrice, _totalStocks);
        companyAddresses.push(_companyAddress);
    }

    function buyStocks(address _companyAddress, uint256 _amount) public payable {
        Company storage company = companies[_companyAddress];
        require(company.totalStocks >= _amount, "Not enough stocks available.");
        uint256 totalPrice = company.stockPrice * _amount;
        require(msg.value >= totalPrice, "Insufficient funds to buy stocks.");

        stocks[_companyAddress][msg.sender].amount += _amount;
        stocks[_companyAddress][msg.sender].owner = msg.sender;
        company.totalStocks -= _amount;

        emit StockBought(msg.sender, _companyAddress, _amount, totalPrice);
    }

    function getStocks(address _companyAddress, address _owner) public view returns (uint256) {
        return stocks[_companyAddress][_owner].amount;
    }

    function getAllCompanies() public view returns (address[] memory) {
        return companyAddresses;
    }
}
