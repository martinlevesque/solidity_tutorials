
pragma solidity ^0.5.13;

contract WorkingWithVariables {
    uint256 public myUint;
    bool public mybool;
    uint8 public smallNb;
    address public myAddr;
    string public myStr = 'hello world';

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function setMyBool(bool newVal) public {
        mybool = newVal;
    }

    function setMyAddr(address addr) public {
        myAddr = addr;
    }

    function getBalanceOf() public view returns(uint) {
        return myAddr.balance;
    }

    function incrSmallNb() public {
        ++smallNb;
    }

    function decrSmallNb() public {
        --smallNb;
    }

    function setMyStr(string memory str) public {
        myStr  = str;
    }

}
