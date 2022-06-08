// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract firstContract{
    Person[] public people;
    
    struct Person{
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname) public{
        people.push(Person(_firstname, _lastname));
    }
}