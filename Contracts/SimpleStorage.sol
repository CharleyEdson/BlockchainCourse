// SPDX-License-Identifier: MIT
pragma solidity 0.8.7; // stable version

contract SimpleStorage {
    // this gets initialized to zero!
    uint256 favoriteNumber;
    // Ex using variable creation: People public person = People({favoriteNumber: 2, name: "Charley"});
    
    // Creating a struct of people. People object.
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //uint256[] public favoriteNumbersList;
    People[] public people;

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // 1st way
        // people.push(People(_favoriteNumber, _name));  
        //2nd way
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        // people.push(newPerson);
        //3rd way
        People memory newPerson = People(_favoriteNumber, _name);
        people.push(newPerson);
    }

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;

    }

    // view & pure functions don't cost gas
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    // pure function
    function add() public pure returns (uint256) {
        return (1+1);
    }




}

// 0xd9145CCE52D386f254917e481eB44e9943F39138 - first deployed contract address