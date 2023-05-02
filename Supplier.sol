// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Item.sol";

//Should probably use SafeMath

contract Supplier is ItemFactory {

    address owner;
    Item[] public inventory;
    
    event ItemAddedToInventory(string _name, address _owner, uint _itemId);

    constructor(address _owner){
        owner = _owner;
    }

    modifier isOwner(address _owner){
        require(owner == _owner);
        _;
    }

    function addItemToInventory(string memory _name, address _owner) public isOwner(_owner) {
        uint itemId = createItem(_name, _owner);
        inventory.push(items[itemId]);
        emit ItemAddedToInventory(_name, _owner, itemId);
    }

    function getInventory() public view returns(Item[] memory){
        return(inventory);
    }


    //We assume any item in the inventory is for sale
    function sellItem(string memory _name) public returns(Item memory){
        for (uint i = 0; i<inventory.length; i++){
            if(keccak256(bytes(inventory[i].name)) == keccak256(bytes(_name))) {
                Item memory ret = inventory[i];
                inventory[i] = inventory[inventory.length - 1];
                inventory.pop();
                return ret;
            }
        }
        require(false);
    }

    
}