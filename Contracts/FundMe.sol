// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// get funds from users
//

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    
    uint256 public minimumUsd = 50 * 1e18;

    function fund() public payable{
// set a min fund amount in USD
    // 1. How do we send ETH to this contract?
    require(getConversionRate(msg.value) > minimumUsd, "Didn't send enough.");  // 1e18 = 1 * 10 ** 18;

    }

    function getPrice() public view returns (uint256) {
        // Goerli ETH / USD Address
        // https://docs.chain.link/docs/ethereum-addresses/
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );
        (, int256 price, , , ) = priceFeed.latestRoundData();
        // ETH/USD rate in 18 digit
        return uint256(price * 10000000000);
        // or (Both will do the same thing)
        // return uint256(answer * 1e10); // 1* 10 ** 10 == 10000000000
    }



    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    //function withdraw(){}
}