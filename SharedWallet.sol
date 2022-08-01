pragma solidity ^0.6.0;

// SPDX-License-Identifier: UNLICENSED

contract SharedWallet {

    address public owner;
    uint public balanceReceived;

    constructor() public {
        owner = msg.sender;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }

    fallback() external payable
    {
        balanceReceived += msg.value;
    }

    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    //function getBalance() public view returns(uint) {
    //    return address(this).balance;
    //}

}
