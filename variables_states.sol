
pragma solidity ^0.5.13;

contract WorkingWithVariables {
    uint256 public myUint;
    bool public mybool;
    uint8 public smallNb;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function setMyBool(bool newVal) public {
        mybool = newVal;
    }

    function incrSmallNb() public {
        ++smallNb;
    }

    function decrSmallNb() public {
        --smallNb;
    }

}
