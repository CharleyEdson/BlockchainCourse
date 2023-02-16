// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // stable version

import "./SimpleStorage.sol";


contract ExtraStorage is SimpleStorage {
    // override functions
    // virtual override
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}