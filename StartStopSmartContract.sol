
pragma solidity ^0.5.13;

contract StartStopUpdateExample {

    address public owner;

    bool public paused;

    constructor() public {
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "Not the owner");
        paused = _paused;
    }

    function withdrawAllMoney(address payable to) public {
        require(msg.sender == owner, "Required to be an owner");
        require(!paused, "Contract is paused");

        to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable to) public {
        require(msg.sender == owner, "Not owner");
        selfdestruct(to);
    }
}
