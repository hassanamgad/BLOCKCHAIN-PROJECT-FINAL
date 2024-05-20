// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ListStocks {
    struct StockListing {
        address owner;
        uint256 amount;
        uint256 price;
    }

    mapping(address => StockListing) public listings;

    event StockListed(address owner, uint256 amount, uint256 price);
    event DebugListing(address indexed owner, uint256 amount, uint256 price);

    function listStocks(uint256 _amount, uint256 _price) public {
        listings[msg.sender] = StockListing(msg.sender, _amount, _price);
        emit StockListed(msg.sender, _amount, _price);
        emit DebugListing(msg.sender, _amount, _price);
    }

    function getStockListing(address _owner) public view returns (StockListing memory) {
        return listings[_owner];
    }
}

