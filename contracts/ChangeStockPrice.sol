// Specifies the version of the Solidity compiler that this contract will use, 
// indicating compatibility with versions from 0.7.0 to below 0.9.0.
// SPDX-License-Identifier: MIT - This line declares that the contract is licensed under the MIT license.
pragma solidity >=0.7.0 <0.9.0;

// Define a new contract named ChangeStockPrice
contract ChangeStockPrice {

    struct StockPrice {
        address owner;  // Ethereum address of the stock's owner
        uint256 price;  // Current price of the stock
    }

    // A mapping from an address to a StockPrice struct. This mapping will store the stock price 
    // associated with an owner's address.
    mapping(address => StockPrice) public prices;

    // Event declaration that will emit information when a stock's price is changed.
    event StockPriceChanged(address owner, uint256 newPrice);

    // Public function to change the price of a stock associated with the sender's address
    function changePrice(uint256 _newPrice) public {
        prices[msg.sender].price = _newPrice;  // Update the price in the mapping for the sender's address
        prices[msg.sender].owner = msg.sender; // Ensure the owner field is set correctly for the sender's address

        emit StockPriceChanged(msg.sender, _newPrice); // Emit an event notifying that the price has been changed
    }


    function getStockPrice(address _owner) public view returns (uint256) {
        return prices[_owner].price; // Return the stock price associated with the owner address
    }
}
