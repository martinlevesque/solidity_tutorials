pragma solidity ^0.8.0;

// Ownable allows to check that the owner only can use certain functions (with onlyOwner keyword)
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

// SPDX-License-Identifier: UNLICENSED

contract SharedWallet is Ownable {

    uint public balanceReceived;

    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }

    fallback() external payable
    {
        //balanceReceived += msg.value;
    }

    // function for receiving an amount passed in the message value
    event Received(address, uint);
    receive() external payable {
        balanceReceived += msg.value;
        emit Received(msg.sender, msg.value);
    }

    //function getBalance() public view returns(uint) {
    //    return address(this).balance;
    //}

}
