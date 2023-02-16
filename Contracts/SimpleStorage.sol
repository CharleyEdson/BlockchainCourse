// SPDX-License-Identifier: MIT
pragma solidity 0.8.7; // stable version

contract SimpleStorage {
    // this gets initialized to zero!
    uint256 public favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

}

// 0xd9145CCE52D386f254917e481eB44e9943F39138 - first deployed contract address