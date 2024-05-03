// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Sample_Token{
    string public name;
    string public symbol;
    uint public totalSupply;

    mapping(address => uint) private balance;

    event Transfer(address from,address to,uint val);

    constructor(string memory _name,string memory _symbol,uint _initSupply){
        name = _name;
        symbol = _symbol;
        totalSupply = _initSupply *(10*18);
        balance[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function balanceOf(address _owner) public view returns(uint){
        return balance[_owner];
    }

    function transfer(address _to,uint _value) public returns(bool){
        require(_to != address(0), "Cannot transfer");
        require(balance[msg.sender] >= _value,"Insufficient balance");

        balance[msg.sender] -= _value;
        balance[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}