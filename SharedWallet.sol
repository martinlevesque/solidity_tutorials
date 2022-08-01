pragma solidity ^0.8.0;

// Ownable allows to check that the owner only can use certain functions (with onlyOwner keyword)
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

// SPDX-License-Identifier: UNLICENSED

contract SharedWallet is Ownable {

    mapping(address => uint) public allowance;

    function isOwner() public view returns(bool) {
        return owner() == msg.sender;
    }

    function addAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] = _amount;
    }

    function reduceAllowance(address _who, uint _amount) internal {
        allowance[_who] -= _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        require(owner() == msg.sender || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored");

        // when it's a non owner, decrease its allowance
        if (!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }

        _to.transfer(_amount);
    }

    // function for receiving an amount passed in the message value
    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

}
