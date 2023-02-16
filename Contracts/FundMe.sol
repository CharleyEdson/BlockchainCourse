// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// get funds from users
//


contract FundMe {
    
    uint256 public minimumUsd = 50;

    function fund() public payable{
// set a min fund amount in USD
    // 1. How do we send ETH to this contract?
    require(msg.value > minimumUsd, "Didn't send enough.");  // 1e18 = 1 * 10 ** 18;

    }

    

    //function withdraw(){}
}