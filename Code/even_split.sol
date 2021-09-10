pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    
    address payable account_1;
    address payable account_2;
    address payable account_3;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        account_1 = _one;
        account_2 = _two;
        account_3 = _three;
    }
    
    function deposit() public payable {
        uint amount = msg.value / 3;
        account_1.transfer(amount);
        account_2.transfer(amount);
        account_3.transfer(amount);
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

// Contract - 0xE6D0600CB5E15152544f427Ca0f0745aD54aeC26

// tx - 0x2f41a9a8ac8e8b4379762412b2e54367461aa05935f621f2b45a6224991772c1
