pragma solidity ^0.5.0;

contract DeferredEquityPlan {
    
    // Creates addresses and other variables needed
    address human_resources;
	address payable employee; 

    bool active = true; 

    uint public total_shares = 1000;
    uint public annual_distribution = 250;
	uint public distributed_shares;
	
    uint start_time = now; 
    uint unlock_time = now + 365 days;

	// Input one employee address to deploy contract
    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

	// Distributes shares to employee based on how long the contract is active
    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");

        require(unlock_time <= now);
        require(distributed_shares < total_shares);
        
        unlock_time += 365 days;

        distributed_shares = ((now - start_time) / 365 days) * annual_distribution;

        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

	// Allows HR or employee only to deactivate contract
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

    function() external payable {
        revert("Do not send Ether to this contract!");
    }

}

// 1 - 0xDdEd40054AdfcE7e09B549c7E0C7493D6a6eD2E8

// Contract - 0x3eEee0dF0422b46ecF85b17fcafa2Cb098638F4D
