pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

    uint public initialBalance = 1000;

    // Test for failing conditions in this contracts:
    // https://truffleframework.com/tutorials/testing-for-throws-in-solidity-tests

    function testInitialState() public {

        SupplyChain sc = new  SupplyChain();
        (string memory name, uint256 sku, uint256 price, uint256 state, address seller, address buyer) = sc.fetchItem(0);
        Assert.equal(bytes(name).length, 0, "Name should be empty.");
        Assert.equal(sku,0,"Sku should be default (0)");
        Assert.equal(price,0, "Price should be invalid (0)");
        Assert.equal(state,0, "State should be (0)");
        Assert.equal(seller,address(0), "Seller should be empty address (0)");
        Assert.equal(buyer,address(0),"Buyer should be empty address (0)");
    }

    function testListItem() public {
        SupplyChain sc = new SupplyChain();
        Assert.equal(sc.addItem("test", 100),true,"Adding an item for sale should return true");
        (string memory name, uint256 sku, uint256 price, uint256 state, address seller, address buyer) = sc.fetchItem(0);
        Assert.equal(name, "test", "Name should 'test'.");
        Assert.equal(sku,0,"Sku should be 0");
        Assert.equal(price,100, "Price should be 100");
        Assert.equal(state,0, "State should be 0");
        Assert.equal(seller,address(this), "Seller should be this contract.");
        Assert.equal(buyer,address(0),"Buyer should be empty address (0)");
    }


    // buyItem

    // test for failure if user does not send enough funds
    // test for purchasing an item that is not for Sale

    // shipItem

    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold

    // receiveItem

    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped

}
