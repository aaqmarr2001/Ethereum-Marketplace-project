// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Should probably use SafeMath
import "hardhat/console.sol";

contract ItemFactory {

    struct Item{
        uint id;
        string name;
        address owner;
    }

    Item[]  items;
    uint  id = 0;
    mapping (uint => address) itemsToOwner;

    event ItemCreated(string _name, address _owner, uint _itemId);
    event OwnershipChange(uint _itemId, address _oldOwner, address _newOwner);

    function createItem(string memory _name, address _owner) internal returns(uint) {
        items.push(Item(id,_name,_owner));
        itemsToOwner[id] = _owner;
        id++;
        emit ItemCreated(_name,_owner,id);
        return(id-1);
    }



}