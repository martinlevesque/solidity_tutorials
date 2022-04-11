
pragma solidity ^0.5.13;

contract ExceptionExample {

    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable to, uint amount) public {
        require(amount <= balanceReceived[msg.sender], "Not enough ether");

        balanceReceived[msg.sender] -= amount;
        to.transfer(amount);
    }

}
