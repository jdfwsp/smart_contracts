pragma solidity ^0.5.0;

contract TieredProfitSplitter {
    
    address payable account_1;
    address payable account_2;
    address payable account_3;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        account_1 = _one;
        account_2 = _two;
        account_3 = _three;
    }
    
    function deposit() public payable {
        uint amount = msg.value / 100;
        account_1.transfer(amount * 60);
        account_2.transfer(amount * 25);
        account_3.transfer(amount * 15);
        msg.sender.transfer(address(this).balance);
    }
    
    function balance() public view returns(uint) {
        return address(this).balance;
    }
    
    function() external payable {
        deposit();
    }
        
}

// 1 - 0xDdEd40054AdfcE7e09B549c7E0C7493D6a6eD2E8
// 2 - 0x3Df201B70cAAEC12b9a5023CeB1a895289633cf9
// 3 - 0x7480CFC39C77F80C5E3a304a6d2A60Dc3Ec926cA

// Contract - 0xa2EdF6ef53D36b7ef18C2c899e22CB7db2c992ef

// tx - 0x2889967721ef7d94c5b42ac3d15339c2fd79c29a4e6e057cb3f53313f17678be
