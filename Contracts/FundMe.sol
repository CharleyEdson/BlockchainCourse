// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// get funds from users
//
import "./PriceConverter.sol";


// 962,644 gas to create
// 940,184 gas saved with constant 

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;
// 351 - constant
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable {
        // set a min fund amount in USD
        // 1. How do we send ETH to this contract?
        require(
            msg.value.getConversionRate() > MINIMUM_USD,
            "Didn't send enough."
        ); // 1e18 = 1 * 10 ** 18;
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner{
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
    // transfer-if fail reverts contract. 2300 gas limit
    //msg.sender = address
    // payable(msg.sender) = payable address
    // payable(msg.sender).transfer(address(this).balance);
    // send returns a boolean. 2300 gas limit
    // bool sendSuccess = payable(msg.sender).send(address(this).balance);
    // require(sendSuccess, "send failed");
    //call no gas limit. forward all gas or set gas, returns bool. lower level.  Don't need the bytes yet.
    (bool callSuccess, /*bytes memory dataReturned*/) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "Call failed");
    revert();
    }

    modifier onlyOwner {
        // require(msg.sender == i_wner, NotOwner());
        if(msg.sender != i_owner) { revert NotOwner(); }
        _;
    }
    // what happens if someone sends this contract ETH without calling the fund function?

    receive() external payable {
        fund();
    }
    fallback() external payable{
        fund();
    }

}
