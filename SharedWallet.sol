
pragma solidity ^0.8.0;

import "./Allowance.sol";

// SPDX-License-Identifier: UNLICENSED

contract SharedWallet is Allowance {

    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);

    function isOwner() public view returns(bool) {
        return owner() == msg.sender;
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored");

        // when it's a non owner, decrease its allowance
        if (!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }

        emit MoneySent(_to, _amount);

        _to.transfer(_amount);
    }

    function renounceOwnership() public override onlyOwner view {
        revert("Can't renounce ownership");
    }

    receive() external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }

}
