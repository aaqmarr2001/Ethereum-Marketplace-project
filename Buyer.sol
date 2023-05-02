// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Item.sol";

//Should probably use SafeMath

contract Buyer is ItemFactory {
    
    address owner;
    Item[] myItems;
    
    event BoughtItem(Item _item);

    constructor(address _owner){
        owner = _owner;
    }

    function addItem(Item memory _item) public {
        myItems.push(_item);
        emit BoughtItem(_item);
    }

    function getItems() public view returns(Item[] memory) {
        return(myItems);
    }

}