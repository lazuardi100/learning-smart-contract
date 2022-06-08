// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract marketplace{
    struct goods{
        string title;
        string description;
        uint price;
        address owner;
    }

    struct user{
        string name;
        address user_address;
        bool exist;
    }
    mapping (string=>goods) list_goods;
    mapping (address => user) list_users;
    address payable currentUser;

    modifier onlyOwner(){
        require(msg.sender == currentUser);
        _;
    }

    constructor(){
        currentUser = payable(msg.sender);
    }

    function user_register(string memory name) public onlyOwner returns(string memory) {
        if (check_user(currentUser)){
            return "User exist!";
        } else {
            list_users[currentUser] = user(name,currentUser,true);
            return "User registered";
        }
    }

    function check_user(address payable user_address) private returns(bool){
        list_users[user_address].exist;
    }

    function check_address() public onlyOwner returns(bool){
        return check_user(currentUser);
    }

    function get_current_user() public view returns(string memory){
        return list_users[currentUser].name;
    }
}