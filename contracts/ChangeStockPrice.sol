// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ChangeStockPrice {
    struct StockPrice {
        address owner;
        uint256 price;
    }

    mapping(address => StockPrice) public prices;

    event StockPriceChanged(address owner, uint256 newPrice);

    function changePrice(uint256 _newPrice) public {
        prices[msg.sender].price = _newPrice;
        prices[msg.sender].owner = msg.sender;

        emit StockPriceChanged(msg.sender, _newPrice);
    }

    function getStockPrice(address _owner) public view returns (uint256) {
        return prices[_owner].price;
    }
}
